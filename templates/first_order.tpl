{% extends "no_header.tpl" %}

{% block service_description %}

<div class="center-block max-800">

{% wire id="service-order-form" type="submit" postback={firstorderform} delegate="controller_firstorder_submit" %}
<form id="service-order-form" method="post" action="postback" class="form">


{# Choose services #}
        <div id="choose_service_div">
            <br />
            <div>
                {% include "order_choose_service.tpl" %}
            </div>
            <div id="choose_service_pagination">
                {% wire id="choose_service_next"
                        action={add_class class="hide" target="choose_service_div"}
                        action={remove_class class="hide" target="choose_number_div"}
                %}
                <ul class="pager">
                    <li id="choose_service_back" class="previous hide">
                        <a href="#">&larr; {_ Back _}</a>
                    </li>
                    <li id="choose_service_next" class="next">
                        <a href="#">{_ Next _} &rarr;</a>
                    </li>
                </ul>
            </div>
        </div>

{# Choose number #}
        <div id="choose_number_div" class="hide" style="vertical-align: middle;">
            <br />
            <div>
                {% include "order_choose_number.tpl" headline=_"Chosen numbers" idname="choose_number" %}
            </div>
            <br />
            {% wire id="choose_number_back"
                action={add_class target="choose_number_div" class="hide"}
                action={remove_class target="choose_service_div" class="hide"}
            %}
            {% wire id="choose_number_next"
                action={postback postback="choose_number_next" delegate="onnet" qarg="badidea"}
            %}
            {# wire id="choose_number_next"
                action={add_class target="choose_number_div" class="hide"}
                action={remove_class target="contact_info_div" class="hide"}
            #}
            <ul class="pager">
              <li id="choose_number_back" class="previous">
                <a href="#">&larr; {_ Back _}</a>
              </li>
              <li id="choose_number_next" class="next">
                <a href="#">{_ Next _} &rarr;</a>
              </li>
            </ul>
        </div>

{# Choose server details #}
        <div id="choose_server_params_div" class="hide">
            <h3>{_ Choose server parameters _}</h3>
            <br />
            <div>
                {% include "order_choose_server_params.tpl" headline=_"Server parameters" idname="server_params" %}
            </div>
            <br />
            {% wire id="choose_server_params_back"
                action={add_class class="hide" target="choose_server_params_div"}
                action={remove_class class="hide" target="choose_service_div"}
            %}
            {% wire id="choose_server_params_next"
                action={add_class class="hide" target="choose_server_params_div"}
                action={remove_class class="hide" target="contact_info_div"}
            %}
            <ul class="pager">
              <li id="choose_server_params_back" class="previous">
                <a href="#">&larr; {_ Back _}</a>
              </li>
              <li id="choose_server_params_next" class="next">
                <a href="#">{_ Next _} &rarr;</a>
              </li>
            </ul>
        </div>

{# Contact information #}
        <div id="contact_info_div" class="hide">
            <br />
            <div>
                {% include "order_contact_info_widget.tpl" headline=_"Contact information" %}
            </div>
            <br />
            {% wire id="contact_info_back"
                action={add_class class="hide" target="contact_info_div"}
                action={remove_class class="hide" target="choose_service_div"}
            %}
            {% wire id="contact_info_next"
                action={postback postback="contact_info_next" delegate="onnet" 
                qarg="surname" qarg="firstname" qarg="middlename" qarg="contactphone" qarg="contactemail"}
            %}
            {# wire id="contact_info_next"
                action={add_class class="hide" target="contact_info_div"}
                action={remove_class class="hide" target="counterparty_div"}
            #}
            <ul class="pager">
              <li id="contact_info_back" class="previous">
                <a href="#">&larr; {_ Back _}</a>
              </li>
              <li id="contact_info_next" class="next">
                <a href="#">{_ Next _} &rarr;</a>
              </li>
            </ul>
        </div>

{# Counterparty information #}
        <div id="counterparty_div" class="hide">
            <br />
            <div>
                {% include "order_counterparty_widget.tpl" %}
            </div>
            <br />
            {% wire id="counterparty_back"
                action={add_class class="hide" target="counterparty_div"}
                action={remove_class class="hide" target="contact_info_div"}
            %}
            <ul class="pager">
              <li id="counterparty_back" class="previous">
                <a href="#">&larr; {_ Back _}</a>
              </li>
              <li id="clearorderform"><a style="color: #fff; background-color: #0074cc;" href="#">{_ Clear form _}</a></li>
              <li id="submitorderform"><a style="color: #fff; background-color: #FF8334;" href="#">{_ Make an order _}</a></li>
              <li id="counterparty_next" class="next hide">
                <a href="#">{_ Next _} &rarr;</a>
              </li>
            </ul>
            {% wire id="clearorderform"
                action={reload}
            %}
            {% wire id="submitorderform"
                action={submit target="service-order-form"}
            %}
            <br />
            <div id="submit_capture_block" align="center">
                {% include "_onnet_captcha.tpl" %}
            </div>
        </div>
            
</form>
</div>

{% endblock %}
