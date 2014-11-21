{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}:
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}
<table class="table table-condensed table-hover table-centered">
    <thead>
        <tr>
            <th width="25%" style="text-align: center;">{_ Username _}</th>
            <th width="20%" style="text-align: center;">{_ IP address _}</th>
            <th width="10%" style="text-align: center;">{_ Port _}</th>
            <th width="40%" style="text-align: center;">{_ Agent _}</th>
            <th width="5%" style="text-align: center;">{_ Details _}</th>
        </tr>
    </thead>
    <tbody>
       {% for username, ip_address, port, agent, details in m.zkazoo.get_registrations %}
           <tr><td style="text-align: center;">{{ username }}</td><td style="text-align: center;">{% if agent|match:"PBX" %}<a href="https://{{ ip_address }}" target="_blank">{{ ip_address }}</a>{% else %}{{ ip_address }}{% endif %}</td><td style="text-align: center;">{{ port }}</td><td style="text-align: center;">{{ agent }}</td><td id={{ username }} style="text-align: center;"><i class="fa fa-info-circle" title="{_ Details _}"></i></td></tr>
           {% wire id=username action={ dialog_open title=_"Registration details" template="_details.tpl" arg=details } %}
       {% endfor %}
    </tbody>
</table>
{% endblock %}

