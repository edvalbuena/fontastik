%% @author author <author@example.com>
%% @copyright YYYY author.
%% @doc Example contact-form handler.

-module(controller_firstorder_submit).
-export([event/2]).

-include_lib("zotonic.hrl").

event(#submit{message={firstorderform, []}}, Context) ->
  try
    SalesEmail = m_config:get_value(onnet, sales_email, Context),
%    CRMEmail = m_config:get_value(onnet, crm_email, Context),
    {{Years,Months,Days},{Hours,Minutes,Seconds}} = calendar:local_time(),
    OrderNumber = io_lib:format("~2..0w~2..0w~2..0w-~2..0w~2..0w~2..0w",[Years-2000,Months,Days,Hours,Minutes,Seconds]),
    ServiceType = z_context:get_q("servicetype", Context),
    Surname = z_context:get_q("surname", Context),
    Firstname = z_context:get_q("firstname", Context),
    Middlename = z_context:get_q("middlename", Context),
    ContactPhone = z_context:get_q("contactphone", Context),
    ContactEmail = z_context:get_q("contactemail", Context),
    Comments = z_context:get_q("comments", Context),
    CounterpartyType = z_context:get_q("counterpartytype", Context),
    SiplineAmount = z_context:get_q("siplineamount", Context),
    ChosenNumbers = z_context:get_q_all("chosennumbers", Context),
    VirtualServerType = z_context:get_q("virtualservertype", Context),
    VpbxTypes = z_context:get_q("vpbxtypes", Context),
    LastChoiceInCrm = z_context:get_q("lastchoiceincrm", Context),
    ServerTariff = z_context:get_q("servertariff", Context),
    TemplatesDistro = z_context:get_q("templatesdistro", Context),
    PBXServiceType = z_context:get_q("pbxservicetype", Context),

    case z_context:get_q("companydetailsfile", Context) of
        {upload, CompanyDetailsUploadFilename, CompanyDetailsUploadTmp, _, _} ->
            false = onnet_util:check_file_size_exceeded(companydetailsfile, CompanyDetailsUploadTmp, 15000000),
            CompanyDetailsUploadFilenameVar = [{companydetailsfile, CompanyDetailsUploadFilename}],
            {ok, CompanyData} = file:read_file(CompanyDetailsUploadTmp), 
            {ok, CompanyIdnProps} = z_media_identify:identify(CompanyDetailsUploadTmp, Context), 
            CompanyDetailsUpload = [#upload{data=CompanyData, filename=CompanyDetailsUploadFilename, mime=proplists:get_value(mime, CompanyIdnProps)}];
        _ ->
            CompanyDetailsUpload = [],
            CompanyDetailsUploadFilenameVar = []
    end,

    case z_context:get_q("passportpage1", Context) of
        {upload ,[], _, _, _} ->
            PassportPage1Upload = [],
            PassportPage1UploadFilenameVar = [];
        {upload ,PassportPage1UploadFilename, PassportPage1UploadTmp, _, _} ->
            false = onnet_util:check_file_size_exceeded(passportpage1, PassportPage1UploadTmp, 15000000),
            PassportPage1UploadFilenameVar = [{passportpage1, PassportPage1UploadFilename}],
            {ok, Page1Data} = file:read_file(PassportPage1UploadTmp), 
            {ok, Page1IdnProps} = z_media_identify:identify(PassportPage1UploadTmp, Context), 
            PassportPage1Upload = [#upload{data=Page1Data, filename=PassportPage1UploadFilename, mime=proplists:get_value(mime, Page1IdnProps)}];
        _ ->
            PassportPage1Upload = [],
            PassportPage1UploadFilenameVar = []
    end,

    case z_context:get_q("passportpage2", Context) of
        {upload ,[], _, _, _} ->
            PassportPage2Upload = [],
            PassportPage2UploadFilenameVar = [];
        {upload ,PassportPage2UploadFilename, PassportPage2UploadTmp, _, _} ->
            false = onnet_util:check_file_size_exceeded(passportpage2, PassportPage2UploadTmp, 15000000),
            PassportPage2UploadFilenameVar = [{passportpage2, PassportPage2UploadFilename}],
            {ok, Page2Data} = file:read_file(PassportPage2UploadTmp), 
            {ok, Page2IdnProps} = z_media_identify:identify(PassportPage2UploadTmp, Context), 
            PassportPage2Upload = [#upload{data=Page2Data, filename=PassportPage2UploadFilename, mime=proplists:get_value(mime, Page2IdnProps)}];
        _ ->
            PassportPage2Upload = [],
            PassportPage2UploadFilenameVar = []
    end,

    case CounterpartyType of
        "individual" when PassportPage1Upload == [] ->
            throw(no_passport_p1_uploaded);
        "individual" when PassportPage2Upload == [] ->
            throw(no_passport_p2_uploaded);
        _ -> ok
    end,

    case mod_recaptcha:check_recaptcha(Context) of
        ok ->
            CaptchaPassed = true;
        {error, _Error} ->
            CaptchaPassed = []
    end,
           
    Vars = [{mail, z_context:get_q("mail", Context)},
            {name, z_context:get_q("name", Context)},
            {message, z_context:get_q("message", Context)},
            {servicetype, ServiceType},
            {ordernumber, OrderNumber},
            {surname, Surname}
            ,{firstname, Firstname}
            ,{middlename, Middlename}
            ,{contactphone, ContactPhone}
            ,{contactemail, ContactEmail}
            ,{comments, Comments}
            ,{counterpartytype, CounterpartyType}
            ,{siplineamount, SiplineAmount}
            ,{chosennumbers, ChosenNumbers}
            ,{captchapassed, CaptchaPassed}
            ,{virtualservertype, VirtualServerType}
            ,{vpbxtypes, VpbxTypes}
            ,{lastchoiceincrm, LastChoiceInCrm}
            ,{servertariff, ServerTariff}
            ,{templatesdistro, TemplatesDistro}
            ,{pbxservicetype, PBXServiceType}
           ] ++ CompanyDetailsUploadFilenameVar ++ PassportPage1UploadFilenameVar ++ PassportPage2UploadFilenameVar,

    Attachments = CompanyDetailsUpload ++ PassportPage1Upload ++ PassportPage2Upload,

    E_Sales = #email{
        to=SalesEmail,
        from=SalesEmail,
        html_tpl="_email_firstorder.tpl",
        vars=Vars,
        attachments=Attachments
    },
    z_email:send(E_Sales, Context),

    E_CRM = #email{
 %       to=CRMEmail,
        to=SalesEmail,
        from=ContactEmail,
        html_tpl="_email_firstorder.tpl",
        vars=Vars,
        attachments=Attachments
    },
    z_email:send(E_CRM, Context),

    case CaptchaPassed of
        true ->
            E_Customer = #email{
                to=ContactEmail,
                from=SalesEmail,
                html_tpl="_email_firstorder.tpl",
                vars=Vars,
                attachments=Attachments
            },
            z_email:send(E_Customer, Context);
         _ ->
             ok
    end,

    z_render:update("service-order-form", z_template:render("_firstorder_completed.tpl", Vars, Context), Context)

  catch
    no_passport_p1_uploaded -> z_render:growl_error(?__("Passport page1 absent",Context), Context);
    no_passport_p2_uploaded -> z_render:growl_error(?__("Passport registered address page absent",Context), Context);
    wrong_recapture -> z_render:growl_error(?__("Wrong reCapture code. Please try again.",Context), Context);
    error:{badmatch, {true, companydetailsfile}} -> z_render:growl_error(?__("Maximum file size exceeded. Please try to upload smaller file.",Context), Context);
    error:{badmatch, {true, passportpage1}} -> z_render:growl_error(?__("Maximum file size exceeded. Please try to upload smaller page1 file.",Context), Context);
    error:{badmatch, {true, passportpage2}} -> z_render:growl_error(?__("Maximum file size exceeded. Please try to upload smaller registered adress page file.",Context), Context);
    _:_ -> z_render:growl_error(?__("Something wrong happened.",Context), Context)

  end.

