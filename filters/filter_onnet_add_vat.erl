-module(filter_onnet_add_vat).
-export([
          onnet_add_vat/2,
          onnet_add_vat/3
]).

onnet_add_vat(Number, _Context) when is_integer(Number) ->
    round(Number*1.18);
onnet_add_vat(Number, _Context) when is_float(Number) ->
 %   round(Number);
     io_lib:format("~.2f",[Number*1.18]);
onnet_add_vat(_NotNumber, _Context) ->
    not_a_number.

onnet_add_vat(Number, _Args, _Context) ->
    Number.

