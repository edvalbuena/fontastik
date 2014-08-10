{% extends "dashboard_base.tpl" %}

{% block service_description %}

  {% include "_onnet_account_page_title.tpl" title=_"Status panel" %}

<br />
<div class="pl-10 pr-10 col-md-6">
               {# Call restrictions #}
                {% include "kazoo_widget_call_restrictions.tpl" headline=_"Call restrictions" %}

                {# Blank Widget #}
                {# include "onnet_widget_blank.tpl" headline=_"Blank widget" #}
</div>
<div class="pl-10 pr-10 col-md-6">
                {# Registrations #}
                {% if m.onnet.is_prepaid or m.onnet.is_operators_session %}
                  {% if m.zkazoo.kz_list_users or m.onnet.is_operators_session %}
                    {% include "kazoo_widget_account_info.tpl" cat="text" headline=_"Portal account details" %}
                    {% include "kazoo_widget_users_info.tpl" cat="text" headline=_"Portal users details" %}
                  {% endif %}
                  {% include "kazoo_widget_registrations.tpl" cat="text" headline=_"Registered SIP devices" %}
                {% endif %}
</div>

{% endblock %}
