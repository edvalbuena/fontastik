{% wire id="choosevsrate" action={ dialog_open template="_virtualservertares.tpl" title=_"Virtual Servers Rates" } %}
{% wire id="choosedistro" action={ dialog_open template="_vsdistrosdescr.tpl" title=_"OS Distros" } %}
<table>
<tr>
    <td class="span3" style="vertical-align: top;">
        <div class="radio">
        <label style="padding-left: 1px; font-size: 12px; font-weight: bold; color: inherit; text-rendering: optimizelegibility;"><a id="choosevsrate" href="#">Выберите тариф:</a></label>
        </div>
        <div class="radio">
        <label><input id="server1" type="radio" name="servertariff" value="VPS 2" title="VPS 2" checked>VPS 2</label>
        </div>
        <div class="radio">
        <label><input id="server2" type="radio" name="servertariff" value="VPS 3" title="VPS 3">VPS 3</label>
        </div>
        <div class="radio">
        <label><input id="server3" type="radio" name="servertariff" value="VPS 4" title="VPS 4">VPS 4</label>
        </div>
    </td>
    <td style="vertical-align: top;">
        <div class="radio">
        <label style="padding-left: 1px; font-size: 12px; font-weight: bold; color: inherit; text-rendering: optimizelegibility;"><a id="choosedistro" href="#">Выберите дистрибутив:</a></label>
        </div>
        <div class="radio">
        <label><input id="templatesdistro1" type="radio" name="templatesdistro" value="Windows Server 2008" title="Windows Server 2008 Standard" checked>Windows Server 2008 Standard</label>
        </div>
        <div class="radio">
        <label><input id="templatesdistro2" type="radio" name="templatesdistro" value="Windows Server 2012" title="Windows Server 2012 Standard">Windows Server 2012 Standard</label>
        </div>
    </td>
</tr>
</table>
