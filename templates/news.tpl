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
            <span class="title">{% block service_name %}{{ m.rsc[id].publication_start| date:"d N  Y" }}: {{ m.rsc[id].title }}{% endblock %}</span>
            <span class="decoration"></span>
            <span class="decoration"></span>
            <span class="decoration"></span>
          </h2>
        </div>
          {% block service_description %}{{ m.rsc[id].body }}{% endblock %}
        </div>
      </div>
    </div>
  </div>
    
{% endblock %}
