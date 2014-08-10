<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-hand-o-down fa-lg"> <span class="pl-15">{_ Fill in the contact information form _}</span></i>
  </div>
  <div class="panel-body">
  </div>
  <div class="panel-footer">
    <table class="table table-condendsed table-hover table-centered">
      <tbody>
        <tr>
            <td width="50%">{_ Surname _}</td>
            <td><input id="surname" name="surname" value="" type="text" class="input-long-onnet">
                {# validate id="surname" type={format pattern="^[A-Za-zА-Яа-я]+$" failure_message=_"Must contain only letters."} #}
                {# validate id="surname" type={presence} #}
            </td>
        </tr>
        <tr>
            <td width="50%">{_ Firstname _}</td>
            <td><input id="firstname" name="firstname" value="" type="text" class="input-long-onnet">
                {# validate id="firstname" type={format pattern="^[A-Za-zА-Яа-я]+$" failure_message=_"Must contain only letters."} #}
            </td>
        </tr>
        <tr>
            <td width="50%">{_ Middlename _}</td>
            <td><input id="middlename" name="middlename" value="" type="text" class="input-long-onnet">
                {# validate id="middlename" type={format pattern="^[A-Za-zА-Яа-я]+$" failure_message=_"Must contain only letters."} #}
            </td>
        </tr>
        <tr>
            <td width="50%">{_ Contact phone number _}</td>
            <td><input id="contactphone" name="contactphone" value="" type="text" class="input-long-onnet">
                {% validate id="contactphone" type={format pattern="^[-+0-9 ()]+$" failure_message=_"Invalid phone format"} %}
            </td>
        </tr>
        <tr>
            <td width="50%">{_ Contact email address _}</td>
            <td><input id="contactemail" name="contactemail" value="" type="text" class="input-long-onnet">
                {% validate id="contactemail" type={email failure_message=_"Invalid email format"} wait=5000 %}
            </td>
        </tr>
    </tbody>
  </table>
  </div>
</div>
