{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}
{% button id=#sendreq class="btn btn-xs btn-onnet pull-right disabled" text=_"send request"
                                          action={confirm text=_"Do you really want to sent this request?" 
                                                          action={submit target="additional-number-order-form"}
                                                          action={enable target="orderbtn"}
                                                          action={disable target="cancelorderbtn"}
                                                 } 

%}

{% button class="btn btn-xs btn-onnet pull-right" text=_"add number" 
                                          action={dialog_open template="_free_numbers_table.tpl" title=[_"Add phone number to your order"] subject_id=id} 
                                          action={growl text=_"Please wait while numbers are loading..."}
                                          action={enable target=#sendreq}
%}
 <select name="customeremail">
{% for email in m.onnet.get_accounts_emails %}
  <option value="{{ email }}">{{ email }}</option>
{% endfor %}
</select>
{% endblock %}

{% block widget_content %}
<table class="table table-bordered table-hover table-centered">
    <tbody id="mytbodyid">
        {% for number_id, number, price in m.onnet.get_predefined_number %}
            {% include "_add_line_with_number.tpl" number_id=number_id number=number price=price %}
        {% endfor %}
    </tbody>
</table>
{% endblock %}

