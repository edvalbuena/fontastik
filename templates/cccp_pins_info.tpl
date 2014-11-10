{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}:
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}
<table class="table table-condensed table-hover table-centered">
    <thead>
        <tr>
            <th style="text-align: center;">{_ PIN _}</th>
            <th style="text-align: center;">{_ Outbound CID _}</th>
            <th style="text-align: center;">{_ Owner _}</th>
        </tr>
    </thead>
    <tbody>
      {% for cred in m.zkazoo.kz_cccp_creds_list %}
        {% if cred["pin"] %}
          <tr>
            <td style="text-align: center;">{{ cred["pin"] }}</td>
            <td style="text-align: center;">{{ cred["outbound_cid"] }}</td>
            <td style="text-align: center;">{{ cred["owner_id"] }}</td>
          </tr>
        {% endif %}
      {% endfor %}
    </tbody>
</table>
{% endblock %}

