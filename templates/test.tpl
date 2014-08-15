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
<br />
{% print m.search[{query cat='news' sort='-rsc.publication_start'}] %}
<br />
{% for id in m.search[{latest cat='news' pagelen=3}] %}
Title:  {{ m.rsc[id].title }}
<br />
Summary:  {{ m.rsc[id].summary }}
<br />
Media:  {{ m.rsc[id].media }}
<br />
Medium:  {{ m.rsc[id].medium }}
<br />
depiction:  {% print m.rsc[id].depiction %}
<br />
publication_start:  {% print m.rsc[id].publication_start %}
<br />
image:  {% image m.rsc[id].depiction class="media-object" alt="Blog Message" %}
<br />

{% for k,v in m.rsc[id] %}
  {{ k }} - {{ v }} <br/>
{% endfor %}

<br />
{% endfor %}
{% endblock %}
