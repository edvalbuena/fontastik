{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}

{% button class="btn btn-xs btn-onnet pull-right" text=_"add" 
                                          action={submit target="add-cccp-cid-form"}
%}

<i class="fa fa-mobile-phone fa-lg hidden-md"></i>
<input type="text" class="input input-number-onnet" style="margin-right: 0.5em;" name="cid_number" placeholder="1234567" maxlength="12"/>

<i class="fa fa-slack hidden-md"></i>
<select name="outbound_cid" style="margin-right: 0.5em;">
{% for number in m.zkazoo.get_acc_numbers %}
  <option value="{{ number }}">{{ number }}</option>
{% endfor %}
</select>

<i class="fa fa-user hidden-md"></i>
<select name="user_id">
{% for user in m.zkazoo.kz_list_users %}
  <option value="{{ user["id"] }}">{{ user["username"] }}</option>
{% endfor %}
</select>

{% endblock %}

