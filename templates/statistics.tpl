{% extends "dashboard_base.tpl" %}

{% block service_description %}

{% include "_onnet_account_page_title.tpl" title=_"Statistics" %}

<br />
<div class="pl-10 pr-10 col-md-6">
    {# Filter #}
    {% include "onnet_widget_statistics_filter.tpl" headline=_"Phone calls statistics" %}

    <div id="update_onnet_widget_statistics_fixed_costs">
        {# Monthly fixed expenses #}
        {% include "onnet_widget_statistics_fixed_costs.tpl" headline=_"Costs for current day, RUB (excl VAT)"  idname="fixed_costs_widget" %}
    </div>
</div>

<div id="paytab" class="pl-10 pr-10 col-md-6">
                <div id="update_onnet_widget_calls_list">
                    {# Calls list #}
                    {% include "onnet_widget_calls_list.tpl" headline=_"Phone calls statistics" idname="calls_list_widget" direction="1" operator="1,6,881,1017" %}
                </div>
</div>

{% endblock %}

