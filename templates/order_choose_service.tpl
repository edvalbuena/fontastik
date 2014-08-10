<div id="choose-service">
{% wire id="virtualoffice" action={ update target="orderform-service-description" template="_order_service_office.tpl" } 
                      action={ update target="choose_service_pagination" template="_order_choose_service_voice_pagination.tpl" }
                      action={add_class target="virtualoffice" class="active"}
                      action={remove_class target="virtualpbx" class="active"}
                      action={remove_class target="siptrunk" class="active"} 
                      action={remove_class target="virtualserver" class="active"}
%}
{% wire id="virtualpbx" action={update target="orderform-service-description" template="_order_service_pbx.tpl"} 
                      action={remove_class target="virtualoffice" class="active"}
                      action={add_class target="virtualpbx" class="active"}
                      action={remove_class target="siptrunk" class="active"} 
                      action={remove_class target="virtualserver" class="active"}
%}
{% wire id="siptrunk" action={ update target="orderform-service-description" template="_order_service_siptrunk.tpl" }
                      action={ update target="choose_service_pagination" template="_order_choose_service_voice_pagination.tpl" }
                      action={remove_class target="virtualoffice" class="active"}
                      action={remove_class target="virtualpbx" class="active"}
                      action={add_class target="siptrunk" class="active"} 
                      action={remove_class target="virtualserver" class="active"}
%}
{% wire id="virtualserver" action={ update target="orderform-service-description" template="_order_service_server.tpl" } 
                           action={ update target="choose_service_pagination" template="_order_choose_service_vms_pagination.tpl" }
                           action={remove_class target="virtualoffice" class="active"}
                           action={remove_class target="virtualpbx" class="active"}
                           action={remove_class target="siptrunk" class="active"}
                           action={add_class target="virtualserver" class="active"}
%}
  <div class="panel panel-default">
    <div class="panel-heading">
      <i class="fa fa-hand-o-down fa-lg"> <span class="pl-15">{_ Choose service _}</span></i>
    </div>
    <div class="panel-body">

      <ul class="nav nav-tabs">
        <li id="virtualoffice" class="active" data-index="12" dir="ltr" style="width: 27%; text-align: center;">
        <a href="#" data-toggle="tab">{_ Virtual Office _}</a></li>
        <li id="virtualpbx" class=" " data-index="18" dir="ltr" style="width: 25%; text-align: center;">
        <a href="#" data-toggle="tab">{_ Virtual PBX _}</a></li>
        <li id="siptrunk" class=" " data-index="28" dir="ltr" style="width: 19%; text-align: center;">
        <a href="#" data-toggle="tab">{_ SIP Trunk _}</a></li>
        <li id="virtualserver" class=" " data-index="38" dir="ltr" style="width: 29%; text-align: center;">
        <a href="#" data-toggle="tab">{_ Virtual Server _}</a></li>
      </ul>
      <div id="orderform-service-description" class="panel-footer">
        {% include "_order_service_office.tpl" %}
      </div>
    </div>
  </div>
</div>
