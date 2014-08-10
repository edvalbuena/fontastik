{% extends "dashboard_base.tpl" %}

{% block service_description %}

  {% include "_onnet_account_page_title.tpl" title=_"Outgoing Faxes" %}

<br />
<div class="pl-10 pr-10 col-md-6">
                {# Send Fax #}
                {% include "kazoo_widget_send_fax_form.tpl" cat="text" headline=_"Send Fax Form" %}
</div>
<div class="pl-10 pr-10 col-md-6">
                {# Last Outgoing Faxes #}
                {% include "kazoo_widget_list_outgoing_faxes.tpl" headline=_"Recent outgoing faxes" %}
</div>

{% endblock %}
