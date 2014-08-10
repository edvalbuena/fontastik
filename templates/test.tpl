{% extends "no_header.tpl" %}

{% block service_description %}
<br />
{% print m.onnet.is_operators_session %}
<br />
{% print m.onnet.is_auth %}
<br />
{% print m.session.auth_user_id %}
<br />
{% print m.session.lb_user_id %}
<br />
{% print m.modules.info.mod_zkazoo.enabled %}
<br />
{% print m.zkazoo.get_kazoo_account_id %}
{% endblock %}
