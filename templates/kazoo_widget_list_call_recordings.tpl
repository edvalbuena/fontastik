{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}

{% javascript %}
// Redefine function in order stop key interception in dataTables filter field 
// modules/mod_base/lib/js/modules/jquery.hotkeys.js
(function(jQuery){

        jQuery.each([ "keydown", "keyup", "keypress" ], function() {
                jQuery.event.special[ this ] = { add: 0 };
        });
})( jQuery );
{% endjavascript %}

<table id="calls_list_table" class="table table-condensed table-hover table-centered">
    <thead>
        <tr>
            <th style="text-align: center;">{_ Date _}</th>
            <th style="text-align: center;">{_ Caller _}</th>
            <th style="text-align: center;">{_ Callee _}</th>
            <th style="text-align: center;">{_ Listen _}</th>
            <th style="text-align: center;">{_ Download _}</th>
        </tr>
    </thead>
    <tbody>
    {% for record in m.zkazoo.get_call_recordings %}
        <tr>
            <td style="text-align: center;">{{ record['value'][1]['timestamp']|zkazoo_uni_to_date:[4] }}</td>
            <td style="text-align: center;">{{ record['value'][1]['from_number']|pretty_phonenumber }}</td>
            <td style="text-align: center;">{{ record['value'][1]['to_number']|pretty_phonenumber }}</td>
            <td style="text-align: center;">
                <a href="/getrecordinginline/id/{{ record["id"] }}/filename/{{ record['value'][1]['filename'] }}/timestamp/{{ record['value'][1]['timestamp'] }}">
                    <i class="fa fa-play-circle-o" title="{_ Play _}"></i>
                </a>
            </td>
            <td style="text-align: center;">
                <a href="/getrecordingattach/id/{{ record["id"] }}/filename/{{ record['value'][1]['filename'] }}/timestamp/{{ record['value'][1]['timestamp'] }}">
                    <i style="cursor: pointer;" class="fa fa-download" title="{_ Download _}"></i>
                </a>
            </td>
        </tr>
    {% endfor %}
    </tbody>
</table>
<table>
    <tfoot>
        <tr>
			<th class="td-right" colspan="6">{_ call recordings retention period is one month _}</th>
        </tr>
    </tfoot>
</table>

{% javascript %}
//var initSearchParam = $.getURLParam("filter");
var oTable = $('#calls_list_table').dataTable({
"pagingType": "simple",
"bFilter" : true,
"aaSorting": [[ 0, "desc" ]],
"aLengthMenu" : [[10, 30, 100, -1], [10, 30, 100, "Все"]],
"iDisplayLength" : 10,
"oLanguage" : {
	"sInfoThousands" : " ",
	"sLengthMenu" : "_MENU_ {_ lines per page _}",
	"sSearch" : "{_ Filter _}:",
	"sZeroRecords" : "{_ Nothing found, sorry _}",
	"sInfo" : "{_ Showing _} _START_ {_ to _} _END_ {_ of _} _TOTAL_ {_ entries _}",
	"sInfoEmpty" : "{_ Showing 0 entries _}",
	"sInfoFiltered" : "({_ Filtered from _} _MAX_ {_ entries _})",
	"oPaginate" : {
		"sPrevious" : "{_ Back _}",
		"sNext" : "{_ Forward _}"
	}
},


});
{% endjavascript %}

{% endblock %}

