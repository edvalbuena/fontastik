{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}
    {% button class="btn btn-xs btn-onnet pull-right" action={redirect dispatch="finance_details"} text=_"make payments"%}
    {% button class="btn btn-xs btn-onnet pull-right" text=_"change password" id="changepwdbtn"
                                  action={enable target="change_password_id"}
                                  action={disable target="changepwdbtn"}
                                  action={enable target="cancelchangepwdbtn"}
    %}
    {% button class="btn btn-xs btn-onnet pull-right disabled" text=_"cancel password change" id="cancelchangepwdbtn"
                                  action={disable target="change_password_id"}
                                  action={enable target="changepwdbtn"}
                                  action={disable target="cancelchangepwdbtn"}
    %}
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}
<table class="table table-condensed table-hover table-centered">
    <thead>
        <tr>
            <th style="width: 35%;">{_ Account status _}</th>
            {% with m.onnet.account_status as account_status %}
            <th>{% if account_status[1] == 0 %}<span class="zprimary">{_ Active _}</span> 
                            {% else %}<span class="zalarm">{_ Blocked _} <span class="onnet-07em">({{ account_status[2] }})</span>{% endif %}</span>
            </th>
            {% endwith %}
        </tr>
    </thead>
    <tbody>
        {% if m.onnet.is_prepaid %}
            <tr><td>{_ Current balance _}</td><td>{{ m.onnet.account_balance }} {_ rub. _} <span class="onnet-07em">({_ excl VAT _})</span></td></tr>
        {% else %}
            <tr><td>{_ Current month expenses _}</td><td>{{ m.onnet.calc_curr_month_exp }} {_ rub. _} <span class="onnet-07em">({_ excl VAT _})</span></td></tr>
        {% endif %}  
        {% for amount, date, comment in m.onnet[{account_payments limit=1}] %}
            <tr><td>{_ Previous payment _}</td><td>{{ date }} - {{ amount }} {_ rub. _} <span class="onnet-07em">({_ excl VAT _})</span> - {% if comment|match:"ssist" %}{_ ASSIST _}{% elseif comment|match:"DengiOnl" %}{_ Dengi Online _}{% elseif comment|match:"Yandex.Money" %}{_ Yandex.Money _}{% else %}{_ Wire transfer _}{% endif %}</td></tr>
        {% endfor %}
    </tbody>
</table>
{% if m.onnet.is_prepaid %}
    <span id="set_lb_notify_level_tpl">
        {% include "_set_lb_notify_level.tpl" %}
    </span>
{% endif %}  
{% endblock %}

