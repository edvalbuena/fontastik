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
            <th style="text-align: center; white-space: nowrap;">{_ Fax number _}</th>
            <th style="text-align: center;">{_ Status _}</th>
            <th style="text-align: center;">{_ Download _}</th>
            <th style="text-align: center;" class="visible-lg">{_ Details _}</th>
        </tr>
    </thead>
    <tbody>
        {% for attempt in m.zkazoo.get_incoming_faxes %}
          {% if attempt["timestamp"] %}
            <tr>
                <td style="text-align: center; white-space: nowrap;">{{ attempt["timestamp"]|zkazoo_uni_to_date:[4] }}</td>
                <td style="text-align: center;">{{ attempt["from_number"]|pretty_phonenumber }}</td>
                <td style="text-align: center;">{{ attempt["rx_results"][1]["success"] }}</td>
                <td style="text-align: center;"><a href="/getinfaxdoc/id/{{ attempt["id"] }}"><i class="fa fa-download" title="{_ Download _}"></i></a></td>
                <td style="text-align: center;"><i id={{ attempt["id"] }} style="cursor: pointer;" class="fa fa-info-circle" title="{_ Details _}"></i></td>
            </tr>
            {% wire id=attempt["id"] action={ dialog_open title=_"Fax details" template="_fax_details.tpl" arg=attempt } %}
          {% endif %} 
    {% endfor %}
    </tbody>
</table>
<table>
    <tfoot>
        <tr>
			<th class="td-right" colspan="6">{_ fax documents retention period is one month _}</th>
        </tr>
    </tfoot>
</table>

{% javascript %}
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

