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
            <th>{_ Tariff name _}</th>
            <th>{_ IP Addresses _}</th>
        </tr>
    </thead>
    <tbody>
        {% for zvg_id, ztar_id in m.onnet[{accounts_tariffs_by_type type=2}] %}
            <tr>
               <td>{{ m.onnet[{tariff_descr_by_tar_id tar_id=ztar_id }] }}</td>
               <td>{% for ip_address in m.onnet[{ip_addresses_by_vg_id vg_id=zvg_id}] %} {{ ip_address }} </br> {% endfor %}</td>
            </tr>
        {% endfor %}
    </tbody>
</table>
{% endblock %}
