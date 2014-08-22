{% wire id="crmvpbx" type="click" 
	action={ update target="pbxserversdiv" template="_pbxoptionslist.tpl" }
	action={ update target="linuxserversdiv" template="_empty.tpl" }
	action={ update target="windowsserversdiv" template="_empty.tpl" }
	action={ add_class target="choose_service_next" class="hide" }
%}
{% wire id="linuxserver" type="click" 
	action={ update target="pbxserversdiv" template="_empty.tpl" }
	action={ update target="linuxserversdiv" template="_linuxserverschoice.tpl" }
	action={ update target="windowsserversdiv" template="_empty.tpl" }
	action={ remove_class target="choose_service_next" class="hide" }
%}
{% wire id="windowsserver" type="click" 
	action={ update target="pbxserversdiv" template="_empty.tpl" }
	action={ update target="linuxserversdiv" template="_empty.tpl" }
	action={ update target="windowsserversdiv" template="_windowsserverschoice.tpl" }
	action={ remove_class target="choose_service_next" class="hide" }
%}
<input type="hidden" name="servicetype" value="virtualserver">
<ul>
    <li>
    	<label id="crmvpbx_label" class="radio"><input id="crmvpbx" type="radio" name="virtualservertype" value="crmvpbx" title="CRM">
		<h4>Сервер Виртуальной АТС <small>(без подключения услуг телефонии)</small>:</h4>
	</label>
		<div id="pbxserversdiv">
	   		{% include "_empty.tpl" %}
		</div>
    </li>
    <li>
    	<label id="linuxserver_label" class="radio"><input id="linuxserver" type="radio" name="virtualservertype" value="Linux" title="Linux">
		<h4>Виртуальный сервер Linux:</h4>
	</label>
		<div id="linuxserversdiv">
	   		{% include "_empty.tpl" %}
		</div>
    </li>
    <li>
          <label id="windowsserver_label" class="radio"><input  id="windowsserver" type="radio" name="virtualservertype" value="Windows" title="Windows">
		<h4>Виртуальный сервер Windows:</h4>
	  </label>
		<div id="windowsserversdiv">
	   		{% include "_empty.tpl" %}
		</div>
    </li>
</ul>
