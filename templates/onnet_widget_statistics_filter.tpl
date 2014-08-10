{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}
    {% button class="btn btn-xs btn-onnet pull-right" action={postback postback="fixed_costs" delegate="onnet" qarg="startDayInput" qarg="endDayInput" qarg="monthInput"} action={postback postback="calls_list" delegate="onnet" qarg="startDayInput" qarg="endDayInput" qarg="monthInput" qarg="callstype" qarg="callsdirection"} text=_"refresh results"%}
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}
<table class="table table-condensed table-hover table-centered">
<tbody>
  <tr id="datepicker">
    {% include "_onnet_widget_statistics_datepicker.tpl" %}
  </tr>
  <tr id="statistics_direction">
    {% include "_onnet_widget_statistics_direction.tpl" %}
  </tr>
  <tr id="statistics_callstype">
    {% include "_onnet_widget_statistics_callstype.tpl" %}
  </tr>
</tbody>
</table>
{% endblock %}

