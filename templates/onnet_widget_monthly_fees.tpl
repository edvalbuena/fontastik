{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}
    {% button class="btn btn-xs btn-onnet pull-right" action={redirect dispatch="documents"} text=_"view documents"%}
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}
<table class="table table-condensed table-hover table-centered">
    <thead>
        <tr>
            <th>{_ Fee name _}</th>
            <th class="text-center">{_ Price _}</th>
            <th class="text-center">{_ Quantity _}</th>
            <th class="text-center">{_ Cost _}</th>
        </tr>
    </thead>
    <tbody>
        {% for onnetservice, price, quantity, cost in m.onnet.monthly_fees %}
          <tr>
             <td>{{ onnetservice }}</td>
             <td class="text-center">{{ price }}</td>
             <td class="text-center">{{ quantity }}</td>
             <td class="text-center">{{ cost }}</td>
          </tr>
        {% endfor %}
    </tbody>
</table>
{% endblock %}

