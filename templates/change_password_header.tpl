{% extends "onnet_widget_header_only_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}
{% button id=#sendreq class="btn btn-xs btn-onnet pull-right" text=_"send request"
                                          action={confirm text=_"Do you really want to change password?" 
                                                          action={submit target="change-password-form"}
                                                          action={enable target="changepwdbtn"}
                                                          action={disable target="cancelchangepwdbtn"}
                                                 }
%}
<select name="customeremail">
{% for email in m.onnet.get_accounts_emails %}
  <option value="{{ email }}">{{ email }}</option>
{% endfor %}
</select>
{% endblock %}

