{% extends "dashboard_base.tpl" %}

{% block service_description %}

  {% include "_onnet_account_page_title.tpl" title=_"Call recordings" %}
  <div class="pl-10 pr-10 col-md-6">
    <div id="recording_status_id">
      {% include "_recording_status.tpl" %}
    </div>
    {# List Call Recordings #}
    {% include "kazoo_widget_list_call_recordings.tpl" headline=_"Last month recordings" %}
  </div>
  <div class="pl-10 pr-10 col-md-6">

  </div>

{% endblock %}
