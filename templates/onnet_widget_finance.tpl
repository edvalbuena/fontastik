{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}
    {% button class="btn btn-xs btn-onnet pull-right" action={redirect dispatch="onnet_dashboard"} text=_"dashboard"%}
{% endblock %}

{% block widget_content %}
<table class="table table-hover table-centered table-condensed">
    <thead>
        <tr>
            <th width="50%">{_ Account status _}</th>
            <th width="50%">{% if m.onnet.acount_status == 0 %}<span class="zprimary"> {_ Active _}</span> 
                            {% else %}<span class="zalarm"> {_ Blocked _} </span>{% endif %}
            </th>
        </tr>
    </thead>
    <tbody>
        {% if m.onnet.is_prepaid %}
            <tr><td>{_ Current balance _}</td><td>{{ m.onnet.account_balance }} {_ rub. _}</td></tr>
        {% else %}
            <tr><td>{_ Current month expenses _}</td><td>{{ m.onnet.calc_curr_month_exp }} {_ rub. _}</td></tr>
        {% endif %}
    </tbody>
</table>
{% endblock %}

