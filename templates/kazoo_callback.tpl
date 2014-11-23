{% extends "dashboard_base.tpl" %}

{% block service_description %}

  {% include "_onnet_account_page_title.tpl" title=_"Callback service" %}

<div class="pl-10 pr-10 col-md-12" style="margin-bottom: 1em;">
                <h5>{_ Callback service phone number _}: {{ m.config.onnet.callback_number.value }}</h5>
                <h5>{_ PIN access phone number _}: {{ m.config.onnet.callingcards_number.value }}</h5>
</div>
<div class="pl-10 pr-10 col-md-6">
                {# CIDs #}
    {% if m.onnet.is_account_admin_auth %}
                {% include "onnet_widget_add_cccp_cid.tpl" %}
    {% endif %}
                {% include "cccp_cids_info.tpl" cat="text" headline=_"Authorized CID list" %}
</div>
<div class="pl-10 pr-10 col-md-6">
                {# Pins #}
    {% if m.onnet.is_account_admin_auth %}
                {% include "onnet_widget_add_cccp_pin.tpl" %}
    {% endif %}
                {% include "cccp_pins_info.tpl" headline=_"Pin-code list" %}
</div>

{% if not m.onnet.is_account_admin_auth %}
    <div class="pl-10 pr-10 col-md-12" style="margin-top: 1em;">
                <h5>{_ Please authorize as administratior to display of manage access credentials _}.</h5>
    </div>
{% endif %}

{% endblock %}
