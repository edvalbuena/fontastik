{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}
    {% button class="btn btn-xs btn-onnet pull-right" action={redirect dispatch="#"} text=_"show all"%}
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}
            Пустой виджет
{% endblock %}

