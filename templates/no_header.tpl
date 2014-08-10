{% extends "onnet_base.tpl" %}

{% block main %}

  <div class="wrapper">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          {% block service_description %}{% endblock %}
        </div>
      </div>
      {# include "services_row.tpl" #}
    </div>
  </div>

{% endblock %}

