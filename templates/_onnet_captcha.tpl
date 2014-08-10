{#
    Recaptcha template
    Author: 
        * for the script: the reCAPTCHA team of Google
        * for the modifications: François Cardinaux, CH 1207 Geneva (http://bit.ly/qTaona)
#}
{% if m.recaptcha.is_enabled %}

{% with m.recaptcha.public_key as public_key %}
<script>
var RecaptchaOptions = {
   theme : 'custom',
   custom_theme_widget: 'recaptcha_widget'
};
</script>


 <div id="recaptcha_widget" style="display:none">

   <div id="recaptcha_image"></div>
<br />
   <div class="recaptcha_only_if_incorrect_sol" style="color:red">Incorrect please try again</div>

   <input type="text" id="recaptcha_response_field" name="recaptcha_response_field" placeholder={_ 'prove you are human' _} />
<a id="recaptcha_reload_btn" href="javascript:Recaptcha.reload()" title="Обновить"><i id="recaptcha_reload" alt="Обновить" class="fa fa-refresh fa-lg"></i></a>

 </div>


<script 
    type="text/javascript"
    src="https://www.google.com/recaptcha/api/challenge?k={{ public_key|urlencode }}">
</script>
<noscript>
    <iframe 
        rc="https://www.google.com/recaptcha/api/noscript?k={{ public_key|urlencode }}"
        height="300" width="500" frameborder="0"></iframe>
    <br>
    <textarea name="recaptcha_challenge_field" rows="3" cols="40"></textarea>
    <input 
        type="hidden" 
        name="recaptcha_response_field"
        value="manual_challenge">
</noscript>
{% endwith %}

{% endif %}

