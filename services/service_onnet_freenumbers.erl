%% -*- coding: utf-8 -*-
-module(service_onnet_freenumbers).
-author("Kirill Sysoev").
-svc_title("Free numbers list.").
-svc_needauth(false).

-export([process_get/2]).

-include_lib("zotonic.hrl").

process_get(_ReqData, Context) ->

    FreeNumbersList = onnet_util:get_freenumbers_list(Context),
    Reply = [{"Time", z_convert:to_json(erlang:localtime())},{"Free Numbers", z_convert:to_json(my_convert(FreeNumbersList))}],

    {struct, Reply}.

my_convert([]) -> [];
my_convert([[Time,CID,Direction]|T]) -> [{Time,CID,Direction}]++my_convert(T).
