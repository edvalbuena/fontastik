{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}
    {% if lines %}
        {% button class="btn btn-xs btn-onnet pull-right" action={update target="paytab" template="onnet_widget_payments_list.tpl" headline=_"Payments list"} text=_"show all" %}
    {% else %}
        {% button class="btn btn-xs btn-onnet pull-right" action={update target="paytab" template="onnet_widget_payments_list.tpl" headline=_"Payments list" lines=10} text=_"last ten" %}
    {% endif %}
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}
<table class="table table-hover table-centered table-condensed">
    <thead>
        <tr>
            <th>{_ Date _}</th>
            <th class="td-center">{_ Sum _}, {_ rub. _} <span class="onnet-07em">({_ excl VAT _})</span></th>
            <th class="td-center">{_ Comment _}</th>
        </tr>
    </thead>
    <tbody>
        {% if lines %}
            {% for amount, date, comment in m.onnet[{account_payments limit=lines}] %}
                <tr>
                    <td>{{ date }}</td>
                    <td class="td-center">{{ amount }}</td>
                    <td class="td-center">{% if comment|match:"ssist" %}{_ ASSIST _}
                                            {% elseif comment|match:"DengiOnl" %}{_ Dengi Online _}
                                            {% elseif comment|match:"Yandex.Money" %}{_ Yandex.Money _}
                                            {% else %}{_ Wire transfer _}
                                            {% endif %}
                    </td>
                </tr>
            {% endfor %}
        {% else %}
            {% for amount, date, comment in m.onnet.account_payments %}
                <tr>
                    <td>{{ date }}</td>
                    <td class="td-center">{{ amount }}</td>
                    <td class="td-center">{% if comment|match:"ssist" %}{_ ASSIST _}
                                            {% elseif comment|match:"DengiOnl" %}{_ Dengi Online _}
                                            {% elseif comment|match:"Yandex.Money" %}{_ Yandex.Money _}
                                            {% else %}{_ Wire transfer _}
                                            {% endif %}
                    </td>
                </tr>
            {% endfor %}
        {% endif %}
    </tbody>
</table>
{% endblock %}

