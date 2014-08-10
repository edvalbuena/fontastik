{% extends "dashboard_base.tpl" %}

{% block service_description %}

  {% include "_onnet_account_page_title.tpl" title=_"Call recordings" %}

<br />
<div class="pl-10 pr-10 col-md-6">
    {# List Call Recordings #}
    {% include "kazoo_widget_list_call_recordings.tpl" headline=_"Last month recordings" %}
</div>
<div class="pl-10 pr-10 col-md-6">

</div>

{% endblock %}
