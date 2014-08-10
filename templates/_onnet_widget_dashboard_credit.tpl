{% for agrm_id,amount,prom_date,prom_till,debt,pay_id in m.onnet.credit_info %}
    <thead>
        <tr>
            <th width="35%">{_ Status _}</th>
            <th width="65%">{% if pay_id == 0 %}<span class="zwarning"> {_ Active _} </span>{% elif  pay_id == -1 %}<span class="zalarm"> {_ Expired _} </span>{% else %} {_ Undefined _} {% endif %}</th>
        </tr>
    </thead>
    <tbody>
            <tr><td>{_ Credit amount _}</td><td>{{ amount }} {_ rub. _}</td></tr>
            <tr><td>{_ Maturity date _}</td><td>{{ prom_till[2] }} {_ rub. _}</td></tr>
    </tbody>
{% empty %}
    <thead>
        <tr>
            <th width="90%" colspan="2">{_ Apply for credit _}</th>
            <th width="10%"> </th>
        </tr>
    </thead>
    <tbody>
            <tr>
                {% wire type="submit" id="credit-form" postback="credit_form" delegate="onnet" %}
                <form id="credit-form" method="post" action="postback">
                <td>{_ Choose amount _}</td>
                <td>
                       <input type="radio" name="creditme" value="1180" /> 1180 {_ rub. _}
                       <input type="radio" name="creditme" value="2360" /> 2360 {_ rub. _}
                       <input type="radio" name="creditme" value="3540" /> 3540 {_ rub. _}
                       {% if m.onnet.is_operators_session %}
                           <input type="radio" name="creditme" value="5900" /> 5900 {_ rub. _}
                       {% endif %}
                </td>
                <td>{% button class="btn btn-xs btn-onnet pull-right" text=_"proceed"%}</td>
                </form>
            </tr>
    </tbody>
{% endfor%}
