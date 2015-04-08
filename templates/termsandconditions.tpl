{% extends "services.tpl" %}


{% block service_name %}{_ Terms & Cons _}{% endblock %}


{% block service_description %}

<ul>
    <li><a href="/lib/pdfs/onnet_services_description_01.04.2014.pdf">Общие условия оказания услуг связи</a></li>
    <li><a href="/lib/pdfs/onnet_proposal_01.04.2014.pdf">Краткое текущее коммерческое предложение</a></li>
    <li>Текущие тарифы на услуги междугородной и международной телефонной связи:
    </li>
</ul>    

<br />

{% wire id="spbrates" type="click"
        action={show target="TableSpinner"}
        action={hide target="rates_disappear"}
        action={update target="rates_plate" template="_spb_rates.tpl"}
        action={add_class target="spbrates" class="active"}
        action={remove_class target="mskrates" class="active"}
%}
{% wire id="mskrates" type="click"
        action={show target="TableSpinner"}
        action={hide target="rates_disappear"}
        action={update target="rates_plate" template="_msk_rates.tpl"}
        action={add_class target="mskrates" class="active"}
        action={remove_class target="spbrates" class="active"}
%}
<div class="center-block max-800">
  <ul class="nav nav-pills nav-pills-orange">
    <li id="spbrates" class="active" style="cursor: pointer;"><a data-toggle="tab">{_ Saint Petersburg _}</a></li>
    <li id="mskrates" style="min-width: 10em; text-align: center; cursor: pointer;"><a data-toggle="tab">{_ Moscow _}</a></li>
  </ul>
</div>

<br />

<div id="TableSpinner" class="text-center"><i class="fa fa-spinner fa-spin fa-3x"></i></div>
<div id="rates_plate" class="center-block max-800">
    {% include "_spb_rates.tpl" %}
</div>

{% endblock %}
