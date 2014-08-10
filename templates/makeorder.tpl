{% extends "no_header.tpl" %}

{% block service_description %}
<br />
<div class="center-block max-800">

  <div class="panel panel-default">
    <div class="panel-heading"><i class="fa fa-hand-o-down"></i> {_ Choose service _}</div>
    <div class="panel-body">

      <ul class="nav nav-tabs">
        <li id="virtualoffice" class="active"><a href="#votab" data-toggle="tab">{_ Virtual Office _}</a></li>
        <li id="virtualpbx" class=""><a href="#vpbxtab" data-toggle="tab">{_ Virtual PBX _}</a></li>
        <li id="siptrunk" class=""><a href="#siptrunktab" data-toggle="tab">{_ SIP Trunk _}</a></li>
        <li id="virtualserver" class=""><a href="#vstab" data-toggle="tab">{_ Virtual Server _}</a></li>
      </ul>
       <div class="tab-content">
        <div class="tab-pane active" id="votab">{_ Virtual Office _}</div>
        <div class="tab-pane" id="vpbxtab">{_ Virtual PBX _}</div>
        <div class="tab-pane" id="siptrunktab">{_ SIP Trunk _}</div>
        <div class="tab-pane" id="vstab">{_ Virtual Server _}</div>
      </div>
            
    </div>
    <div id="service-description" class="panel-footer">
      {% include "_order_service_office.tpl" %}
    </div>
  </div>

</div>

{% wire id="virtualoffice" 
    action={update target="service-description" template="_order_service_office.tpl"} 
%}

{% wire id="virtualpbx" 
    action={update target="service-description" template="_order_service_pbx.tpl"} 
%}

{% wire id="siptrunk" 
    action={update target="service-description" template="_order_service_siptrunk.tpl"} 
%}

{% wire id="virtualserver" 
    action={update target="service-description" template="_order_service_server.tpl"} 
%}

{% endblock %}
