    {% for attempt in m.zkazoo.get_outgoing_faxes|slice:[10] %}
        <tr><td style="text-align: center;">{{ attempt["created"]|zkazoo_uni_to_date:4 }}</td><td style="text-align: center;">{{ attempt["to"] }}</td><td style="text-align: center;">{{ attempt["status"] }}</td><td style="text-align: center;"><a href="/getfaxdoc/id/{{ attempt["id"] }}"><i class="fa fa-download" title="{_ Download _}"></i></a></td><td style="text-align: center;"><i id={{ attempt["id"] }} style="cursor: pointer;" class="fa fa-trash-o" title="{_ Delete _}"></i></td></tr>
    {% wire id=attempt["id"] action={postback postback="del_outgoing_fax_doc" delegate="mod_zkazoo"} %}
    {% endfor %}
