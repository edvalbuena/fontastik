<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-hand-o-down fa-lg"> <span class="pl-15">{_ Choose phone numbers _}</span></i>
  </div>
  <div class="panel-body">
    {% button class="btn btn-onnet-slough pull-right" text=_"add number" 
      action={dialog_open template="_free_numbers_table.tpl" title=[_"Add phone number to your order"] subject_id=id} 
      action={growl text=_"Please wait while numbers are loading..."}
    %}
  </div>
  <div class="panel-footer">
    <table class="table table-bordered table-hover table-centered">
      <tbody id="mytbodyid">
        {% for number_id, number, price in m.onnet.get_predefined_number %}
          {% include "_add_line_with_number.tpl" number_id=number_id number=number price=price %}
        {% endfor %}
      </tbody>
    </table>

  </div>
</div>
