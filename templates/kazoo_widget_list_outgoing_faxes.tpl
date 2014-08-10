{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}
    {% button class="btn btn-xs btn-onnet pull-right" action={update target="outgoing_faxes_id" template="_outgoing_faxes_tbody.tpl"} text=_"refresh"%}
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}
<table class="table table-condensed table-hover table-centered">
    <thead>
        <tr>
            <th style="text-align: center;">{_ Date _}</th>
            <th style="text-align: center;">{_ Fax number _}</th>
            <th style="text-align: center;">{_ Status _}</th>
            <th style="text-align: center;">{_ Download _}</th>
            <th style="text-align: center;">{_ Delete _}</th>
        </tr>
    </thead>
    <tbody id="outgoing_faxes_id">
        {% include "_outgoing_faxes_tbody.tpl" %} 
    </tbody>
</table>
{% endblock %}
