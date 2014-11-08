{% extends "dashboard_base.tpl" %}

{% block service_description %}

  {% include "_onnet_account_page_title.tpl" title=_"Calling Cards and Callback" %}

<br />
<div class="pl-10 pr-10 col-md-6">
                {# CIDs #}
                {% include "cccp_cids_info.tpl" cat="text" headline=_"CID list" %}
</div>
<div class="pl-10 pr-10 col-md-6">
                {# Pins #}
                {% include "cccp_pins_info.tpl" headline=_"Pins list" %}
</div>

{% endblock %}
