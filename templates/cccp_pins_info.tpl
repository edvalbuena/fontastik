{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}:
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}
<table class="table table-condensed table-hover table-centered">
    <thead>
        <tr>
            <th style="text-align: center;">{_ Username _}</th>
            <th style="text-align: center;">{_ Email _}</th>
            <th style="text-align: center;">{_ Privilege level _}</th>
        </tr>
    </thead>
    <tbody>
      {% for user in m.zkazoo.kz_list_users %}
      <tr>
        <td style="text-align: center;">{{ user["username"] }}</td>
        <td style="text-align: center;">{{ user["email"] }}</td>
        <td style="text-align: center;">{{ user["priv_level"] }}</td>
      </tr>
      {% endfor %}
    </tbody>
</table>
{% endblock %}

