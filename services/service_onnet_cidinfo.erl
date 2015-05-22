%% -*- coding: utf-8 -*-
-module(service_onnet_cidinfo).
-author("Kirill Sysoev").
-svc_title("CID Info.").
-svc_needauth(false).

-export([process_get/2, number_length/2]).

-include_lib("zotonic.hrl").

process_get(_ReqData, Context) ->
    get_info(Context).

get_info(Context) ->
    case is_key_valid(Context) of
        'true' ->
            CallingNumber = z_context:get_q("calling_number", Context),
            Reply = get_cidinfo(CallingNumber, Context),
            {struct, Reply};
        _ ->
            {error,  access_denied, undefined}
    end.

is_key_valid(Context) ->
    PopUpKey = binary_to_list(m_config:get_value(onnet, popup_key, Context)),
    ControlString = io_lib:format("~s:~s", [z_context:get_q("calling_number", Context), PopUpKey]),
    lager:info("ControlString: ~p",[lists:flatten(ControlString)]),
    Md5Hash = lists:flatten([io_lib:format("~2.16.0b", [C]) || <<C>> <= erlang:md5(ControlString)]),
    lager:info("Md5Hash: ~p",[Md5Hash]),
    lager:info("Md5: ~p",[z_context:get_q("md5", Context)]),
    case z_context:get_q("md5", Context) of
        undefined -> false;
        Md5 -> string:to_lower(Md5Hash) == string:to_lower(Md5)
    end.

get_cidinfo(Number, Context) ->
    PhoneNumber = number_length(Number, 10),
    case lb:get_account_info_by_number(PhoneNumber, Context) of
        [] -> 
              PhoneNumber2 = number_length(Number, 7),
              case lb:get_account_info_by_number(PhoneNumber2, Context) of 
                  [] -> [{'company_name', ""}, {'agrm_num', ""}, {'contact_person', <<"">>},{'cur_balance', ""}, {'login_name', ""}, {'calling_number', PhoneNumber2}];
                  [[CompanyName, Login, _Email, Balance, Person]] ->
                        [{'company_name', CompanyName}, {'agrm_num', ""}, {'contact_person', Person}, {'cur_balance', Balance}, {'login_name', Login}, {'calling_number', PhoneNumber2}]
              end;
        [[CompanyName, Login, _Email, Balance, Person]] ->
              [{'company_name', CompanyName}, {'agrm_num', ""}, {'contact_person', Person}, {'cur_balance', Balance}, {'login_name', Login}, {'calling_number', PhoneNumber}]
    end.

number_length(Number, Length) ->
    case (length(Number) > Length) of
        'true' -> string:substr(Number, length(Number)-Length+1);
        'false' -> Number
    end.
