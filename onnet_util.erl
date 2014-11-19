-module(onnet_util).
-author("Kirill Sysoev <kirill.sysoev@gmail.com>").

%% interface functions
-export([
     is_numeric/1
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
    ,maybe_send_passwd/1
    ,get_userdata_by_email/2
    ,set_and_send_new_password/1
    ,calls_list_query/7
    ,get_calls_list_by_period/6
    ,amount_of_days_in_period/2
    ,count_day/2
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
    ,check_field_filled/2
    ,is_valid_account/1
    ,account_numbers/1
    ,check_file_size_exceeded/3
    ,countdown_day/2
    ,get_freenumbers_list/1
    ,get_freenumbers_list_regexp/2
    ,send_additional_numbers_order/1
    ,email_doc/2
    ,has_virtual_office/1
    ,get_login_by_agrm_id/2
    ,book_numbers/3
]).

-include_lib("zotonic.hrl").

is_numeric(L) ->
    Float = (catch erlang:list_to_float(L)),
    Int = (catch erlang:list_to_integer(L)),
    is_number(Float) orelse is_number(Int).

accounts_table(Fields, Limit, Context) ->
    lb:accounts_table(Fields, Limit, Context).

%% If user acting as company or as an individual
user_type(Context) ->
    lb:user_type(Context).

get_accounts_emails(Context) ->
    lb:get_accounts_emails(Context).

get_address_ids_by_type(AddrType, Context) ->
    lb:get_address_ids_by_type(AddrType, Context).

format_address(AddrType,Context) ->
    lb:format_address(AddrType,Context).

agreements_table(Context) ->
    lb:agreements_table(Context).

monthly_fees(Context) ->
    lb:monthly_fees(Context).

account_status(Context) ->
    lb:account_status(Context).

is_prepaid(Context) ->
    lb:is_prepaid(Context).

account_balance(Context) ->
    lb:account_balance(Context).

calc_curr_month_exp(Context) ->
    lb:calc_curr_month_exp(Context).

account_payments(Limit, Context) ->
    lb:account_payments(Limit, Context).

is_service_provided(Type, Context) ->
    lb:is_service_provided(Type, Context).

accounts_tariffs_by_type(Type, Context) ->
    lb:accounts_tariffs_by_type(Type, Context).

tariff_descr_by_tar_id(Tar_id, Context) ->
    lb:tariff_descr_by_tar_id(Tar_id, Context).

numbers_by_vg_id(Vg_id, Context) ->
    lb:numbers_by_vg_id(Vg_id, Context).

ip_addresses_by_vg_id(Vg_id, Context) ->
    lb:ip_addresses_by_vg_id(Vg_id, Context).

get_free_freenumber_params(FN, Context) ->
    lb:get_free_freenumber_params(FN, Context).

set_and_send_new_password(Context) ->
    NewPassword = onnet_util2:rand_hex_binary(10),
    CustomerEmail = z_context:get_q("customeremail", Context),
    case z_context:get_session(lb_username, Context) of
        undefined -> [];
        Login ->
            set_passwd(NewPassword, CustomerEmail, Login, Context),
            maybe_send_passwd(CustomerEmail, Login, Context)
    end.

set_passwd(Password, Email, Login, Context) ->
    lb:set_passwd(Password, Email, Login, Context).

maybe_send_passwd(Context) ->
    Email = z_context:get_q("user_email",Context),
    case get_userdata_by_email(Email, Context) of
         [] -> false;
         Userdata ->
             send_passwd_to_email(Email, Userdata, Context)
    end.

maybe_send_passwd(Email, Login, Context) ->
    case get_userdata_by_email_and_login(Email, Login, Context) of
         [] -> false;
         Userdata ->
             send_passwd_to_email(Email, Userdata, Context)
    end.

get_userdata_by_email(Email, Context) ->
    lb:get_userdata_by_email(Email, Context).

get_userdata_by_email_and_login(Email, Login, Context) ->
    lb:get_userdata_by_email_and_login(Email, Login, Context).

send_passwd_to_email(Email, Userdata, Context) ->
    ReqData = z_context:get_reqdata(Context),
    {ClientIP, _}  = webmachine_request:peer(ReqData),
    SalesEmail = m_config:get_value(onnet, sales_email, Context),
    Vars = [{email, Email}
            ,{userdata, Userdata}
            ,{clientip, ClientIP}
           ],
    E_Passwd = #email{
        to=Email,
        from=SalesEmail,
        html_tpl="_email_passwd_reminder.tpl",
        vars=Vars
    },
    z_email:send(E_Passwd, Context),

    E_Passwd_Copy = #email{
        to=SalesEmail,
        from=SalesEmail,
        html_tpl="_email_passwd_reminder.tpl",
        vars=Vars
    },
    z_email:send(E_Passwd_Copy, Context).

calls_list_query({callsdirection,Direction},{callstype,CallsType},{from,StartDayInput},{limit,MaxCalls},{month,MonthInput},{till,EndDayInput}, Context) ->
    if
        MonthInput =/= undefined, MonthInput =/= "undefined" ->
            case re:run(MonthInput, "^\\d{2}\\/\\d{4}$", [{capture, none}]) of
                match ->
                    get_month_calls(MonthInput, Direction, CallsType, MaxCalls, Context);
                _ -> badmonth
            end;
        EndDayInput =/= undefined, EndDayInput =/= "undefined" ->
            case re:run(EndDayInput, "^\\d{2}\\/\\d{2}\\/\\d{4}$", [{capture, none}]) of
                match ->
                    get_period_calls(StartDayInput, EndDayInput, Direction, CallsType, MaxCalls, Context);
                _ -> badendday
            end;
        StartDayInput =/= undefined, StartDayInput =/= "undefined" ->
            case re:run(StartDayInput, "^\\d{2}\\/\\d{2}\\/\\d{4}$", [{capture, none}]) of
                match ->
                    get_day_calls(StartDayInput, Direction, CallsType, MaxCalls, Context);
                _ -> badstartday
            end;
        true ->
            {{Year, Month, Day}, {_, _, _}} = erlang:localtime(),
            onnet_util:get_calls_list_by_period({from, Year, Month, Day},{till, Year, Month, Day},{callsdirection,Direction},{callstype,CallsType},{limit,MaxCalls},Context)
    end.

get_calls_list_by_period({from, YearFrom, MonthFrom, DayFrom},{till, YearTill, MonthTill, DayTill},{callsdirection,Direction},{callstype,CallsType},{limit,MaxCalls},Context) ->
    DaysAmount = amount_of_days_in_period({from, YearFrom, MonthFrom, DayFrom},{till, YearTill, MonthTill, DayTill}),
    collect_calls(startdate, {YearFrom, MonthFrom, DayFrom},{callsdirection,Direction},{callstype,CallsType},{limit,MaxCalls},Context, DaysAmount).

get_month_calls(MonthInput, Direction, CallsType, MaxCalls, Context) ->
    [MonthM, YearM] = string:tokens(MonthInput,"/"),
    onnet_util:get_calls_list_by_period({from, list_to_integer(YearM), list_to_integer(MonthM), 1},{till, list_to_integer(YearM), list_to_integer(MonthM), calendar:last_day_of_the_month(list_to_integer(YearM), list_to_integer(MonthM))},{callsdirection,Direction},{callstype,CallsType},{limit,MaxCalls},Context).

get_period_calls(StartDayInput, EndDayInput, Direction, CallsType, MaxCalls, Context) ->
                    [DayS, MonthS, YearS] = string:tokens(StartDayInput,"/"),
                    [DayE, MonthE, YearE] = string:tokens(EndDayInput,"/"),
                    onnet_util:get_calls_list_by_period({from, list_to_integer(YearS), list_to_integer(MonthS), list_to_integer(DayS)},{till, list_to_integer(YearE), list_to_integer(MonthE), list_to_integer(DayE)},{callsdirection,Direction},{callstype,CallsType},{limit,MaxCalls},Context).

get_day_calls(StartDayInput, Direction, CallsType, MaxCalls, Context) ->
    [DayS, MonthS, YearS] = string:tokens(StartDayInput,"/"),
    onnet_util:get_calls_list_by_period({from, list_to_integer(YearS), list_to_integer(MonthS), list_to_integer(DayS)},{till, list_to_integer(YearS), list_to_integer(MonthS), list_to_integer(DayS)},{callsdirection,Direction},{callstype,CallsType},{limit,MaxCalls},Context).

collect_calls(startdate, {Year, Month, Day},{callsdirection,Direction},{callstype,CallsType},{limit,MaxCalls},Context,N) ->
    collect_calls(startdate, {Year, Month, Day},{callsdirection,Direction},{callstype,CallsType},{limit,MaxCalls},Context, N, []).
collect_calls(startdate, {Year, Month, Day},{callsdirection,Direction},{callstype,CallsType},{limit,MaxCalls},Context, N, Acc) ->
    if
       N < 0 ->
           Acc;
       N >= 0 ->
           AccNew = Acc ++ get_calls_list_by_day(count_day({Year, Month, Day},N),{callsdirection,Direction},{callstype,CallsType},{limit,MaxCalls},Context),
           collect_calls(startdate, {Year, Month, Day},{callsdirection,Direction},{callstype,CallsType},{limit,MaxCalls},Context, N-1, AccNew)
    end.

get_calls_list_by_day({Year, Month, Day},{callsdirection,Direction},{callstype,CallsType},{limit,MaxCalls},Context) ->
    lb:get_calls_list_by_day({Year, Month, Day},{callsdirection,Direction},{callstype,CallsType},{limit,MaxCalls},Context).

amount_of_days_in_period({from, YearFrom, MonthFrom, DayFrom},{till, YearTill, MonthTill, DayTill}) ->
    case calendar:date_to_gregorian_days(YearTill, MonthTill, DayTill) - calendar:date_to_gregorian_days(YearFrom, MonthFrom, DayFrom) of
        N when N >= 0 -> N;
        _ -> 0
    end.

count_day({Year,Month,Day},N) ->
    calendar:gregorian_days_to_date(calendar:date_to_gregorian_days({Year, Month, Day}) + N).

credit_able(Context) ->
    lb:credit_able(Context).

credit_info(Context) ->
    lb:credit_info(Context).

acount_status(Context) ->
    lb:acount_status(Context).

credit_allowed(Context) ->
    lb:credit_allowed(Context).

get_main_agrm_id(Context) ->
    lb:get_main_agrm_id(Context).

make_promise_payment(Agrm_id, Credit_amount, Context) ->
    lb:make_promise_payment(Agrm_id, Credit_amount, Context).

remove_credit(Agrm_id, Context) ->
    lb:remove_credit(Agrm_id, Context).

get_next_doc_number(Doc_Id, Context) ->
    lb:get_next_doc_number(Doc_Id, Context).

get_last_order_id(Doc_Id, Context) ->
    lb:get_last_order_id(Doc_Id, Context).

get_docs_list({date, Year, Month},{docsids, DocsIds}, Context) ->
    lb:get_docs_list({date, Year, Month},{docsids, DocsIds}, Context).

get_fullpath_by_order_id(Order_Id, Context) ->
    lb:get_fullpath_by_order_id(Order_Id, Context).

agreements_creds_by_id(Agrm_Id, Context) ->
    lb:agreements_creds_by_id(Agrm_Id, Context).

is_valid_agrm_id(AgrmId, Context) ->
    lb:is_valid_agrm_id(AgrmId, Context).

is_payment_exists(Receipt, Context) ->
    lb:is_payment_exists(Receipt, Context).

calc_fees_by_period({from, YearFrom, MonthFrom, DayFrom},{till, YearTill, MonthTill, DayTill}, Context) ->
    lb:calc_fees_by_period({from, YearFrom, MonthFrom, DayFrom},{till, YearTill, MonthTill, DayTill}, Context).

calc_traffic_costs_by_period({from, YearFrom, MonthFrom, DayFrom},{till, YearTill, MonthTill, DayTill}, Context) ->
    lb:calc_traffic_costs_by_period({from, YearFrom, MonthFrom, DayFrom},{till, YearTill, MonthTill, DayTill}, Context).

check_field_filled(Field, Context) ->
    case z_context:get_q(Field, Context) of
        [] ->
           false;
        undefined ->
           false;
         _ ->
           ok
    end.

get_freenumber_params(FN, Context) ->
    lb:get_freenumber_params(FN, Context).

is_valid_account(Context) ->
    lb:is_valid_account(Context).

account_numbers(Context) ->
    lb:account_numbers(Context).

check_file_size_exceeded(Id, FileName, MaxSize) ->
    case filelib:file_size(FileName) > MaxSize of
        false ->
            false;
        true ->
            {true, Id}
    end.

countdown_day({Year,Month,Day},N) ->
    calendar:gregorian_days_to_date(calendar:date_to_gregorian_days({Year, Month, Day}) - N).

get_freenumbers_list(Context) ->
    lb:get_freenumbers_list(Context).

get_freenumbers_list_regexp(Regexp, Context) ->
    lb:get_freenumbers_list_regexp(Regexp, Context).

send_additional_numbers_order(Context) ->
    IsPrepaid = is_prepaid(Context),
    AccountBalance = account_balance(Context),
    ReqData = z_context:get_reqdata(Context),
    {ClientIP, _}  = webmachine_request:peer(ReqData),
    CustomerEmail = z_context:get_q("customeremail", Context),
    PhoneNumbers = z_context:get_q_all("chosennumbers", Context),
    SalesEmail = m_config:get_value(onnet, sales_email, Context),
    Username = z_context:get_session(lb_username, Context),
    CustomerName = accounts_table("name", 1, Context),
    [CustomerAgreement|_] = agreements_table(Context),
    Vars = [{email, CustomerEmail}
            ,{chosennumbers, PhoneNumbers}
            ,{clientip, ClientIP}
            ,{is_prepaid, IsPrepaid}
            ,{account_balance, AccountBalance}
            ,{username, Username}
            ,{customername, CustomerName}
            ,{customeragreement, CustomerAgreement}
           ],

    E_Num_Order_Customer = #email{
        to=CustomerEmail,
        from=SalesEmail,
        html_tpl="_email_additional_numbers_order.tpl",
        vars=Vars
    },
    z_email:send(E_Num_Order_Customer, Context),

    E_Num_Order_Sales = #email{
        to=SalesEmail,
        from=CustomerEmail,
        html_tpl="_email_additional_numbers_order.tpl",
        vars=Vars
    },
    z_email:send(E_Num_Order_Sales, Context).

email_doc(CustomerEmail, Context) ->
    DocId = z_context:get_q("docid", Context),
    case get_fullpath_by_order_id(DocId, Context) of
        [] -> lager:info("FullPath is empty. Nothing to send.");
        [FullPath] ->
                lager:info("FullPath: ~p", [FullPath]),
                {ok, Data} = file:read_file(FullPath),
                Attachment = #upload{
                    filename = z_convert:to_list(DocId)++".pdf",
                    data = Data,
                    mime = "application/pdf"
                },
                SalesEmail = m_config:get_value(onnet, sales_email, Context),
                ReqData = z_context:get_reqdata(Context),
                {ClientIP, _}  = webmachine_request:peer(ReqData),
                Username = z_context:get_session(lb_username, Context),
                CustomerName = accounts_table("name", 1, Context),
                [CustomerAgreement|_] = agreements_table(Context),
                Vars = [{username, Username}
                       ,{clientip, ClientIP}
                       ,{customername, CustomerName}
                       ,{customeragreement, CustomerAgreement}
                ],
                Invoice_Email = #email{
                    from=SalesEmail,
                    to=CustomerEmail,
                    html_tpl="_email_invoice.tpl",
                    vars=Vars,
                    attachments = [Attachment]
                },
                z_email:send(Invoice_Email, Context),
                ok
    end.

has_virtual_office(Context) ->
    lb:has_virtual_office(Context).

get_login_by_agrm_id(AgrmId, Context) ->
    lb:get_login_by_agrm_id(AgrmId, Context).

book_number(Number, CustomerName, Context) ->
   lb:book_number(Number, CustomerName, Context).

book_numbers([], _CustomerName, _Context) ->
    'ok';
book_numbers([Number|Numbers], CustomerName, Context) ->
    book_number(Number, CustomerName, Context),
    book_numbers(Numbers, CustomerName, Context);
book_numbers(Number, CustomerName, Context) ->
    book_number(Number, CustomerName, Context).
