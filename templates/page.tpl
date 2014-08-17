{% extends "onnet_base.tpl" %}

{% block main %}

  <div class="wrapper">    

  <div class="section-header">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
              <h1 class="slideInLeft">
                  <span>{{ m.rsc[id].title }}</span>
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
          {% block service_description %}{{ m.rsc[id].body }}{% endblock %}
        </div>
      </div>
    </div>
  </div>
    
{% endblock %}
