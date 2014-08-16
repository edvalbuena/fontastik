-module(controller_onnet).
-author("Test").

-export([
         is_authorized/2
]).

-include_lib("controller_html_helper.hrl").

is_authorized(ReqData, Context) ->
    Context2 = ?WM_REQ(ReqData, Context),
    z_acl:wm_is_authorized(true, Context2).

html(Context) ->
    Template = z_context:get(template, Context, "onnet_dashboard.tpl"),
    Html = z_template:render(Template, [], Context),
    z_context:output(Html, Context).

