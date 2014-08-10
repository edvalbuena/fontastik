<div class="btn-group pull-left">
<a class="btn btn-xs btn-onnet dropdown-toggle" data-toggle="dropdown" href="#">
  <i class="fa fa-calendar"></i>
  {_ choose interval type _}
  <span class="caret"></span>
</a>
<ul class="dropdown-menu nav-list nav">
    {% wire name="intervaltype_event" action={postback postback="intervaltype_event" delegate="onnet" qarg="startDayInput" qarg="endDayInput" qarg="monthInput"} %}
    <li><a href="#" onclick="z_event('intervaltype_event', { period: 'day' });">{_ Day _}</li></a>
    <li><a href="#" onclick="z_notify('intervaltype_notify', { period: 'month' });" >{_ Month _}</li></a>
    <li><a href="#" onclick="z_event('intervaltype_event', { period: 'interval' });">{_ Interval _}</li></a>
</ul>
</div>
