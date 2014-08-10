{% extends "onnet_widget_dashboard.tpl" %}
{% block widget_headline %}
    {{ headline }}
    {% button class="btn btn-xs btn-onnet pull-right" action={submit target="send-fax-form"} text=_"send fax"%}
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}
{% wire id="send-fax-form" type="submit" postback="send_fax" delegate="controller_send_fax" %}
<form id="send-fax-form" method="post" action="postback" class="form">
<table class="table table-condensed table-hover table-centered" style="table-layout: fixed;">
<tbody id="send-fax-tbody">
    {% include "_send_fax_tbody.tpl" %}
</tbody>
</table>
</form>
{% endblock %}
