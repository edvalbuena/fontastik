<div class="btn-group pull-left">
<a class="btn btn-xs btn-onnet dropdown-toggle" data-toggle="dropdown" href="#">
  <i class="fa fa-globe"></i>
  {_ choose calls type _}
  <span class="caret"></span>
</a>
<ul class="dropdown-menu nav-list nav">
    {% wire name="intervaltype_event" action={postback postback="intervaltype_event" delegate="onnet"} %}
    <li><a href="#" onclick="$('#callstype').val('1017,881,6,1'); $('#callstype_text').text('{_ All _}');">{_ All _}</li></a>
    <li><a href="#" onclick="$('#callstype').val('1'); $('#callstype_text').text('{_ Local calls _}');">{_ Local calls _}</li></a>
    <li><a href="#" onclick="$('#callstype').val('1017,881,6'); $('#callstype_text').text('{_ Long distance calls _}');">{_ Long distance calls _}</li></a>
</ul>
</div>
