{% extends "onnet_base.tpl" %}

{% block main %}

  <div class="wrapper">    
    <div class="container">
      <div class="row">
        <!-- Welcome message
            ================= -->
        <div class="col-md-12">
        <div class="block-header">
          <h2>
            <span class="title">{% block service_name %}{% endblock %}</span>
            <span class="decoration"></span>
            <span class="decoration"></span>
            <span class="decoration"></span>
          </h2>
        </div>
          {% block service_description %}Empty{% endblock %}
        </div>
      </div>
      {% include "services_row.tpl" %}
    </div>
  </div>
    
{% endblock %}
