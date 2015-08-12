<div id="rates_disappear" style="display: none;">
<div class="text-center"><h4 style="color: #E86110;">Тарифы на междугороднюю и международную связь для абонентов Москвы</h4></div>
<br />
<br />
<table id="msk_rates_table" class="table table-striped table-bordered"  cellspacing="0" style="width: 100%">
<thead>
<tr>
    <th style="text-align: center; vertical-align: middle; width: 45%;">{_ Description _}</th>
    <th  style="text-align: center; vertical-align: middle; width: 40%;">{_ Prefix _}</th>
    <th style="text-align: center; vertical-align: middle; width: 15%;">{_ Price _} ({_ excl VAT _})</th>
</tr>
</thead>
<tbody>

{% for rate in m.onnet[{rates_list tar_id="269"}] %}
{% if rate["prefix"] %}
<tr>
    <td style="text-align: left; vertical-align: middle; width: 45%;">{{ rate["description"] }}</td>
    {% if rate["prefix"][4] %}
    {% wire id="td_"++rate["prefix"][1] type="click"
        action={ toggle target="tds_"++rate["prefix"][1] }
        action={ toggle target="tdl_"++rate["prefix"][1] }
    %}
    <td id="td_{{ rate["prefix"][1] }}" style="cursor: pointer; text-align: left; vertical-align: middle; width: 40%;">
         <span id="tds_{{ rate["prefix"][1] }}">+{{ rate["prefix"][1] }} +{{ rate["prefix"][2] }} +{{ rate["prefix"][3] }} <span>...</span></span>
         <span id="tdl_{{ rate["prefix"][1] }}" style="display: none;">
           {% for prefix in rate["prefix"] %}
            +{{ prefix }}
           {% endfor %}
         </span>
    </td>
    {% else %}
    <td style="text-align: left; vertical-align: middle; width: 40%;">
         <span>
           {% for prefix in rate["prefix"] %}
            +{{ prefix }}
           {% endfor %}
         </span>
    </td>
    {% endif %}
    <td style="text-align: left; text-align: center; vertical-align: middle; width: 15%;">
        {{ rate["cost"] }} / min.
    </td>
</tr>
{% endif %}
{% endfor %}

</tbody>
</table>

{% javascript %}
	$.extend({
		getURLParam : function(strParamName) {
			var strReturn = "";
			var strHref = window.location.href;
			var bFound = false;

			var cmpstring = strParamName + "=";
			var cmplen = cmpstring.length;

			if(strHref.indexOf("?") > -1) {
				var strQueryString = strHref.substr(strHref.indexOf("?") + 1);
				var aQueryString = strQueryString.split("&");
				for(var iParam = 0; iParam < aQueryString.length; iParam++) {
					if(aQueryString[iParam].substr(0, cmplen) == cmpstring) {
						var aParam = aQueryString[iParam].split("=");
						strReturn = aParam[1];
						bFound = true;
						break;
					}

				}
			}
			return strReturn;
		}
	});


	var initSearchParam = $.getURLParam("filter");
	var AscDesc = (initSearchParam == "") ? 'asc' : 'desc';

	/* Table initialisation */
	$(document).ready(function() {
		var oTable = $('#msk_rates_table').dataTable({
                        "pagingType": "simple_numbers",

			"oSearch" : {
				bRegex : true,
				"sSearch" : initSearchParam
			},

			"sDom" : "<'row-fluid'><'span'<'span14'l><'span10'f>r>t<'span'<'span14'i><'span10'p>>",

			"iDisplayLength" : 25,

			"aLengthMenu" : [[5, 25, 50, -1], [5, 25, 50, "Все"]],

			aaSorting : [[0, AscDesc]],

                       "oLanguage" : {
                                "sInfoThousands" : " ",
                                "sLengthMenu" : "_MENU_ строк на страницу",
                                "sSearch" : "Фильтр:",
                                "sZeroRecords" : "Ничего не найдено - извините",
                                "sInfo" : "Просмотр с _START_ по _END_ из _TOTAL_ записей",
                                "sInfoEmpty" : "Просмотр 0 записей",
                                "sInfoFiltered" : "(Отфильтровано из _MAX_ записей)",
                                "oPaginate" : {
                                        "sPrevious" : "Назад",
                                        "sNext" : "Вперед"
                                }
                        }

		}).columnFilter({
			sPlaceHolder : "head:before",
			aoColumns : [null,{
				type : "select",
				bRegex : true,
				values : [{
					'value' : '\\+7.*',
					'label' : 'Межгород'
				}, {
					'value' : '\\+(?!7.*)',
					'label' : 'Международная связь'
				}, {
					'value' : '.*',
					'label' : 'Все варианты'
				}]
			}]
		});
                $('#TableSpinner').hide();
                $('#rates_disappear').show();
	});
{% endjavascript %}

<br />
<br />
<br />
    <ul style="padding: 1em;">
        <li><a href="/lib/pdfs/beeline_msk_auth.pdf">доверенность от ОАО &laquo;Вымпел-Коммуникации&raquo;&nbsp;Москва&nbsp;</a></li>
    </ul>
</div>
