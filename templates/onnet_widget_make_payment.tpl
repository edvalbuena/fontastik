{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}
{% endblock %}

{% block widget_content %}
<table class="table table-hover table-centered table-condensed">
    <thead>
        <tr style="height: 10px; color: white!important; background-color: white!important;"><td colspan="3"></td></tr>
        <tr style="background-color:#F8F8F8">
            <th><span style="color: #FF9002">{_ ASSIST - Electronic Payment System _}</span></th>
            <th colspan="2"><span style="display: block; text-align: right;"><img src="/lib/images/qiwi.png" height="18px" title="QIWI" alt="QIWI"><img src="/lib/images/yandex-money.png" title="Yandex" alt="Yandex" height="18px"><img src="/lib/images/webmoney.png" height="18px" title="Webmoney" alt="Webmoney"></span></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td width="55%">{_ Enter an amount to pay _}</td>
            <td><input class="input input-small-onnet" type="text" id="assist_pay" name="assist_pay" value="" /> {_ rub. _}
                {% validate id="assist_pay" type={numericality minimum=0 maximum=15000 not_a_number_message=_"Must be a number."} %}
            </td>
            <td>{% button class="btn btn-xs btn-onnet pull-right" action={postback postback="assist_pay" delegate="onnet" qarg="assist_pay"} text=_"proceed"%}</td>
        </tr>
    </tbody>
    {% if m.modules.info.mod_zomoney.enabled %}
    <thead>
        <tr style="height: 10px; color: white!important; background-color: white!important;"><td colspan="3"></td></tr>
        <tr style="background-color:#F8F8F8">
            <th><span style="color: #FF9002">{_ Dengi Online - Electronic Payment System _}</span></th>
            <th colspan="2">
                <span style="display: block; text-align: right;">
                  <img src="/lib/images/visa.png" height="18px" title="VISA" alt="VISA"><img src="/lib/images/mastercard.png" height="18px" title="MASTERCARD" alt="MASTERCARD"><img src="/lib/images/mts-bank.png" height="18px" title="MTS Bank" alt="MTS Bank">
                </span>
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td width="55%">{_ Enter an amount to pay _} (300 - 4500 {_ rub. _})</td>
            <td><input class="input input-small-onnet" type="text" id="dengionline_pay" name="dengionline_pay" value="" /> {_ rub. _}
                {% validate id="dengionline_pay" type={numericality minimum=0 maximum=4500 not_a_number_message=_"Must be a number."} %}
            </td>
            <td>{% button class="btn btn-xs btn-onnet pull-right" action={postback postback="dengionline_pay" delegate="mod_zomoney" qarg="dengionline_pay"} text=_"proceed"%}</td>
        </tr>
    </tbody>
    {% endif %}
    {% if m.modules.info.mod_zyamoney.enabled %}
    <thead>
        <tr style="height: 10px; color: white!important; background-color: white!important;"><td colspan="3"></td></tr>
        <tr style="background-color:#F8F8F8">
            <th><span style="color: #FF9002">{_ Yandex.Money - Electronic Payment System _}</span></th>
            <th colspan="2">
                <div class="btn-group pull-right">
                   {% wire id="yapayment_yandex" action={set_value  id="yapayment_type" value="PC"}
                                                 action={script script="$('#yapayment_yandex_checked').css('visibility', 'visible');"}
                                                 action={script script="$('#yapayment_crcards_checked').css('visibility', 'hidden');"}
                   %}
                    <button id="yapayment_yandex" class="btn btn-xs btn-onnet">
                       <i id="yapayment_yandex_checked" style="visibility:visible;" class="fa fa-check"></i>
                       <img src="/lib/images/yandex-money.png" title="Yandex" alt="Yandex" height="18px">
                    </button>
                   {% wire id="yapayment_crcards" action={set_value  id="yapayment_type" value="AC"}
                                                  action={script script="$('#yapayment_crcards_checked').css('visibility', 'visible');"}
                                                  action={script script="$('#yapayment_yandex_checked').css('visibility', 'hidden');"}
                   %}
                    <button id="yapayment_crcards" class="btn btn-xs btn-onnet">
                       <i id="yapayment_crcards_checked" style="visibility:hidden;" class="fa fa-check"></i>
                       <img src="/lib/images/visa.png" height="18px" title="VISA" alt="VISA"><img src="/lib/images/mastercard.png" height="18px" title="MASTERCARD" alt="MASTERCARD">
                    </button>
                    <input id="yapayment_type" name="yapayment_type" type="hidden" value="PC" />
                </div>
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td width="55%">{_ Enter an amount to pay _}</td>
            <td><input class="input input-small-onnet" type="text" id="yamoney_pay" name="yamoney_pay" value="" /> {_ rub. _}
                {% validate id="yamoney_pay" type={numericality minimum=0 maximum=15000 not_a_number_message=_"Must be a number."} %}
            </td>
            <td>{% button class="btn btn-xs btn-onnet pull-right" text=_"proceed" action={postback postback="yamoney_pay" delegate="mod_zyamoney" qarg="yamoney_pay" qarg="yapayment_type"} %}</td>
        </tr>
    </tbody>
    {% endif %}
</table>
{% endblock %}

