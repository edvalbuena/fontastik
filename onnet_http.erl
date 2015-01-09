-module(onnet_http).
-author("Kirill Sysoev <kirill.sysoev@gmail.com>").

%% interface functions
-export([
     lb_login/1
    ,lb_logout/1
    ,add_payment/5
    ,create_invoice/2
    ,create_callsreport/2
    ,maybe_unblock_agreement/2
]).

-include_lib("zotonic.hrl").
-include_lib("xmerl/include/xmerl.hrl").

-define(SOAPENV_O, "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:urn='urn:api3'>").
-define(SOAPENV_C, "</soapenv:Envelope>").
-define(BODY_O, "<soapenv:Body>").
-define(BODY_C, "</soapenv:Body>").

lb_login(Context) ->
    EncType = "application/x-www-form-urlencoded",
    Url = binary_to_list(m_config:get_value(onnet, lb_url, Context)),
    LB_User = binary_to_list(m_config:get_value(onnet, lb_user, Context)),
    LB_Password = binary_to_list(m_config:get_value(onnet, lb_password, Context)),
    AuthStr = io_lib:format("login=~s&password=~s",[LB_User, LB_Password]),
    httpc:set_options([{cookies, enabled}]),
    httpc:request(post, {Url, [], EncType, lists:flatten(AuthStr)}, [], []).

lb_logout(Context) ->
    EncType = "application/x-www-form-urlencoded",
    Url = binary_to_list(m_config:get_value(onnet, lb_url, Context)),
    httpc:request(post, {Url, [], EncType, lists:flatten("devision=99")}, [], []).

lb_soap_auth(Move, Context) ->
    EncType = "text/xml",
    Url = "http://b3.onnet.su:34012/",
    case Move of
        'login' ->
            LB_User = binary_to_list(m_config:get_value(onnet, lb_user, Context)),
            LB_Password = binary_to_list(m_config:get_value(onnet, lb_password, Context)),
            httpc:set_options([{cookies, enabled}]),
            httpc:request(post, {Url, [], EncType, lb_login_data(LB_User, LB_Password)}, [], []);
        'logout' ->
            httpc:request(post, {Url, [], EncType, lb_logout_data()}, [], [])
    end.

maybe_unblock_agreement(AgrmId, Context) ->
    timer:sleep(300000),
    case re:run(lb_get_balance_by_agrmid(AgrmId, Context),"-") of
        nomatch -> lb_block_agreement(AgrmId, 10, "off", Context);
        {match,[{0,1}]} -> 'ok'
    end.

lb_block_agreement(AgrmId, BlkType, State, Context) ->
    Xml_VgidList = lb_soap_getVgroups(AgrmId, BlkType, Context),
    lb_soap_block_Vgroups(Xml_VgidList, BlkType, State, Context).

lb_soap_blkVgroup(Id, BlkType, State, Context) ->
    EncType = "text/xml",
    Url = "http://b3.onnet.su:34012/",
    lb_soap_auth('login', Context),
    httpc:request(post, {Url, [], EncType, lb_blkVgroup_data(Id, BlkType, State)}, [], []),
    lb_soap_auth('logout', Context).

lb_soap_getVgroups(AgrmId, BlkType, Context) ->
    EncType = "text/xml",
    Url = "http://b3.onnet.su:34012/",
    lb_soap_auth('login', Context),
    {ok, {{_, 200, _}, _, Body}} = httpc:request(post, {Url, [], EncType, lb_getVgroups_data(AgrmId, BlkType)}, [], []),
    lb_soap_auth('logout', Context),
    {Xml, _} = xmerl_scan:string(Body),
    xmerl_xpath:string("//SOAP-ENV:Envelope/SOAP-ENV:Body/lbapi:getVgroupsResponse/ret/vgid/text()", Xml).

lb_soap_block_Vgroups([], _, _, _) ->
    ok;
lb_soap_block_Vgroups([H|T], BlkType, State, Context) ->
    lb_soap_block_Vgroup(H, BlkType, State, Context),
    lb_soap_block_Vgroups(T, BlkType, State, Context).

lb_soap_block_Vgroup(XmlRec, BlkType, State, Context) ->
    lb_soap_blkVgroup(XmlRec#xmlText.value, BlkType, State, Context).

lb_soap_getAgreement(AgrmId, Context) ->
    EncType = "text/xml",
    Url = "http://b3.onnet.su:34012/",
    lb_soap_auth('login', Context),
    {ok, {{_, 200, _}, _, Body}} = httpc:request(post, {Url, [], EncType, lb_getAgreements_data(AgrmId)}, [], []),
    lb_soap_auth('logout', Context),
    Body.

lb_get_balance_by_agrmid(AgrmId, Context) ->
    Body = lb_soap_getAgreement(AgrmId, Context),
    {Xml, _} = xmerl_scan:string(Body),
    [H|_] = xmerl_xpath:string("//SOAP-ENV:Envelope/SOAP-ENV:Body/lbapi:getAgreementsResponse/ret/balance/text()", Xml),
    H#xmlText.value.

add_payment(Agrm_Id, Summ, Receipt, Comment, Context) ->
    Url = binary_to_list(m_config:get_value(onnet, lb_url, Context)),
    QueryString = io_lib:format("async_call=1&devision=199&commit_payment=~s&payment_sum=~s&payment_number=~s&classid=0&_paymentType=zonnet_add_payment&payment_comment=~s", [Agrm_Id, Summ, Receipt, Comment]),
    EncType = "application/x-www-form-urlencoded",
    lb_login(Context),
    httpc:request(post, {Url, [], EncType, lists:flatten(QueryString)}, [], []),
    _ = spawn(?MODULE, 'maybe_unblock_agreement', [Agrm_Id, Context]),
    lb_logout(Context).

create_invoice(Amount, Context) ->
    Uid = z_context:get_session(lb_user_id, Context),
    InvoiceNum = onnet_util:get_next_doc_number("35", Context),
    Url = binary_to_list(m_config:get_value(onnet, lb_url, Context)),
    EncType = "application/x-www-form-urlencoded",
    {{Year, Month, Day}, {_, _, _}} = erlang:localtime(),
    MakeInvoiceStr = io_lib:format("devision=108&doctype=2&a_year=~p&a_month=~p&a_day=~p&startnum=~s&b_year=~p&b_month=~p&orsum=~p&docid=35&advSearchList=&docfor=3&userid=~p&agrmid=0&operid=1&comment=&async_call=1&generate=1",[Year, Month, Day, InvoiceNum, Year, Month, Amount, Uid]),
    lb_login(Context),
    case httpc:request(post, {Url, [], EncType, lists:flatten(MakeInvoiceStr)}, [], []) of
        {ok, {{_, 200, _}, _, Body}} ->
            lb_logout(Context),
            case re:run(Body, "success: true", [{capture, none}]) of
                match ->
                    z_render:update("make_invoice_table", z_template:render("onnet_table_ready_invoice.tpl", [], Context), Context);
                _ ->
		    z_render:growl("Success not mutched", Context)
            end;
        _ ->
            lb_logout(Context),
	    z_render:growl("Bad httpc", Context)
    end.


create_callsreport(DocsMonthInput, Context) ->
    Uid = z_context:get_session(lb_user_id, Context),
    Url = binary_to_list(m_config:get_value(onnet, lb_url, Context)),
    EncType = "application/x-www-form-urlencoded",
    [Month, Year] = string:tokens(DocsMonthInput,"/"),
    Day = calendar:last_day_of_the_month(list_to_integer(Year), list_to_integer(Month)),
    MakeInvoiceStr = io_lib:format("devision=108&doctype=0&a_year=~s&a_month=~s&a_day=~p&startnum=&b_year=~s&b_month=~s&asrent=1&docid=39&advSearchList=&usergroup=0&docfor=3&userid=~p&agrmid=0&operid=0&comment=&async_call=1&generate=1",[Year, Month, Day, Year, Month,  Uid]),
    lb_login(Context),
    case httpc:request(post, {Url, [], EncType, lists:flatten(MakeInvoiceStr)}, [], []) of
        {ok, {{_, 200, _}, _, Body}} ->
            lb_logout(Context),
            case re:run(Body, "success: true", [{capture, none}]) of
                match ->
                    z_render:update("update_calls_reports_widget", z_template:render("onnet_widget_calls_reports.tpl", [{headline,?__("Calls report", Context)}, {idname, "calls_reports_widget"}, {selectedmonth, DocsMonthInput}], Context), Context);
     %%               z_render:update("calls_reports_table", z_template:render("onnet_table_ready_calls_reports.tpl", [], Context), Context);
                _ ->
		    z_render:growl("Success not mutched", Context)
            end;
        _ ->
            lb_logout(Context),
	    z_render:growl("Bad httpc", Context)
    end.

lb_login_data(Login, Password) ->
    ?SOAPENV_O
      ++ ?BODY_O
        ++ "<urn:Login>"
          ++ "<login>"++z_convert:to_list(Login)++"</login>"
          ++ "<pass>"++z_convert:to_list(Password)++"</pass>"
        ++ "</urn:Login>"
      ++ ?BODY_C
    ++ ?SOAPENV_C.

lb_blkVgroup_data(Id, Blk, State) ->
    ?SOAPENV_O
      ++ ?BODY_O
        ++ "<urn:blkVgroup>"
          ++ "<id>"++z_convert:to_list(Id)++"</id>"
          ++ "<blk>"++z_convert:to_list(Blk)++"</blk>"
          ++ "<state>"++z_convert:to_list(State)++"</state>"
        ++ "</urn:blkVgroup>"
      ++ ?BODY_C
    ++ ?SOAPENV_C.

lb_logout_data() ->
    ?SOAPENV_O
      ++ ?BODY_O
        ++ "<urn:Logout/>"
      ++ ?BODY_C
    ++ ?SOAPENV_C.

lb_getVgroups_data(AgrmId, BlockedId) ->
    ?SOAPENV_O
      ++ ?BODY_O
        ++ "<urn:getVgroups>"
          ++ "<flt>"
            ++ "<agrmid>"++z_convert:to_list(AgrmId)++"</agrmid>"
            ++ "<blocked>"++z_convert:to_list(BlockedId)++"</blocked>"
          ++ "</flt>"
        ++ "</urn:getVgroups>"
      ++ ?BODY_C
    ++ ?SOAPENV_C.

lb_getAgreements_data(AgrmId) ->
    ?SOAPENV_O
      ++ ?BODY_O
        ++ "<urn:getAgreements>"
          ++ "<flt>"
            ++ "<agrmid>"++z_convert:to_list(AgrmId)++"</agrmid>"
          ++ "</flt>"
        ++ "</urn:getAgreements>"
      ++ ?BODY_C
    ++ ?SOAPENV_C.

