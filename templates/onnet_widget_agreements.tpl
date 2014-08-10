{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}
<table class="table table-condensed table-hover table-centered">
    <thead>
        <tr>
            <th>{_ Counterparty _}</th>
            <th>{_ Contract number _}</th>
            <th>{_ Contract date _}</th>
        </tr>
    </thead>
    <tbody>
        {% for agreement,date,operator in m.onnet.agreements_table %}
            <tr><td>{{operator}}</td><td>{{agreement}}</td><td>{{ date[2]|date:"d F Y" }}</td></tr>
        {% endfor %}
    </tbody>
</table>
{% endblock %}

