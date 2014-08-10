{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}
    {% button class="btn btn-xs btn-onnet pull-right" action={redirect dispatch="onnet_dashboard"} text=_"dashboard"%}
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}
<table class="table table-condensed table-hover table-centered">
    <thead>
        <tr>
            <th width="60%">{_ Fee type _}</th>
            <th class="td-right" width="15%">{_ Sum _}</th>
        </tr>
    </thead>
    <tbody>
          <tr><td>{_ Fixed fees _}</td><td class="td-right">{{ m.onnet[{calc_fees_by_period month=monthInput from=startDayInput till=endDayInput}] }}</td></tr>
          <tr><td>{_ Services usage _}</td><td class="td-right">{{ m.onnet[{calc_traffic_costs_by_period month=monthInput from=startDayInput till=endDayInput}] }}</td></tr>
    </tbody>
</table>

{% endblock %}

