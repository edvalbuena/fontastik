<div>
    {% wire id="chooseanothernumber"
         action={dialog_open template="_free_numbers_table.tpl"
         title=[_"Add phone number to your order"] subject_id=id} text=_"add one more number"
    %}
    {% wire id="addnumbertorderform"
         action={postback delegate="onnet" postback={addchosennumber chosennumber} inject_args chosennumber=number_id}
         action={dialog_close}
    %}
    <div class="onnet-pager">
        <div style="display: inline-block;" id="addnumbertorderform"><a style="color: #fff; background-color: #FF8334; text-decoration: none;" href="#">{_ Add number to order _}</a></div>
        <div style="display: inline-block;" id="chooseanothernumber"><a style="color: #fff; background-color: #0074cc; text-decoration: none;" href="#">{_ Choose another number _}</a></div>
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
