{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}:
    {% button class="btn btn-xs btn-onnet pull-right" text=_"add pin" id="addpinbtn"
                                  action={enable target="add_pin"}
                                  action={add_class class="disabled" target="addpinbtn"}
                                  action={enable target="canceladdpinbtn"}
    %}
    {% button class="btn btn-xs btn-onnet pull-right disabled" text=_"cancel" id="canceladdpinbtn"
                                  action={disable target="add_pin"}
                                  action={enable target="addpinbtn"}
                                  action={add_class class="disabled" target="canceladdpinbtn"}
                                  action={update target="add-cccp-pin-form" template="add_new_pin.tpl"
                                                                                       headline=_"#"
                                                                                       idname="add_pin" class="disabled"}
    %}
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}
<table id="auth_pin_table" class="table table-condensed table-hover table-centered">
    {% include "_authorized_pin_table.tpl" %}
</table>
{% endblock %}

