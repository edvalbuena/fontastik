{% extends "onnet_base.tpl" %}

{% block main %}

  <div class="wrapper">    

<div class="section-header">
  <div class="container">
      <div class="row">
          <div class="col-sm-12">
            <h1 class="slideInLeft">
                <span>{% block service_name %}{% endblock %}</span>
            </h1>
          </div>
      </div>
  </div>
</div>

    <div class="container">
      <div class="row">
        <!-- Welcome message
            ================= -->
        <div class="col-md-12">
          {% block service_description %}Empty{% endblock %}
        </div>
      </div>
      {% include "services_row.tpl" %}
    </div>
  </div>
    
{% endblock %}
