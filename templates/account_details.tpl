{% extends "dashboard_base.tpl" %}

{% block service_description %}

{% include "_onnet_account_page_title.tpl" title=_"Account details" %}

<br />
<div class="pl-10 pr-10 col-md-6">
    {% include "onnet_widget_account_details.tpl" cat="text" headline=_"Company details" %}
</div>
<div class="pl-10 pr-10 col-md-6">
    {% include "onnet_widget_agreements.tpl" headline=_"Current agreements" %}
</div>

{% endblock %}
