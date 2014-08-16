{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}
{% endblock %}

{% block widget_content %}
<table id="make_invoice_table" class="table table-hover table-centered table-condensed">
    <thead>
        <tr>
            <th colspan="3">{_ Issue an invoice _}</th>
        </tr>
    </thead>
    <tbody id="body_mask">
        <tr>
            <td width="50%">{_ Enter the amount, excluding VAT _}</td>
            <td><input class="input input-small-onnet" type="text" id="invoiceme" name="invoiceme" value="" /> {_ rub. _}
                {% validate id="invoiceme" type={numericality minimum=0 maximum=100000} %}
            </td>
            <td>{% button class="btn btn-xs btn-onnet pull-right" action={mask target="body_mask" message=_"Issuing an invoice..."} action={postback postback="invoiceme" delegate="onnet" qarg="invoiceme"} text=_"proceed"%}</td>
        </tr>
    </tbody>
</table>
{% endblock %}

