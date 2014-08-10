{% extends "dashboard_base.tpl" %}

{% block service_description %}

  {% include "_onnet_account_page_title.tpl" title=_"Incoming Faxes" %}

<br />
<div class="pl-10 pr-10 col-md-6">
    {# List Inbound Faxes #}
    {% include "kazoo_widget_list_incoming_faxes.tpl" headline=_"Recent incoming faxes" %}
</div>
<div class="pl-10 pr-10 col-md-6">

</div>

{% endblock %}
