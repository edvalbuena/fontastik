-module(filter_onnet_round).
-export([
          onnet_round/2,
          onnet_round/3
]).

onnet_round(Number, _Context) when is_integer(Number) ->
    Number;
onnet_round(Number, _Context) when is_float(Number) ->
%    round(Number);
     io_lib:format("~.2f",[Number]);
onnet_round(Number, _Context) ->
    Number.

onnet_round(Number, _Args, _Context) ->
    Number.

