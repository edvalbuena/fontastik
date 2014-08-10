-module(onnet).
-author("kirill.sysoev@gmail.com").

-mod_title("OnNet website").
-mod_description("OnNet website").
-mod_prio(10).

-export([
     event/2
    ,observe_search_query/2
    ,observe_postback_notify/2
 %  ,observe_onnet_menu/3
]).

-include_lib("zotonic.hrl").

observe_search_query({search_query, {callslist, [{callsdirection,Direction},{callstype,CallsType},{from,StartDayInput},{limit,MaxCalls},{month,MonthInput},{till,EndDayInput}]}, _OffsetLimit}, Context) ->
    onnet_util:calls_list_query({callsdirection,Direction},{callstype,CallsType},{from,StartDayInput},{limit,MaxCalls},{month,MonthInput},{till,EndDayInput}, Context);

observe_search_query({search_query, {callslist, _Args}, _OffsetLimit}, Context) ->
    {{Year, Month, Day}, {_, _, _}} = erlang:localtime(),
    onnet_util:get_calls_list_by_period({from, Year, Month, Day},{till, Year, Month, Day},{callsdirection,"0,1"},{callstype,"1,6"},{limit,"3000"},Context);

observe_search_query(_, _Context) ->
    undefined.

%%
%% z_notify as an alternative to z_event - event({postback, intervaltype, _TriggerId, _TargetId}, Context)
%%
observe_postback_notify({postback_notify, "intervaltype_notify",_,_}, Context) ->
  try z_context:get_q("period",Context) of
      Period ->
          z_render:update("datepicker", z_template:render("_onnet_widget_statistics_datepicker.tpl", [{period,Period}], Context), Context)
  catch
      error:_ ->
          z_render:growl_error(?__("Please input intervaltype.", Context), Context)
  end;

observe_postback_notify({postback_notify, "no_auth",_,_}, Context) ->
    lager:info("Catched postback notify: no_auth"),
    {ok, Context1} = z_session_manager:stop_session(Context),
    z_render:wire({redirect, [{dispatch, "home"}]}, Context1);

observe_postback_notify(A, _Context) ->
    lager:info("Catched postback notify: ~p", [A]),
    undefined.

event({submit,{onnetauth,[]},"sign_in_form","sign_in_form"}, Context) ->
    case onnet_auth:sign_in(Context) of
        {ok, AuthContext} ->
            lager:info("User ~p authenticated", [z_context:get_q("username", Context)]),
            z_render:wire({redirect, [{dispatch, "onnet_dashboard"}]}, AuthContext);
        {sign_in_failed} ->
            lager:info("Failed to authenticate user ~p", [z_context:get_q("username", Context)]),
            z_render:growl_error(?__("Auth failed.", Context), Context)
    end;

event({postback,{signout,[]}, _, _}, Context) ->
    onnet_auth:onnet_logoff(Context);

event({submit,{changepasswordform, _}, _, _}, Context) ->
    ?DEBUG(z_context:get_q_all(Context)),
    CustomerEmail = z_context:get_q("customeremail", Context),
    onnet_util:set_and_send_new_password(Context),
    Context2 = z_render:update("change-password-form", z_template:render("change_password_header.tpl",[{headline,?__("Email to send password: ", Context)}, {idname, "change_password_id"}, {class, "disabled"}],Context), Context),
    z_render:growl([?__("New password sent to: ", Context2), CustomerEmail], Context2);

event({submit, credit_form, _TriggerId, _TargetId}, Context) ->
  true = onnet_util:credit_allowed(Context),
  Credit_amount = z_context:get_q("creditme",Context),
  try onnet_util:is_numeric(Credit_amount) of
    true ->
        Agrm_id = onnet_util:get_main_agrm_id(Context),
        case onnet_util:is_numeric(Agrm_id) of
          true ->
            ok = onnet_util:make_promise_payment(Agrm_id, Credit_amount, Context),
            z_render:update("dashboard_credit_table", z_template:render("_onnet_widget_dashboard_credit.tpl", [], Context), Context);
          false ->
            z_render:growl_error(?__("Please log in again.", Context), Context)
        end;
    false ->
        z_render:growl_error(?__("Please choose value.", Context), Context)
  catch
      error:_ ->
          z_render:growl_error(?__("Something went wrong. Please call to support.", Context), Context)
  end;

event({postback, remove_credit, _TriggerId, _TargetId}, Context) ->
    Agrm_id = onnet_util:get_main_agrm_id(Context),
    case onnet_util:is_numeric(Agrm_id) of
        true ->
            onnet_util:remove_credit(Agrm_id, Context),
            z_render:update("dashboard_credit_table", z_template:render("_onnet_widget_dashboard_credit.tpl", [], Context), Context);
        false ->
            z_render:growl_error(?__("Please log in again.", Context), Context)
    end;

event({postback, invoiceme_progress, _TriggerId, _TargetId}, Context) ->
  z_convert:to_integer(z_context:get_q("invoiceme",Context)),
  z_render:update("make_invoice_table", z_template:render("onnet_table_progress_invoice.tpl",[],Context), Context);

event({postback, invoiceme, _TriggerId, _TargetId}, Context) ->
  try z_convert:to_integer(z_context:get_q("invoiceme",Context)) of
      InvoiceAmount ->
         onnet_http:create_invoice(InvoiceAmount, Context)
  catch
      error:_ ->
          z_render:growl_error(?__("Please input integer number.", Context), Context)
  end;

event({postback, assist_pay, _TriggerId, _TargetId}, Context) ->
  Assist_pay = z_context:get_q("assist_pay",Context),
  try onnet_util:is_numeric(Assist_pay) of
    true ->
        Agrm_id = onnet_util:get_main_agrm_id(Context),
        case onnet_util:is_numeric(Agrm_id) of
          true ->
            OrderNumber = string:to_lower(z_ids:id(32)),
            AssistFolder = binary_to_list(m_config:get_value(mod_zonnet, assist_transaction_folder, Context)),
            case file:write_file(AssistFolder ++ "/" ++ OrderNumber, "attempt = 0") of
              ok ->
                Assist_URL = binary_to_list(m_config:get_value(mod_zonnet, assist_home_link, Context)),
                Merchant_ID = binary_to_list(m_config:get_value(mod_zonnet, assist_shop_id, Context)),
                Currency = binary_to_list(m_config:get_value(mod_zonnet, assist_shop_currency, Context)),
                Payment_URL = io_lib:format("~s?Merchant_ID=~s&OrderNumber=~s&OrderAmount=~s&OrderCurrency=~s&OrderComment=~s&Comment=~s&TestMode=0&Submit=Pay",[Assist_URL, Merchant_ID, OrderNumber, Assist_pay, Currency, Agrm_id, Agrm_id]),
                z_render:wire({redirect, [{location, Payment_URL}]}, Context);
              _ ->
                z_render:growl_error(?__("Can't open file for transaction. Please call to support.", Context), Context)
            end;
          false ->
            z_render:growl_error(?__("Please log in again.", Context), Context)
         end;
    false ->
        z_render:growl_error(?__("Please input a number.", Context), Context)
  catch
    error:_ ->
          z_render:growl_error(?__("Something went wrong. Please call to support.", Context), Context)
  end;

event({postback, fixed_costs, _TriggerId, _TargetId}, Context) ->
    StartDayInput = z_context:get_q("startDayInput",Context),
    EndDayInput = z_context:get_q("endDayInput",Context),
    MonthInput = z_context:get_q("monthInput",Context),
    z_render:update("update_onnet_widget_statistics_fixed_costs", z_template:render("onnet_widget_statistics_fixed_costs.tpl", [{headline,?__("Costs for selected period, RUB (excl VAT)", Context)}, {idname, "fixed_costs_widget"}, {startDayInput, StartDayInput}, {endDayInput, EndDayInput}, {monthInput, MonthInput}], Context), Context);

event({postback, calls_list, _TriggerId, _TargetId}, Context) ->
    StartDayInput = z_context:get_q("startDayInput",Context),
    EndDayInput = z_context:get_q("endDayInput",Context),
    MonthInput = z_context:get_q("monthInput",Context),
    CallsType = z_context:get_q("callstype",Context),
    CallsDirection = z_context:get_q("callsdirection",Context),
    z_render:update("update_onnet_widget_calls_list", z_template:render("onnet_widget_calls_list.tpl", [{headline,?__("Phone calls statistics", Context)}, {idname, "calls_list_widget"}, {startDayInput, StartDayInput}, {endDayInput, EndDayInput}, {monthInput, MonthInput}, {operator, CallsType}, {direction, CallsDirection}], Context), Context);

event({postback, intervaltype_event, _TriggerId, _TargetId}, Context) ->
  try z_context:get_q("period",Context) of
      Period ->
          z_render:update("datepicker", z_template:render("_onnet_widget_statistics_datepicker.tpl", [{period,Period}], Context), Context)
  catch
      error:_ ->
          z_render:growl_error(?__("Please input intervaltype.", Context), Context)
  end;

event({postback, cdr_csv_export, _TriggerId, _TargetId}, Context) ->
    StartDayInput = z_context:get_q("startDayInput",Context),
    EndDayInput = z_context:get_q("endDayInput",Context),
    MonthInput = z_context:get_q("monthInput",Context),
    CallsType = z_context:get_q("callstype",Context),
    CallsDirection = z_context:get_q("callsdirection",Context),
    Export_URL = io_lib:format("/cdr/csv/download?callstype=~s&callsdirection=~s&startDayInput=~s&endDayInput=~s&monthInput=~s",[CallsType, CallsDirection, StartDayInput, EndDayInput, MonthInput]),
    z_render:wire({redirect, [{location, Export_URL}]}, Context);

event({submit,{forgottenpwd, _}, _, _}, Context) ->
    case onnet_util:maybe_send_passwd(Context) of
        'true' ->
             Context2 = z_render:dialog_close(Context),
             z_render:growl(?__("Password sent. Please check your mailbox.",Context2), Context2);
        _ -> z_render:growl_error(?__("No such email address",Context), Context)
    end;

event({submit,{additionalnumberorderform, _}, _, _}, Context) ->
    ?DEBUG(z_context:get_q_all(Context)),
    CustomerEmail = z_context:get_q("customeremail", Context),
    onnet_util:send_additional_numbers_order(Context),
    Context2 = z_render:update("additional-number-order-form", z_template:render("order_additional_number.tpl",[{headline,?__("Customer's email: ", Context)}, {idname, "choose_number"}, {class, "hide"}],Context), Context),
    z_render:growl([?__("Order sent.", Context2), "<br />", ?__("Copy sent to: ", Context2), CustomerEmail], Context2);

event({postback, choose_number_next, _TriggerId, _TargetId}, Context) ->
    case z_context:get_q_all("chosennumbers",Context) of
        [] ->
           z_render:growl_error(?__("At least one number should be choosen",Context), Context);
         _ ->
           z_render:wire([{add_class, [{target, "choose_number_div"}, {class, "hide"}]}, {remove_class, [{target, "contact_info_div"}, {class, "hide"}]}], Context)
    end;

event({postback, contact_info_next, _TriggerId, _TargetId}, Context) ->
  try
    ok = onnet_util:check_field_filled("surname",Context),
    ok = onnet_util:check_field_filled("firstname",Context),
    ok = onnet_util:check_field_filled("middlename",Context),
    ok = onnet_util:check_field_filled("contactphone",Context),
    ok = onnet_util:check_field_filled("contactemail",Context),
    {{ok, _}, _} = validator_base_format:validate(format, 1, z_context:get_q_all("contactphone",Context), [false,"^[-+0-9 ()]+$"], Context),
    {{ok, _}, _} = validator_base_email:validate(email, 2, z_context:get_q_all("contactemail",Context), [], Context),
    z_render:wire([{add_class, [{target, "contact_info_div"}, {class, "hide"}]}, {remove_class, [{target, "counterparty_div"}, {class, "hide"}]}], Context)
  catch
    error:{badmatch,{{error, 1, invalid}, _}} -> z_render:growl_error(?__("Incorrect Contact phone field",Context), Context);
    error:{badmatch,{{error, 2, invalid}, _}} -> z_render:growl_error(?__("Incorrect Email field",Context), Context);
    error:{badmatch, _} -> z_render:growl_error(?__("All fields should be filled in",Context), Context);
    _:_ -> z_render:growl_error(?__("All fields should be correctly filled in",Context), Context)
  end;

event({postback, {addchosennumber,[{chosennumber,ChosenNumber}]}, _TriggerId, _TargetId}, Context) ->
    [[E164Num, PrintNum, Price]] = onnet_util:get_freenumber_params(ChosenNumber, Context),
    z_render:insert_bottom("mytbodyid", z_template:render("_add_line_with_number.tpl", [{number_id, E164Num}, {number, PrintNum}, {price,Price}], Context), Context);

event({postback, callsreportme_progress, _TriggerId, _TargetId}, Context) ->
  z_convert:to_integer(z_context:get_q("callsreportme",Context)),
  z_render:update("calls_reports_table", z_template:render("onnet_table_progress_calls_reports.tpl",[],Context), Context);

event({postback, callsreportme, _TriggerId, _TargetId}, Context) ->
  DocsMonthInput = z_context:get_q("docsmonthInput",Context),
  onnet_http:create_callsreport(DocsMonthInput, Context);

event({postback, refresh_invoices, _TriggerId, _TargetId}, Context) ->
    DocsMonthInput = z_context:get_q("docsmonthInput",Context),
    z_render:update("update_invoices_widget", z_template:render("onnet_widget_invoices.tpl", [{headline,?__("Invoices", Context)}, {idname, "invoices_widget"}, {selectedmonth, DocsMonthInput}], Context), Context);

event({postback, refresh_vatinvoices, _TriggerId, _TargetId}, Context) ->
    DocsMonthInput = z_context:get_q("docsmonthInput",Context),
    z_render:update("update_vatinvoices_widget", z_template:render("onnet_widget_vatinvoices.tpl", [{headline,?__("VAT Invoices", Context)}, {idname, "vatinvoices_widget"}, {selectedmonth, DocsMonthInput}], Context), Context);

event({postback, refresh_acts, _TriggerId, _TargetId}, Context) ->
    DocsMonthInput = z_context:get_q("docsmonthInput",Context),
    z_render:update("update_acts_widget", z_template:render("onnet_widget_acts.tpl", [{headline,?__("Acts", Context)}, {idname, "acts_widget"}, {selectedmonth, DocsMonthInput}], Context), Context);

event({postback, refresh_calls_reports, _TriggerId, _TargetId}, Context) ->
    DocsMonthInput = z_context:get_q("docsmonthInput",Context),
    z_render:update("update_calls_reports_widget", z_template:render("onnet_widget_calls_reports.tpl", [{headline,?__("Calls report", Context)}, {idname, "calls_reports_widget"}, {selectedmonth, DocsMonthInput}], Context), Context);

event(A, Context) ->
    lager:info("Unknown event: ~p", [A]),
    lager:info("Unknown event variables: ~p", [z_context:get_q_all(Context)]),
    lager:info("Unknown event Context: ~p", [Context]).
