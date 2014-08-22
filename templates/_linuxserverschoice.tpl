{% wire id="choosevsrate" action={ dialog_open template="_virtualservertares.tpl" title=_"Virtual Servers Rates" } %}
{% wire id="choosedistro" action={ dialog_open template="_vsdistrosdescr.tpl" title=_"OS Distros" } %}
<table>
<tr>
    <td class="span3" style="vertical-align: top;">
        <div class="radio">
          <label style="padding-left: 1px; font-size: 12px; font-weight: bold; color: inherit; text-rendering: optimizelegibility;">
              <a id="choosevsrate" href="#">Выберите тариф:</a>
          </label>
        </div>
        <div class="radio">
          <label><input id="server1" type="radio" name="servertariff" value="VPS 1" title="VPS 1" checked>VPS 1</label>
        </div>
        <div class="radio">
          <label><input id="server2" type="radio" name="servertariff" value="VPS 2" title="VPS 2">VPS 2</label>
        </div>
        <div class="radio">
          <label><input id="server3" type="radio" name="servertariff" value="VPS 3" title="VPS 3">VPS 3</label>
        </div>
        <div class="radio">
          <label><input id="server4" type="radio" name="servertariff" value="VPS 4" title="VPS 4">VPS 4</label>
        </div>
    </td>
    <td style="vertical-align: top;">
        <div class="radio">
          <label style="padding-left: 1px; font-size: 12px; font-weight: bold; color: inherit; text-rendering: optimizelegibility;">
              <a id="choosedistro" href="#">Выберите дистрибутив:</a>
          </label>
        </div>
        <div class="radio">
          <label><input id="templatesdistro1" type="radio" name="templatesdistro" value="CentOS 6 x64" title="CentOS 6 x64" checked>
            CentOS 6 x64
          </label>
        </div>
        <div class="radio">
          <label><input id="templatesdistro2" type="radio" name="templatesdistro" value="Ubuntu 13.10 x64" title="Ubuntu 13.10 x64">
            Ubuntu 13.10 x64
          </label>
        </div>
    </td>
</tr>
</table>
