{% extends "dashboard_base.tpl" %}

{% block service_description %}

  {% include "_onnet_account_page_title.tpl" title=_"Dashboard" %}

<br />
<div class="pl-10 pr-10 col-md-6">
  {% include "onnet_widget_account_details.tpl" headline=_"Account details" dashboard %}         
  {% include "onnet_widget_dashboard_change_password.tpl" %}
  {% include "onnet_widget_dashboard_finance.tpl" headline=_"Account" %}

  {% if m.onnet.credit_able %}
  {# Credit status #}
  {% include "onnet_widget_dashboard_credit.tpl" headline=_"Credit" idname="useless_dashboard_credit_table" %}
  {% endif %}

</div>
<div class="pl-10 pr-10 col-md-6">
  {% include "onnet_widget_monthly_fees.tpl" headline=_"Current month services, RUB (excl VAT)" %}
  {% if m.onnet[{is_service_provided type=4}] %}
  {# Account status #}
  {% include "onnet_widget_order_additional_number.tpl" %}
  {% include "onnet_widget_telephony.tpl" headline=_"Telephony" %}
  {% endif %}

  {% if m.onnet[{is_service_provided type=0}] %}
  {# Credit status #}
  {% include "onnet_widget_internet.tpl" headline=_"Internet" %}
  {% endif %}

  {% if m.onnet.is_prepaid %}
  {% include "onnet_widget_dashboard_incoming_calls.tpl" headline=_"Last incoming calls of today" %}
  {% endif %}
</div>

{% endblock %}
