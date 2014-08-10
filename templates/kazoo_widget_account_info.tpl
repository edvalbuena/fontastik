{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}:
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}
<table class="table table-condensed table-hover table-centered">
    <tbody>
      <tr>
        <td>{_ Portal URL _}</td>
        <td><a href="{{ m.zkazoo.portal_url }}" target="_blank">{{ m.zkazoo.portal_url }}</a></td>
      </tr>
      <tr>
        <td>{_ Account _}</td>
        <td>{{ m.zkazoo.get_acc_name.name }}</td>
      </tr>
      <tr>
        <td>{_ Realm _}</td>
        <td>{{ m.zkazoo.get_acc_name.realm }}</td>
      </tr>
    </tbody>
</table>
{% endblock %}

