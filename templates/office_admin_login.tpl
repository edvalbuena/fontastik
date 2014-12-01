{% extends "services.tpl" %}

{% block service_name %}{_ Sign in _}{% endblock %}

{% block service_description %}

<div class="row">
    <div class="col-sm-2">
        {% if m.onnet.has_virtual_office %}
            {% if not m.onnet.is_account_admin_auth %}
                {% wire id="admin_sign_in_page_form" type="submit" postback={account_admin_onnetauth} delegate="onnet" %}
                <form id="admin_sign_in_page_form" class="input-group" method="post" action="postback">
                    <div><p>{_ Admin Login _}</p></div>
                    <input type="text" class="form-control mb-10" placeholder="{_ Login _}" id="username_page"
                            name="username" value=""  autofocus="autofocus" autocapitalize="off" autocomplete="on" tabindex=1 />
                    {# validate id="username_page" type={presence} #}

                    <input type="password" class="form-control mb-10" placeholder="{_ Password _}"
                            id="password_page" name="password" value="" autocomplete="on" tabindex=2/>

                    <input type="text" class="form-control mb-10" placeholder="{_ Account _}"
                            id="account_page" name="account" value="" autocomplete="on" tabindex=3/>

                    {% button text=_"Enter" action={submit target="admin_sign_in_page_form"} class="btn btn-default" style="min-width: 6em;" %}
                </form>
            {% endif %}
        {% endif %}
    </div>
</div>

{% endblock %}
