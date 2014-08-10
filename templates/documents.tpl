{% extends "dashboard_base.tpl" %}

{% block service_description %}

{% include "_onnet_account_page_title.tpl" title=_"Documents" %}

<br />
<div class="pl-10 pr-10 col-md-6">
                {# Period Datepicker #}
                {% include "onnet_widget_documents_datepicker.tpl" headline=_"Period" %}

                {# Calls report #}
                <div id="update_calls_reports_widget">
                    {% include "onnet_widget_calls_reports.tpl" headline=_"Calls report" idname="calls_reports_widget" %}
                </div>

                <div class="hidden-phone">
                    <br /><br />
                    <p id="elcactoimg" align="center"><img  width="60%" src="/lib/images/3.gif" alt="" /></p>
                </div>

</div>

<div id="paytab" class="pl-10 pr-10 col-md-6">
    {% if m.onnet[{get_docs_list docsids="1" month=selectedmonth }] or m.onnet[{get_docs_list docsids="34,35" month=selectedmonth }] %}
        {# Invoices #}
        <div id="update_invoices_widget">
            {% include "onnet_widget_invoices.tpl" headline=_"Invoices" idname="invoices_widget" %}
        </div>
    {% endif %}

    {# Crazy Russian Document - SchetFacturaZ #}
    <div id="update_vatinvoices_widget">
        {% include "onnet_widget_vatinvoices.tpl" headline=_"VAT Invoices" idname="vatinvoices_widget" %}
    </div>

    {# Acts #}
    <div id="update_acts_widget">
        {% include "onnet_widget_acts.tpl" headline=_"Acts" idname="acts_widget" %}
    </div>
</div>

{% endblock %}

