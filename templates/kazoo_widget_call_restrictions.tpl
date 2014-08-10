{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}
<table class="table table-condensed table-hover table-centered">
    <thead>
        <tr>
            <th width="40%" style="text-align: center;" colspan="2">{_ Classifier _}</th>
            <th width="30%" style="text-align: center;" {% if m.onnet.is_operators_session %}colspan="2"{% endif %}>{_ Trunks _}</th>
            <th width="30%" style="text-align: center;" {% if m.onnet.is_operators_session %}colspan="2"{% endif %}>{_ Account _}</th>
        </tr>
    </thead>
    <tbody id="call_restrictions_tbl_id">
        {% include "_call_restrictions_tbl.tpl" %}
        <tr>
          <td colspan="6" style="text-align: center; font-size: x-small; background-color: rgba(62,122,140,.1);">
            {_ User and device level restrictions could be managed in particular service interface _}
          </td>
        </tr>
    </tbody>
</table>

{% endblock %}

