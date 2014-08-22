{% extends "dashboard_base.tpl" %}

{% block service_description %}

{% include "_onnet_account_page_title.tpl" title=_"Payments" %}

<br />
<div class="pl-10 pr-10 col-md-6">
                {# Make invoce #}
                {% include "onnet_widget_make_invoice.tpl" cat="text" headline=_"Wire transfer" idname="make_invoice_widget" %}

                {# Make payment #}
                {% include "onnet_widget_make_payment.tpl" cat="text" headline=_"Online payments" %}

                {# Make credit #}
                {% if m.onnet.credit_able %}
                {# Credit status #}
                <div id="update_widget_dashboard_credit">
                  {% include "onnet_widget_dashboard_credit.tpl" headline=_"Credit" %}
                </div>
                {% endif %}
</div>

<div id="paytab" class="pl-10 pr-10 col-md-6">
                {# Account status #}
                {% include "onnet_widget_finance.tpl" cat="text" headline=_"Account" %}

                {# Payments List #}
                {% include "onnet_widget_payments_list.tpl" headline=_"Payments list" lines=7 %}
</div>

{% endblock %}
