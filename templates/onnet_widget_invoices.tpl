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
            <th>{_ # _}</th>
            <th>{_ Date _}</th>
            <th>{_ Counterparty _}</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
    {% if m.onnet.is_prepaid %}
      {% for oper_name, order_id, order_num, order_date, curr_summ, tax_summ, total_summ in m.onnet[{get_docs_list docsids="34" month=selectedmonth }] %}
        <tr>
            <td><a href="/getlbdocs/id/{{order_id}}">{{ order_num }}</a></td>
            <td><a href="/getlbdocs/id/{{order_id}}">{{ order_date[2]|date:'Y-m-d' }}</a></td>
            <td><a href="/getlbdocs/id/{{order_id}}">{{ oper_name }}</a></td>
            <td class="text-center"><i id=inv{{order_id}} class="fa fa-envelope-o"></i></td>
        </tr>
        {% wire id="inv"++order_id action={ dialog_open title=_"Send invoice" template="_email_invoice_dialog.tpl" arg=order_id } %}
      {% endfor %}
      {% for oper_name, order_id, order_num, order_date, curr_summ, tax_summ, total_summ in m.onnet[{get_docs_list docsids="35" month=selectedmonth }] %}
        <tr>
            <td><a href="/getlbdocs/id/{{order_id}}">{{ order_num }}</a></td>
            <td><a href="/getlbdocs/id/{{order_id}}">{{ order_date[2]|date:'Y-m-d' }}</a></td>
            <td><a href="/getlbdocs/id/{{order_id}}">{{ oper_name }}</a></td>
            <td class="text-center"><i id=inv{{order_id}} class="fa fa-envelope-o"></i></td>
        </tr>
        {% wire id="inv"++order_id action={ dialog_open title=_"Send invoice" template="_email_invoice_dialog.tpl" arg=order_id } %}
      {% endfor %}
    {% else %}
      {% for oper_name, order_id, order_num, order_date, curr_summ, tax_summ, total_summ in m.onnet[{get_docs_list docsids="1" month=selectedmonth }] %}
        <tr>
            <td><a href="/getlbdocs/id/{{order_id}}">{{ order_num }}</a></td>
            <td><a href="/getlbdocs/id/{{order_id}}">{{ order_date[2]|date:'Y-m-d' }}</a></td>
            <td><a href="/getlbdocs/id/{{order_id}}">{{ oper_name }}</a></td>
            <td class="text-center"><i id=inv{{order_id}} class="fa fa-envelope-o"></i></td>
        </tr>
        {% wire id="inv"++order_id action={ dialog_open title=_"Send invoice" template="_email_invoice_dialog.tpl" arg=order_id } %}
      {% endfor %}
    {% endif %}
    </tbody>
</table>
{% endblock %}

