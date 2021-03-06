{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}:
  {% if m.onnet.is_account_admin_auth %}
    {% button class="btn btn-xs btn-onnet pull-right" text=_"add cid" id="addcidbtn"
                                  action={enable target="add_cid"}
                                  action={add_class class="disabled" target="addcidbtn"}
                                  action={enable target="canceladdcidbtn"}
    %}
    {% button class="btn btn-xs btn-onnet pull-right disabled" text=_"cancel" id="canceladdcidbtn"
                                  action={disable target="add_cid"}
                                  action={enable target="addcidbtn"}
                                  action={add_class class="disabled" target="canceladdcidbtn"}
                                  action={update target="add-cccp-cid-form" template="add_new_cid.tpl"
                                                                                       headline=_"#"
                                                                                       idname="add_cid" class="disabled"}
    %}
  {% endif %}
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}
<table id="auth_cid_table" class="table table-condensed table-hover table-centered">
    {% include "_authorized_cid_table.tpl" %}
</table>
{% endblock %}

