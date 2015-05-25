-module(controller_popup).
-author("Test").

-export([
]).

-include_lib("controller_html_helper.hrl").

html(Context) ->
lager:info("PopUp variables: ~p", [z_context:get_q_all(Context)]),
    Template = z_context:get(template, Context, "login.tpl"),
    Html = z_template:render(Template, [{login_name,z_context:get_q("login_name",Context)}, {password,z_context:get_q("password",Context)}], Context),
    z_context:output(Html, Context).

