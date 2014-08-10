<div id="counterparty-info">
{% wire id="counterparty_org" action={ update target="orderform-counterparty" template="_order_counterparty_company.tpl" }
                              action={add_class target="counterparty_org" class="active"}
                              action={remove_class target="counterparty_ind" class="active"}

%}
{% wire id="counterparty_ind" action={ update target="orderform-counterparty" template="_order_counterparty_individual.tpl" }
                              action={remove_class target="counterparty_org" class="active"}
                              action={add_class target="counterparty_ind" class="active"}
%}
  <div class="panel panel-default">
    <div class="panel-heading">
      <i class="fa fa-hand-o-down fa-lg"> <span class="pl-15">{_ Counterparty's Details _}</span></i>
    </div>
    <div class="panel-body">
      <ul class="nav nav-tabs">
        <li id="counterparty_org" class="active" data-index="2" dir="ltr" style="width: 50%; text-align: center;">
        <a href="#" data-toggle="tab">{_ Organisation _}</a></li>
        <li id="counterparty_ind" class=" " data-index="8" dir="ltr" style="width: 50%; text-align: center;">
        <a href="#" data-toggle="tab">{_ Individual _}</a></li>
      </ul>
      <div id="orderform-counterparty" class="panel-footer">
       {% include "_order_counterparty_company.tpl" %}
      </div>
    </div>
  </div>
</div>

