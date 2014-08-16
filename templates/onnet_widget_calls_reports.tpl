{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}
    {% if not m.onnet[{get_docs_list docsids="39" month=selectedmonth }] %} {% button class="btn btn-xs btn-onnet pull-right" action={mask target="reports_body_to_mask" message=_"Preparing reports..."} action={postback postback="callsreportme" delegate="onnet" qarg="docsmonthInput"} text=_"generate" %} {% endif %}
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}
<table id="calls_reports_table" class="table table-condensed table-hover table-centered">
    <tbody id="reports_body_to_mask">
      {% for oper_name, order_id, order_num, order_date, curr_summ, tax_summ, total_summ in m.onnet[{get_docs_list docsids="39" month=selectedmonth }] %}
        <tr>
            <td><a href="/getlbdocs/id/{{order_id}}">{{ order_date[2]|date:'Y-m-d' }}</a></td>
            <td><a href="/getlbdocs/id/{{order_id}}">{{ oper_name }}</a></td>
        </tr>
      {% endfor %}
    </tbody>
</table>

{% endblock %}

