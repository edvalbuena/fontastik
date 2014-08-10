{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }} 
    {% if m.onnet.is_operators_session and m.onnet.credit_info %}
        {% button id="remove_credit_btn" class="btn btn-xs btn-onnet pull-right" text=_"cancel credit"%}
        {% wire id="remove_credit_btn" action={postback postback="remove_credit" delegate="onnet"} %}
    {% endif %}
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}
    <table id="dashboard_credit_table" class="table table-hover table-centered table-condensed">
        {% include "_onnet_widget_dashboard_credit.tpl" %}
    </table>
{% endblock %}
