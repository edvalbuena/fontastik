{% extends "services.tpl" %}


{% block service_name %}{_ Available Phone Numbers _}{% endblock %}


{% block service_description %}

<br />
<div class="center-block max-800">
  <ul class="nav nav-pills nav-pills-orange">
    <li class="active"><a href="#spbnumbers" data-toggle="tab">{_ Saint Petersburg _}</a></li>
    <li style="min-width: 10em; text-align: center;"><a href="#msknumbers" data-toggle="tab">{_ Moscow _}</a></li>
  </ul>
</div>

<br />

{% javascript %}
// Redefine function in order stop key interception in dataTables filter field
// modules/mod_base/lib/js/modules/jquery.hotkeys.js
(function(jQuery){

        jQuery.each([ "keydown", "keyup", "keypress" ], function() {
                jQuery.event.special[ this ] = { add: 0 };
        });
})( jQuery );
{% endjavascript %}

<div class="tab-content">
    <div class="tab-pane active" id="spbnumbers">
        {% include "spbfreenumbers.tpl" %}
    </div>
    <div class="tab-pane" id="msknumbers">
        {% include "mskfreenumbers.tpl" %}
    </div>
</div>

<p>
     
</p>
    
{% endblock %}
