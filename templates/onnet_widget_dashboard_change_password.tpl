{% wire id="change-password-form" type="submit" postback={changepasswordform} delegate="onnet" %}
<form id="change-password-form" method="post" action="postback" class="form">

{% include "change_password_header.tpl" headline=_"Email to send password: " idname="change_password_id" class="disabled" %}

</form>
