<div class="btn-group pull-left">
<a class="btn btn-xs btn-onnet dropdown-toggle" data-toggle="dropdown" href="#">
  <i class="fa fa-arrows-h"></i>
  {_ choose calls direction _}
  <span class="caret"></span>
</a>
<ul class="dropdown-menu nav-list nav">
    {% wire name="intervaltype_event" action={postback postback="intervaltype_event" delegate="onnet"} %}
    <li><a href="#" onclick="$('#callsdirection').val('1'); $('#direction_text').text('{_ Outbound calls _}');">{_ Outbound calls _}</li></a>
    <li><a href="#" onclick="$('#callsdirection').val('0'); $('#direction_text').text('{_ Inbound calls _}');$('#callstype').val('881,6,1'); $('#callstype_text').text('{_ All _}');">{_ Inbound calls _}</li></a>
    <li><a href="#" onclick="$('#callsdirection').val('0,1'); $('#direction_text').text('{_ All _}');">{_ All _}</li></a>
</ul>
</div>
