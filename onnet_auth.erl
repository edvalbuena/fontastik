-module(onnet_auth).
-author("Kirill Sysoev <kirill.sysoev@gmail.com>").

-export([
    sign_in/1
   ,onnet_auth/1
   ,onnet_logon/2
   ,onnet_logoff/1
   ,is_auth/1
   ,is_operators_session/1
]).

-include_lib("zotonic.hrl").

sign_in(Context) ->
    case onnet_auth(Context) of
        {ok, UserId} when is_integer(UserId) ->
            onnet_logon(UserId, Context);
        {no_lb_user} ->
            {sign_in_failed}
    end.

onnet_auth(Context) ->
    lb:lb_auth(Context).

onnet_logon(UserId, Context) ->
    {ok, Context1} = z_session_manager:ensure_session(Context),
    {ok, Context2} = z_session_manager:rename_session(Context1),
    z_context:set_session(lb_user_id, UserId, Context2),
    z_context:set_session(lb_username, z_string:to_lower(z_context:get_q("username", Context)), Context2),
    z_context:set_session(auth_timestamp, calendar:universal_time(), Context2),
    {ok, Context2}.


onnet_logoff(Context) ->
    {ok, Context1} = z_session_manager:stop_session(Context),
    z_render:wire({redirect, [{dispatch, "home"}]}, Context1).

is_auth(Context) ->
    lager:info("lb_user_id: ~p",[z_context:get_session(lb_user_id, Context)]),
    is_integer(z_context:get_session(lb_user_id, Context)).

is_operators_session(Context) ->
    case z_session:get(onnet_operator, Context) of
        true -> true;
        _    -> false
    end.

