{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}
    {% button class="btn btn-xs btn-onnet pull-right" text=_"order additional number" id="orderbtn"
                                  action={enable target="choose_number"}
                                  action={disable target="orderbtn"}
                                  action={enable target="cancelorderbtn"}
    %}
    {% button class="btn btn-xs btn-onnet pull-right disabled" text=_"cancel order" id="cancelorderbtn"
                                  action={disable target="choose_number"}
                                  action={enable target="orderbtn"}
                                  action={disable target="cancelorderbtn"}
                                  action={update target="additional-number-order-form" template="order_additional_number.tpl" 
                                                                                       headline=_"Customer's email: " 
                                                                                       idname="choose_number" class="disabled"}
    %}
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}
<table class="table table-condensed table-hover table-centered">
    <thead>
        <tr>
            <th>{_ Tariff name _}</th>
            <th>{_ Phone numbers _}</th>
        </tr>
    </thead>
    <tbody>
        {% for zvg_id, ztar_id in m.onnet[{accounts_tariffs_by_type type=1}] %}
            <tr>
               <td>{{ m.onnet[{tariff_descr_by_tar_id tar_id=ztar_id }] }}</td>
               <td>{% for number in m.onnet[{numbers_by_vg_id vg_id=zvg_id}] %} {{ number }} {% if forloop.counter|is_even %}</br>{% else %} &nbsp;&nbsp;&nbsp;&nbsp;  {% endif %}{% endfor %}</td>
            </tr>
        {% endfor %}
    </tbody>
</table>
{% endblock %}
