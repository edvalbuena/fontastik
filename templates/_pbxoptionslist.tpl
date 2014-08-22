{% wire id="crmvpbxtypes" type="click" 
	action={ update target="crmvpbxtypesdiv" template="_crmserverslist.tpl" }
        action={ add_class target="choose_service_next" class="hide" }
%}
{% wire id="purevpbx" type="click" 
	action={ update target="crmvpbxtypesdiv" template="_empty.tpl" }
        action={ remove_class target="choose_service_next" class="hide" }
%}
{% wire id="choosevsrate" action={ dialog_open template="_virtualservertares.tpl" title=_"Virtual Servers Rates" } %}
{% wire id="choosecrmrate" action={ dialog_open template="_virtualservertares.tpl" title=_"Virtual Servers Rates" } %}
<ul style="list-style:none!important;">
    <li>
    	<label class="radio"><input id="crmvpbxtypes" type="radio" name="vpbxtypes" value="crmvpbxtypes" title="CRMs">
		<h4>для интеграции с системой CRM <small>(необходимо согласование с поставщиком решения, тариф <a id="choosecrmrate" href="#">VPS 0,5</a>)</small></h4>
	</label>
		<div id="crmvpbxtypesdiv">
	   		{% include "_empty.tpl" %}
		</div>
    </li>
    <li>
    	<label class="radio"><input id="purevpbx" type="radio" name="vpbxtypes" value="purevpbx" title="Standard">
		<h4>стандартный дистрибутив FreePBX <small>(тариф <a id="choosevsrate" href="#">VPS 1</a>)</small></h4>
	</label>
    </li>
</ul>
