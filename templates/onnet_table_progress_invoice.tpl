    <thead>
        <tr>
            <th>{_ Please wait _} ...</th>
        </tr>
    </thead>
    <tbody>
        <tr>
           <td>
              <div class="zbarcontainer">
                  <div id="onnet_progress" class="progress progress-striped active" style="margin-bottom: 0px!important;">
                       <div id="onnet_bar" class="bar" style="width: 0%;"></div>
                  </div>
              </div>
           </td>
        </tr>
    </tbody>

{% javascript %}
var progress = setInterval(function() {
    var $progressdiv = $('#onnet_progress').width();
    var $bar = $('#onnet_bar');
    
    if ($bar.width() >= $progressdiv*0.95) {
        clearInterval(progress);
        $('#onnet_progressdiv').removeClass('active');
    } else {
        $bar.width($bar.width() + $progressdiv/10);
    }
    var curr_progress = $bar.width()*100/$progressdiv;
    $bar.text(curr_progress.toPrecision(2) + "%");
}, 2500);
{% endjavascript %}
