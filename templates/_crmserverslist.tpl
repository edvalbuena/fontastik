{% wire id="itturismchoice" type="click"
        action={ update target="itturismdescrdiv" template="_itturismserverinfo.tpl" }
        action={ update target="novacrmdescrdiv" template="_empty.tpl" }
        action={ remove_class target="choose_service_next" class="hide" }
%}
{% wire id="novacrmchoice" type="click"
        action={ update target="novacrmdescrdiv" template="_novacrmserverinfo.tpl" }
        action={ update target="itturismdescrdiv" template="_empty.tpl" }
        action={ remove_class target="choose_service_next" class="hide" }
%}
<ul style="list-style:none!important;">
    <li>
        <label class="radio"><input id="itturismchoice" type="radio" name="lastchoiceincrm" value="itturismchoice" title="Tour Manager">
                <h4>Тур менеджер CRM</h4>
        </label>
                <div id="itturismdescrdiv">
                        {% include "_empty.tpl" %}
                </div>
    </li>
    <li>
        <label class="radio"><input id="novacrmchoice" type="radio" name="lastchoiceincrm" value="novacrmchoice" title="Nova">
                <h4>Nova CRM</h4>
        </label>
                <div id="novacrmdescrdiv">
                        {% include "_empty.tpl" %}
                </div>
    </li>
</ul>
