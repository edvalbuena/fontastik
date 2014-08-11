{% extends "services.tpl" %}


{% block service_name %}{_ Free Phone Numbers _}{% endblock %}


{% block service_description %}

<br />
<br />


<div class="center-block max-800">

<table id="FreeNumbers" class="table table-striped table-bordered"  cellspacing="0" width="100%">
<thead>
<tr align="center">
    <th style="text-align: center;">Номер ГТС Санкт-Петербурга</th>
    <th  style="text-align: center;">Стоимость, без учета НДС</th>
    <th>Номер e.164</th>
    <th>Номер</th>
</tr>
</thead>
<tbody>

{% for number_id, number, price in m.onnet.get_freenumbers_list %}

<tr>
<td align="right" style="font-weight: bold; text-shadow: 1px 1px 3px rgb(170, 170, 170); vertical-align: bottom; width: 50%;"><p class="hidden-xs"><img alt="*" style="height: 60px; float: left; margin-right: 20px;" src="/lib/images/{{ 3|rand|format_integer }}.gif" /></p>
<a id={{ number_id }} style="padding: 14px 0 0 0; font-size: 1.7em; letter-spacing:1pt" class="free_numbers undecorate-link"><strong>{{ number }}</strong></a>
</td>
<td style="color: #515151; font-weight: bold; text-shadow: 1px 1px 3px rgb(170, 170, 170); vertical-align: middle; text-align: center; font-size: 1.3em;">{{ price }}</td>
<td>{{ number_id }}</td>
<td>{{ number_id|pretty_phonenumber }}</td>
</tr>

{% wire id=number_id type="click" action={dialog_open template="free_number_statistics_pre_order.tpl" title=[ _"Inbound calls statistics for number", "   ", "(812) ", number ] number=number number_id=number_id} %}

{% endfor %}

</tbody>
</table>

</div>

<script type="text/javascript" charset="utf-8">
	$.extend({
		/**
		 * Returns get parameters.
		 *
		 * If the desired param does not exist, null will be returned
		 *
		 * @example value = $.getURLParam("paramName");
		 */
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
		var oTable = $('#FreeNumbers').dataTable({
                        "pagingType": "simple_numbers",

			"oSearch" : {
				bRegex : true,
				"sSearch" : initSearchParam
			},

			"sDom" : "<'row-fluid'><'span'<'span14'l><'span10'f>r>t<'span'<'span14'i><'span10'p>>",

			"iDisplayLength" : 10,

			"aLengthMenu" : [[10, 25, 50, -1], [10, 25, 50, "Все"]],

			aaSorting : [[0, AscDesc]],

			"aoColumnDefs" : [{
				"bVisible" : false,
				"aTargets" : [2, 3]
			}, {
				"aTargets" : [1],
				"bUseRendered" : false,
                                "render": function ( data, type, full, meta ) {
                                     return type === 'display' ? data.replace(/(\d)(?=(\d\d\d)+([^\d]|$))/g, '$1 ') + ' руб.' : data;
                                }
			}],

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
			aoColumns : [{
				type : "select",
				bRegex : true,
				values : [{
					'value' : '240-47',
					'label' : '240-47-xx'
				}, {
					'value' : '363-45',
					'label' : '363-45-xx'
				}, {
					'value' : '(385-00|38-500)',
					'label' : '385-00-xx'
				}, {
					'value' : '(385-05|38-505|385-0-5)',
					'label' : '385-05-xx'
				}, {
					'value' : '456-58',
					'label' : '456-58-xx'
				}, {
					'value' : '490-67',
					'label' : '490-67-xx'
				}, {
					'value' : '612-28',
					'label' : '612-28-xx'
				}, {
					'value' : '643-34',
					'label' : '643-34-xx'
				}, {
					'value' : '676-66',
					'label' : '676-66-xx'
				}, {
					'value' : '.*',
					'label' : 'Все варианты'
				}]
			}, {
				type : "select",
				bRegex : true,
				values : [{
					'value' : '^1000$',
					'label' : '1 000 руб.'
				}, {
					'value' : '^1600$',
					'label' : '1 600 руб.'
				}, {
					'value' : '^1900$',
					'label' : '1 900 руб.'
				}, {
					'value' : '^5000$',
					'label' : '5 000 руб.'
				}, {
					'value' : '^10000$',
					'label' : '10 000 руб.'
				}, {
					'value' : '^15000$',
					'label' : '15 000 руб.'
				}, {
					'value' : '^(20000|30000|40000|50000|75000|100000)$',
					'label' : 'от 20 000 руб.'
				}, {
					'value' : '.*',
					'label' : 'Все варианты'
				}]
			}, {
				sSelector : "#NumberFilter",
				type : "select",
				bRegex : true,
				values : [{
					'value' : '36345',
					'label' : '363-45-xx'
				}, {
					'value' : '38505',
					'label' : '385-05-xx'
				}, {
					'value' : '38500',
					'label' : '385-00-xx'
				}]
			}, {
				sSelector : "#PriceFilter",
				type : "select",
				values : ["1000", "1600", "1900"]
			}]
		});
	});

</script>

<p>
     
</p>
    
{% endblock %}
