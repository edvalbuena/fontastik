<div>
    {% wire id="backtolist"
         action={dialog_close}
    %}
    <div class="onnet-pager">
        <div style="display: inline-block;" id="addnumbertorderform"><a style="color: #fff; background-color: #E86110; text-decoration: none;" href="/first_order?phonenumber={{number_id}}">{_ Add number to order _}</a></div>
        <div style="display: inline-block;" id="backtolist"><a style="color: #fff; background-color: #3E7A8C; text-decoration: none;" href="#">{_ Choose another number _}</a></div>
    </div>


</div>
<div>

<div style="display: inline-block; width: 50.7%;">
<table id="calls_amount1" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered table-condensed">
<thead>
<tr><th style="text-align: center;">Дата</th><th style="text-align: center;">Уникальных</th><th style="text-align: center;">Всего</th></tr>
</thead>
<tbody>
{% for date, unique, incommon in m.onnet[{get_call_attempts phonenumber=number_id offset=0 length=14 }] %}
<tr><td style="text-align: center;">{{ date }}</td><td style="text-align: center;">{{ unique }}</td><td style="text-align: center;">{{ incommon }}</td></tr>
{% endfor %}
</tbody>
</table>
</div>

<div style="display: inline-block; width: 48.5%;">
<table id="calls_amount2" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered table-condensed">
<thead>
<tr><th style="text-align: center;">Дата</th><th style="text-align: center;">Уникальных</th><th style="text-align: center;">Всего</th></tr>
</thead>
<tbody>
{% for date, unique, incommon in m.onnet[{get_call_attempts phonenumber=number_id offset=15 length=14 }] %}
<tr><td style="text-align: center;">{{ date }}</td><td style="text-align: center;">{{ unique }}</td><td style="text-align: center;">{{ incommon }}</td></tr>
{% endfor %}
</tbody>
</table>
</div>

</div>
