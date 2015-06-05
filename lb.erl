-module(lb).
-author("Kirill Sysoev <kirill.sysoev@gmail.com>").

-export([
        lb_auth/1
       ,get_lbuid_by_password/3
       ,get_lbuid_by_username/2
       ,get_login_by_lbuid/2
       ,accounts_table/3
       ,user_type/1
       ,get_accounts_emails/1
       ,get_address_ids_by_type/2
       ,format_address/2
       ,agreements_table/1
       ,monthly_fees/1
       ,account_status/1
       ,is_prepaid/1
       ,account_balance/1
       ,calc_curr_month_exp/1
       ,account_payments/2
       ,is_service_provided/2
       ,accounts_tariffs_by_type/2
       ,tariff_descr_by_tar_id/2
       ,numbers_by_vg_id/2
       ,ip_addresses_by_vg_id/2
       ,get_freenumber_params/2
       ,get_free_freenumber_params/2
       ,set_passwd/4
       ,get_userdata_by_email/2
       ,get_userdata_by_email_and_login/3
       ,get_calls_list_by_day/5
       ,credit_able/1
       ,credit_info/1
       ,acount_status/1
       ,credit_allowed/1
       ,get_main_agrm_id/1
       ,make_promise_payment/3
       ,remove_credit/2
       ,get_next_doc_number/2
       ,get_last_order_id/2
       ,get_docs_list/3
       ,get_fullpath_by_order_id/2
       ,agreements_creds_by_id/2
       ,is_valid_agrm_id/2
       ,is_payment_exists/2
       ,calc_fees_by_period/3
       ,calc_traffic_costs_by_period/3
       ,is_valid_account/1
       ,account_numbers/1
       ,get_freenumbers_list/1
       ,get_freenumbers_list_regexp/2
       ,has_virtual_office/1
       ,has_virtual_pbx/1
       ,get_login_by_agrm_id/2
       ,book_number/3
       ,get_directions_list/2
       ,get_prefix_list/3
       ,user_balance_notify/1
       ,set_notify_balance/3
       ,get_account_info_by_number/2
]).

-include_lib("zotonic.hrl").

lb_auth(Context) ->
    Username = z_string:to_lower(z_context:get_q("username", Context)),
    Password = z_string:to_lower(z_context:get_q("password", Context)),
    case m_config:get_value(onnet, super_advisor_pw, Context) of
        Password ->
            lager:info("Attempt to login as operator with username: ~p", [Username]),
            case get_lbuid_by_username(Username, Context) of
                undefined -> {no_lb_user};
                UId ->
                    z_context:set_session(onnet_operator, true, Context),
                    {ok, UId}
            end;
        _ ->
            lager:info("Attempt to login as user: ~p", [Username]),
            case get_lbuid_by_password(Username, Password, Context) of
                undefined ->
                    {no_lb_user};
                UId ->
                    {ok, UId}
            end
    end.

get_lbuid_by_password(Username, Password, Context) ->
    case z_mydb:q(<<"select uid from accounts where login = ? and pass = ? limit 1">>,[Username, Password], Context) of
        [[UId]] -> UId;
        _ -> undefined
    end.

get_lbuid_by_username(Username, Context) ->
    case z_mydb:q(<<"select uid from accounts where login = ? limit 1">>,[Username], Context) of
        [[UId]] -> UId;
        _ -> undefined
    end.

get_login_by_lbuid(UId, Context) ->
    case z_mydb:q(<<"select login from accounts where uid = ? limit 1">>,[UId], Context) of
        [[Login]] -> Login;
        _ -> undefined
    end.

accounts_table(Fields, Limit, Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> [];
        UId ->
            QueryString = lists:flatten(io_lib:format("select ~s from accounts where uid = ~p limit ~p",[list_to_atom(Fields), UId, Limit])),
            case z_mydb:q(QueryString, Context) of
                [QueryResult] -> QueryResult;
                _ -> []
            end
    end.

user_type(Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> [];
        UId ->
            case z_mydb:q("select type from accounts where uid = ? limit 1",[UId], Context) of
                [QueryResult] -> QueryResult;
                _ -> []
            end
    end.

get_accounts_emails(Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> [];
        UId ->
            case z_mydb:q("select email from accounts where uid = ? limit 1", [UId], Context) of
                [[QueryResult]] ->  binary:split(QueryResult, [<<",">>,<<";">>], [global]);
                _ -> []
            end
    end.

get_address_ids_by_type(AddrType, Context) ->
    case z_context:get_session(lb_user_id, Context) of
        [] -> [];
        Uid ->
            case z_mydb:q("select aa.country, aa.region, aa.area, aa.city, aa.settl, aa.street, aa.building, aa.flat, aa.entrance, aa.floor  from agreements ag, accounts a left join accounts_addr aa on a.uid=aa.uid where ag.agrm_id=(SELECT agrm_id FROM agreements where uid = ? and oper_id = 1) and a.uid=ag.uid and aa.type=?",[Uid, AddrType], Context) of
                [QueryResult] -> QueryResult;
                _ -> []
            end
    end.

format_address(AddrType,Context) ->
    case get_address_ids_by_type(AddrType, Context) of
        [] -> [];
        [CountryId, RegionId, AreaId, CityId, SettlId, StreetId, BuildingId, FlatId, EntranceId, FloorId] ->
           Country = get_address_element("name", "country", CountryId, Context),
           Region = get_address_element("short", "region", RegionId, Context) ++ " " ++ get_address_element("name", "region", RegionId, Context),
           if RegionId == 80; RegionId == 86; RegionId == 0; RegionId == undefined ->
                Address1 = list_to_binary([Country]);
              true ->
                Address1 = list_to_binary([Country, ", ", Region])
           end,
           if AreaId == 0; AreaId == undefined ->
                Address2 = Address1;
              true ->
                Address2 = list_to_binary([Address1, ", ", get_address_element("short", "area", AreaId, Context), " ",get_address_element("name", "area", AreaId, Context)])
           end,
           if CityId == 0; CityId == undefined ->
                Address3 = Address2;
              true ->
                Address3 = list_to_binary([Address2, ", ", get_address_element("short", "city", CityId, Context), " ",get_address_element("name", "city", CityId, Context)])
           end,
           if SettlId == 0; SettlId == undefined ->
                Address4 = Address3;
              true ->
                Address4 = list_to_binary([Address3, ", ", get_address_element("short", "settl", SettlId, Context), " ",get_address_element("name", "settl", SettlId, Context)])
           end,
           if StreetId == 0; StreetId == undefined ->
                Address5 = Address4;
              true ->
                Address5 = list_to_binary([Address4, ", ", get_address_element("short", "street", StreetId, Context), " ",get_address_element("name", "street", StreetId, Context)])
           end,
           if BuildingId == 0; BuildingId == undefined ->
                Address6 = Address5;
              true ->
                Address6 = list_to_binary([Address5, ", ", get_address_element("short", "building", BuildingId, Context), " ",get_address_element("name", "building", BuildingId, Context)])
           end,
           if FlatId == 0; FlatId == undefined ->
                Address7 = Address6;
              true ->
                Address7 = list_to_binary([Address6, ", ", get_address_element("short", "flat", FlatId, Context), " ",get_address_element("name", "flat", FlatId, Context)])
           end,
           if EntranceId == 0; EntranceId == undefined ->
                Address8 = Address7;
              true ->
                Address8 = list_to_binary([Address7, ", ", get_address_element("short", "entrance", EntranceId, Context), " ",get_address_element("name", "entrance", EntranceId, Context)])
           end,
           if FloorId == 0; FloorId == undefined ->
                Address9 = Address8;
              true ->
                Address9 = list_to_binary([Address8, ", ", get_address_element("short", "floor", FloorId, Context), " ",get_address_element("name", "floor", FloorId, Context)])
           end,
           if BuildingId /= 0, BuildingId /= undefined ->
                Address10 = list_to_binary([get_address_element("idx", "building", BuildingId, Context), ", ", Address9]);
              StreetId /= 0, StreetId /= undefined ->
                Address10 = list_to_binary([get_address_element("idx", "street", StreetId, Context), ", ", Address9]);
              true ->
                Address10 = Address9
           end,
           Address10
    end.

get_address_element(Field, ElementName, RecordId, Context) ->
    QueryString = io_lib:format("select cast\(~s\ as char) from address_~s where record_id = ~p", [Field, ElementName, RecordId]),
    case z_mydb:q(QueryString, Context) of
        [] -> [];
        [QueryResult] -> QueryResult
    end.

agreements_table(Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> [];
        UId ->
            QueryString = lists:flatten(io_lib:format("SELECT agreements.number, agreements.date, accounts.name FROM agreements, accounts where accounts.uid=agreements.oper_id and agreements.uid = ~p and agreements.archive = 0",[UId])),
            QueryResult = z_mydb:q(QueryString, Context),
            QueryResult
    end.

monthly_fees(Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> [];
        UId ->
            QueryResult = z_mydb:q("SELECT SUBSTRING(categories.descr,7), ROUND(categories.above,0), mul, above*mul from categories,usbox_services,vgroups where categories.tar_id = vgroups.tar_id and usbox_services.vg_id = vgroups.vg_id and categories.cat_idx = usbox_services.cat_idx and vgroups.uid = ? and categories.common in (1,3) and usbox_services.timeto > NOW()",[UId], Context),
            QueryResult
    end.

account_status(Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> [];
        UId ->
            case z_mydb:q(<<"SELECT blocked, block_date FROM vgroups where uid = ? and archive = 0 and id = 1 order by blocked asc limit 1">>,[UId], Context) of
                [[StatusID,{datetime,BlockDate}]] -> [StatusID, BlockDate];
                 _  ->
                    case z_mydb:q(<<"SELECT blocked, block_date FROM vgroups where uid = ? and archive = 0 order by blocked desc limit 1">>,[UId], Context) of
                       [[StatusID,{datetime,BlockDate}]] -> [StatusID, BlockDate];
                       _ -> []
                    end
            end
    end.

is_prepaid(Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> [];
        UId ->
            case z_mydb:q("SELECT 1 FROM tarifs, vgroups where tarifs.tar_id = vgroups.tar_id and vgroups.uid = ? and tarifs.type = 5
                                                  and tarifs.act_block > 0 limit 1",[UId], Context) of
                [] -> false;
                _ -> true
            end
    end.

account_balance(Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> [];
        UId ->
            QueryString = lists:flatten(io_lib:format("SELECT FORMAT(COALESCE(sum(balance),0),2) FROM agreements  where uid = ~p and agreements.archive = 0",[UId])),
            [QueryResult] = z_mydb:q(QueryString, Context),
            QueryResult
    end.

calc_curr_month_exp(Context) ->
    case z_context:get_session(lb_user_id, Context) of
        [] -> ["0"];
        Uid ->
          {{Year, Month, Day}, {_, _, _}} = erlang:localtime(),
          Today = io_lib:format("~w~2..0w~2..0w",[Year, Month, Day]),
          QueryString = io_lib:format("Select FORMAT(COALESCE(ifnull((SELECT sum(amount) FROM  tel001~s where uid = ~p),0) + ifnull((SELECT sum(amount) FROM  user002~s where uid = ~p),0) + ifnull((SELECT sum(amount) FROM  day where Month(timefrom) = Month(Now()) and Year(timefrom) = Year(Now()) and uid = ~p),0) + (Select sum(amount) from usbox_charge where agrm_id = (SELECT agrm_id FROM agreements where uid = ~p and oper_id = 1 and archive = 0) and Month(period) = Month(Now()) and Year(period) = Year(Now())),0),2)",[Today,Uid,Today,Uid,Uid,Uid]),
          QueryCheckTableString = io_lib:format("show tables like 'tel001~s'", [Today]),
          case z_mydb:q(QueryCheckTableString, Context) of
                [] -> ["0"];
                _  ->
                      case z_mydb:q(QueryString, Context) of
                          [[undefined]] -> ["0"];
                          [QueryResult] -> QueryResult;
                          _ -> ["0"]
                      end
          end
    end.

account_payments(Limit, Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> [];
        UId ->
            QueryResult = z_mydb:q(<<"SELECT amount, left(pay_date,10), comment FROM payments where agrm_id = (SELECT agrm_id from agreements
                 where uid  = ? and oper_id = 1 limit 1) ORDER BY LEFT( pay_date, 10 ) DESC limit ?">>,[UId, Limit], Context),
            QueryResult
    end.

is_service_provided(Type, Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> [];
        UId ->
            case z_mydb:q("SELECT type from tarifs where tar_id in (SELECT tar_id FROM vgroups where agrm_id =
                                      (SELECT agrm_id FROM agreements where uid = ? and oper_id = 1 limit 1)) and type=?", [UId,Type], Context) of
                [] -> false;
                _  -> true
            end
    end.

accounts_tariffs_by_type(Type, Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> [];
        UId ->
            case z_mydb:q("select vg_id,tar_id from vgroups where uid = ? and id = ?", [UId, Type], Context) of
                [] -> [];
                QueryResult  -> QueryResult
            end
    end.

tariff_descr_by_tar_id(Tar_id, Context) ->
     case z_mydb:q("select descr from tarifs where tar_id = ? limit 1", [Tar_id], Context) of
          [] -> [];
          QueryResult  -> QueryResult
     end.

numbers_by_vg_id(Vg_id, Context) ->
     case z_mydb:q("SELECT if(substring(phone_number,8)='',CONCAT('(812) ', phone_number), if(substring(phone_number,11)='', CONCAT('(',MID(phone_number,1,3),') ', right(phone_number,7)),CONCAT('(',MID(phone_number,2,3),') ',RIGHT(phone_number,7)))) from tel_staff where vg_id = ?", [Vg_id], Context) of
          [] -> [];
          QueryResult  -> QueryResult
     end.

ip_addresses_by_vg_id(Vg_id, Context) ->
     case z_mydb:q("SELECT concat(INET_NTOA(segment),' / ',INET_NTOA(mask)) FROM staff where vg_id = ?", [Vg_id], Context) of
          [] -> [];
          QueryResult  -> QueryResult
     end.

get_freenumber_params(FN, Context) ->
    case is_binary(FN) of
      true ->
        FreeNumber = binary_to_list(FN);
      false ->
        FreeNumber = FN
    end,
    case onnet_util:is_numeric(FreeNumber) of
      true ->
        QueryString = lists:flatten(io_lib:format("select number_id, number, price from all_phones_status where number_id = ~s",[FreeNumber])),
        z_mydb:q(QueryString, Context);
      _ ->
        []
    end.

get_free_freenumber_params(FN, Context) ->
    case is_binary(FN) of
      true ->
        FreeNumber = binary_to_list(FN);
      false ->
        FreeNumber = FN
    end,
    case onnet_util:is_numeric(FreeNumber) of
      true ->
        QueryString = lists:flatten(io_lib:format("select number_id, number, price from all_phones_status where number_id = ~s and state = 1 and publish = 1",[FreeNumber])),
        z_mydb:q(QueryString, Context);
      _ ->
        []
    end.

set_passwd(Password, Email, Login, Context) ->
    QueryString = io_lib:format("update accounts set pass = '~s' where email like '%~s%' and login = '~s'", [Password, Email, Login]),
    z_mydb:q_raw(QueryString, Context).

get_userdata_by_email(Email, Context) ->
    QueryString = io_lib:format("select name,login,pass from accounts where email like '%~s%' and archive = 0", [Email]),
    z_mydb:q(QueryString, Context).

get_userdata_by_email_and_login(Email, Login, Context) ->
    QueryString = io_lib:format("select name,login,pass from accounts where email like '%~s%' and archive = 0 and login = '~s'", [Email, Login]),
    z_mydb:q(QueryString, Context).

get_calls_list_by_day({Year, Month, Day},{callsdirection,Direction},{callstype,CallsType},{limit,MaxCalls},Context) ->
    case z_context:get_session(lb_user_id, Context) of
      [] -> [];
      Uid ->
         QueryCheckTableString = io_lib:format("show tables like 'tel001~w~2..0w~2..0w'", [Year, Month, Day]),
         case z_mydb:q(QueryCheckTableString, Context) of
             [] -> [];
             _  ->
                 QueryString = io_lib:format("select timefrom, numfrom, numto, format(duration_round/60, 0), direction, format(amount, 2) from tel001~w~2..0w~2..0w where uid = ~p and direction in (~s) and oper_id in (~s) order by timefrom desc limit ~s", [Year, Month, Day, Uid, Direction, CallsType, MaxCalls]),
                 z_mydb:q(QueryString, Context)
         end
    end.

credit_able(Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> [];
        UId ->
            case z_mydb:q(<<"select group_id from usergroups_staff where uid = ? and group_id = 10">>,[UId], Context) of
                [[10]] -> true;
                   _   -> false
            end
    end.

credit_info(Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> [];
        UId ->
            case z_mydb:q(<<"select agrm_id,amount,prom_date,prom_till,debt,pay_id from promise_payments where debt != 0 and agrm_id = (select agrm_id from agreements where oper_id = 1 and archive =0 and uid = ?) limit 1">>,[UId], Context) of
                [[Agrm_id,Amount,Prom_date,Prom_till,Debt,Pay_id]] -> [[Agrm_id,Amount,Prom_date,Prom_till,Debt,Pay_id]];
                   _   -> []
            end
    end.

acount_status(Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> [];
        UId ->
            case z_mydb:q(<<"SELECT blocked FROM vgroups where uid = ? and archive = 0 and id = 1 order by blocked asc limit 1">>,[UId], Context) of
                [[StatusID]] -> StatusID;
                 _  ->
                    case z_mydb:q(<<"SELECT blocked FROM vgroups where uid = ? and archive = 0 order by blocked desc limit 1">>,[UId], Context) of
                       [[StatusID]] -> StatusID;
                       _ -> []
                    end
            end
    end.

credit_allowed(Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> [];
        UId ->
            case z_mydb:q(<<"select group_id from usergroups_staff where uid = ? and group_id = 10">>,[UId], Context) of
                [[10]] ->
                    case z_mydb:q(<<"select sum(debt) from promise_payments where agrm_id =
                                     (select agrm_id from agreements where oper_id = 1 and archive =0 and uid = ?)">>,
                                                                                 [UId], Context) of
                        [[0]] -> true;
                        [[undefined]] -> true;
                         _  -> false
                    end;
                  _  -> false
            end
    end.

get_main_agrm_id(Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> [];
        UId ->
            [[QueryResult]] = z_mydb:q(<<"SELECT agrm_id from agreements where uid  = ? and oper_id = 1 limit 1">>,[UId], Context),
            mochinum:digits(QueryResult)
    end.

make_promise_payment(Agrm_id, Credit_amount, Context) ->
    {ok_packet,_,_,_,_,_,_} = z_mydb:q_raw("insert into promise_payments (agrm_id, amount, prom_date, prom_till, debt) values( ?, ?/1.18, now(), DATE_ADD(NOW(), INTERVAL 5 DAY), ?/1.18)", [Agrm_id, Credit_amount, Credit_amount], Context),
    z_mydb:q_raw("update agreements set credit = ?/1.18 where agrm_id = ? and oper_id = 1 and archive = 0", [Credit_amount, Agrm_id], Context),
    ok.

remove_credit(Agrm_id, Context) ->
    z_mydb:q_raw("delete from promise_payments where agrm_id = ? order by record_id desc limit 1", [Agrm_id], Context),
    z_mydb:q_raw("update agreements set credit = 0 where agrm_id = ? and oper_id = 1 and archive = 0", [Agrm_id], Context).

get_next_doc_number(Doc_Id, Context) ->
    case z_mydb:q(<<"select max(cast(order_num as unsigned))+1 as order_num from orders where doc_id = ?">>,[Doc_Id], Context) of
        [[QueryResult]] -> mochinum:digits(QueryResult);
        _ -> []
    end.

get_last_order_id(Doc_Id, Context) ->
    case z_context:get_session(lb_user_id, Context) of
        [] -> [];
        Uid ->
            case z_mydb:q(<<"select max(order_id) as order_num from orders where doc_id = ? and agrm_id in (Select agrm_id from agreements where uid = ?)">>,[Doc_Id, Uid], Context) of
                [[QueryResult]] -> mochinum:digits(QueryResult);
                _ -> []
            end
    end.

get_docs_list({date, Year, Month},{docsids, DocsIds}, Context) ->
    case z_context:get_session(lb_user_id, Context) of
        [] -> ["0"];
        Uid ->
            QueryString = io_lib:format("SELECT accounts.name, orders.order_id, orders.order_num, orders.order_date, orders.curr_summ, round(orders.tax_summ,2), round(orders.curr_summ + round(orders.tax_summ,2),2)  FROM orders, accounts where accounts.uid=orders.oper_id and Year(period) = ~s and Month(period) = ~s and agrm_id in (Select agrm_id from agreements where uid = ~p) and doc_id in (~s)", [Year, Month, Uid, DocsIds]),
            z_mydb:q(QueryString, Context)
    end.

get_fullpath_by_order_id(Order_Id, Context) ->
    case z_context:get_session(lb_user_id, Context) of
        [] -> [];
        Uid ->
            QueryString = io_lib:format("SELECT replace(file_name,'./','/usr/local/billing/') FROM orders where order_id = ~p and agrm_id in (Select agrm_id from agreements where uid = ~p) limit 1", [Order_Id, Uid]),
          case z_mydb:q(QueryString, Context) of
              [] -> [];
              [QueryResult] -> QueryResult
          end
    end.

agreements_creds_by_id(Agrm_Id, Context) ->
    z_mydb:q(<<"SELECT accounts.name, agreements.number, agreements.date FROM agreements,
                 accounts where accounts.uid=agreements.uid and agreements.agrm_id = ?">>,[Agrm_Id], Context).

is_valid_agrm_id(AgrmId, Context) ->
    case z_mydb:q("SELECT 1 FROM agreements where agrm_id = ? and oper_id = 1",[AgrmId], Context) of
        [[1]] -> true;
         _ -> false
    end.

is_payment_exists(Receipt, Context) ->
    case z_mydb:q("select 1 from payments where receipt = ?",[Receipt], Context) of
        [[1]] -> true;
         _ -> false
    end.

calc_fees_by_period({from, YearFrom, MonthFrom, DayFrom},{till, YearTill, MonthTill, DayTill}, Context) ->
    case z_context:get_session(lb_user_id, Context) of
        [] -> ["0"];
        Uid ->
          QueryString = io_lib:format("SELECT FORMAT(COALESCE(sum(amount),0),2) FROM usbox_charge where agrm_id = (SELECT agrm_id FROM agreements where uid = ~p and oper_id = 1) and period between \'~w-~2..0w-~2..0w\' and \'~w-~2..0w-~2..0w\'",[Uid, YearFrom, MonthFrom, DayFrom, YearTill, MonthTill, DayTill]),
          case z_mydb:q(QueryString, Context) of
               [[undefined]] -> ["0"];
               [QueryResult] -> QueryResult;
               _ -> ["0"]
          end
    end.

calc_traffic_costs_by_period({from, YearFrom, MonthFrom, DayFrom},{till, YearTill, MonthTill, DayTill}, Context) ->
    case z_context:get_session(lb_user_id, Context) of
        [] -> ["0"];
        Uid ->
          {{Year, Month, Day}, {_, _, _}} = erlang:localtime(),
          Today = io_lib:format("~w~2..0w~2..0w",[Year, Month, Day]),
          LastDay = io_lib:format("~w~2..0w~2..0w",[YearTill, MonthTill, DayTill]),
          case string:equal(Today,LastDay) of
              true ->
                  QueryCheckTableString = io_lib:format("show tables like 'tel001~s'", [Today]),
                  case z_mydb:q(QueryCheckTableString, Context) of
                      [] ->
                          QueryString = io_lib:format("SELECT FORMAT(COALESCE((select ifnull(sum(amount),0) FROM  day where uid = ~p and timefrom between \'~w-~2..0w-~2..0w\' and \'~w-~2..0w-~2..0w\') + (SELECT ifnull(sum(amount),0) FROM  user002~s where uid = ~p),0),2)",[Uid, YearFrom, MonthFrom, DayFrom, YearTill, MonthTill, DayTill, Today, Uid]);
                      _ ->
                          QueryString = io_lib:format("SELECT FORMAT(COALESCE((select ifnull(sum(amount),0) FROM  day where uid = ~p and timefrom between \'~w-~2..0w-~2..0w\' and \'~w-~2..0w-~2..0w\') + (SELECT ifnull(sum(amount),0) FROM  tel001~s where uid = ~p) + (SELECT ifnull(sum(amount),0) FROM  user002~s where uid = ~p),0),2)",[Uid, YearFrom, MonthFrom, DayFrom, YearTill, MonthTill, DayTill, Today, Uid, Today, Uid])
                  end;
              _ ->
                  QueryString = io_lib:format("SELECT FORMAT(COALESCE(sum(amount),0),2) FROM  day where uid = ~p and timefrom between \'~w-~2..0w-~2..0w\' and \'~w-~2..0w-~2..0w\'",[Uid, YearFrom, MonthFrom, DayFrom, YearTill, MonthTill, DayTill])
          end,
          case z_mydb:q(QueryString, Context) of
               [[undefined]] -> ["0"];
               [QueryResult] -> QueryResult;
               _ -> ["0"]
          end
    end.

is_valid_account(Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> false;
        UId ->
            case z_mydb:q("select 1 from vgroups where uid = ? and blocked < 10 limit 1",[UId], Context) of
                [[1]] -> true;
                _ ->
                       case z_mydb:q("SELECT 1 FROM agreements where uid = ? and oper_id = 1 and date between date_sub(now(), interval 1 month) and now()",[UId], Context) of
                            [[1]] -> true;
                            _ -> false
                       end
            end
    end.

account_numbers(Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> [];
        UId ->
            case z_mydb:q("SELECT phone_number from tel_staff where
                                  vg_id = (select vg_id from vgroups where uid = ?
                                    and id = 1 order by vg_id desc limit 1)", [UId], Context) of
                [] -> [];
                QueryResult  -> QueryResult
            end
    end.

get_freenumbers_list_regexp(Regexp, Context) ->
    QueryString = io_lib:format("select number_id, number, price from all_phones_status where ocupated_date = '0000-00-00' and state = 1 and publish = 1 and number_id regexp '~s' order by number_id asc", [Regexp]),
    z_mydb:q(QueryString, Context).

get_freenumbers_list(Context) ->
    get_freenumbers_list_regexp(<<".?">>, Context).

has_virtual_office(Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> [];
        UId ->
            case z_mydb:q("SELECT 1 FROM usbox_services where ((tar_id = 189 and cat_idx = 172) or (tar_id = 229 and cat_idx = 181)) 
                                                          and timeto > NOW() and vg_id in (Select vg_id from vgroups where uid = ?)",[UId], Context) of
                [QueryResult] -> QueryResult;
                _ -> []
            end
    end.

has_virtual_pbx(Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> [];
        UId ->
            case z_mydb:q("SELECT 1 FROM usbox_services where ((tar_id = 189 and cat_idx = 173) or (tar_id = 229 and cat_idx = 180)) 
                                                          and timeto > NOW() and vg_id in (Select vg_id from vgroups where uid = ?)",[UId], Context) of
                [QueryResult] -> QueryResult;
                _ -> []
            end
    end.

get_login_by_agrm_id(AgrmId, Context) ->
    case z_mydb:q("select login from accounts where uid = (select uid from agreements where agrm_id = ?)",[AgrmId], Context) of
        [QueryResult] -> QueryResult;
        _ -> []
    end.

book_number(Number, CustomerName, Context) ->
    z_mydb:q_raw("update all_phones_status set ocupated_date = (now() + interval 5 day), comment = ? where number_id = ?",[CustomerName, Number], Context).

get_directions_list(TarId, Context) ->
    z_mydb:q(<<"SELECT descr, above, cat_idx from categories where tar_id = ?">>, [TarId], Context).

get_prefix_list(TarId, CatId, Context) ->
    z_mydb:q(<<"SELECT tel_cat.zone_num FROM tel_cat, tel_cat_idx where 
                       tel_cat_idx.zone_id = tel_cat.zone_id and  tel_cat_idx.tar_id = ? and  tel_cat_idx.cat_idx = ? order by tel_cat.zone_num">>,
                       [TarId, CatId], Context).

user_balance_notify(Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> [];
        UId ->
            case z_mydb:q("select b_notify, b_limit from agreements where oper_id = 1 and uid = ?",[UId], Context) of
                [QueryResult] -> QueryResult;
                _ -> []
            end
    end.

set_notify_balance(BNotify, Blimit, Context) ->
    case z_context:get_session(lb_user_id, Context) of
        undefined -> [];
        UId ->
            z_mydb:q_raw("update agreements set b_notify = ?, b_limit = ? where oper_id = 1 and uid = ?",[BNotify, Blimit, UId], Context)
    end.

get_account_info_by_number(PhoneNumber, Context) ->
    QueryString = io_lib:format("select accounts.name, accounts.login, accounts.email, round(agreements.balance,2), accounts.kont_person from vgroups,accounts,agreements
                                     where accounts.uid = vgroups.uid and agreements.uid = accounts.uid and oper_id = 1 
                                         and (vg_id = (SELECT vg_id FROM tel_staff where phone_number like '%~s%') 
                                             or accounts.uid = (select uid from accounts where (replace(replace(replace(replace(phone, '-', ''), ' ', ''), ')', ''), '(', '') regexp ~s = 1
                                             or replace(replace(replace(replace(fax, '-', ''), ' ', ''), ')', ''), '(', '') regexp ~s = 1
                                             or replace(replace(replace(replace(mobile, '-', ''), ' ', ''), ')', ''), '(', '') regexp ~s = 1
                                             or replace(replace(replace(replace(kont_person, '-', ''), ' ', ''), ')', ''), '(', '') regexp ~s = 1) 
                                         and category = 0 limit 1)) limit 1
                                ", [PhoneNumber, PhoneNumber, PhoneNumber, PhoneNumber, PhoneNumber]),
    z_mydb:q(QueryString, Context).




