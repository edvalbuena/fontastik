{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}
    {% if dashboard %}
    {% button class="btn btn-xs btn-onnet pull-right" action={redirect dispatch="account_details"} text=_"all information"%}
    {% else %}
    {% button class="btn btn-xs btn-onnet pull-right" action={redirect dispatch="onnet_dashboard"} text=_"dashboard"%}
    {% endif %}
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}
<table class="table table-condensed table-hover table-centered">
    <thead>
        <tr>
            <th colspan="2">{{ m.onnet[{accounts_table fields="name" limit=1}] }}</th>
        </tr>
    </thead>
    <tbody>
     {% if m.onnet.user_type == 1 %}
     {% if not dashboard %}
        <tr><td>{_ INN / KPP _}</td><td>{{ m.onnet[{accounts_table fields="inn" limit=1}] }} / 
                                  {{ m.onnet[{accounts_table fields="kpp" limit=1}] }}</td></tr>
     {% endif %}
        <tr><td>{_ Contact person _}</td><td>{{ m.onnet[{accounts_table fields="kont_person" limit=1}] }}</td></tr>
     {% endif %}
        <tr><td>E-mail</td><td>{% for email in m.onnet.get_accounts_emails %} {{ email }} {% endfor %}</td></tr>
        <tr><td>{_ Phone _}</td><td>{{ m.onnet[{accounts_table fields="phone" limit=1}] }}</td></tr>
     {% if not dashboard %}
        <tr><td>{_ Fax _}</td><td>{{ m.onnet[{accounts_table fields="fax" limit=1}] }}</td></tr>
        <tr><td>{_ Registered Office Address _}</td><td>{{ m.onnet[{format_address addrtype=0}] }}</td></tr>
        <tr><td>{_ Postal Address _}</td><td>{{ m.onnet[{format_address addrtype=1}] }}</td></tr>
        <tr><td>{_ Billing Address _}</td><td>{{ m.onnet[{format_address addrtype=2}] }}</td></tr>
     {% if m.onnet.user_type == 1 %}
        <tr><td>{_ Director _}</td><td>{{ m.onnet[{accounts_table fields="gen_dir_u" limit=1}] }}</td></tr>
        <tr><td>{_ Chief accountant _}</td><td>{{ m.onnet[{accounts_table fields="gl_buhg_u" limit=1}] }}</td></tr>
     {% endif %}
     {% endif %}
    </tbody>
</table>
{% endblock %}

