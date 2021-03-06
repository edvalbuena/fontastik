{% if period == "interval" %}
            <td>
                {% include "_onnet_widget_interval_button.tpl" %}
                {% javascript %}
                  $('#startDay').datepicker();
                  $('#startDay').datepicker().on('changeDate', function(ev){
                         var Beginning_of_Month_Day = new Date(ev.date.getFullYear(),ev.date.getMonth(),1);
                         var End_of_Period_Day = new Date(ev.date.getFullYear(),ev.date.getMonth()+1,0);
                         var Next_Month_Day = new Date(ev.date.getFullYear(),ev.date.getMonth()+1,1);
                         var nowTemp = new Date();
                         if ( nowTemp.valueOf() < End_of_Period_Day.valueOf() ){
                             End_of_Period_Day = nowTemp;
                             Next_Month_Day = nowTemp;
                         }
                         $('#endDay').datepicker('setDate', End_of_Period_Day);
			 $('#endDay').datepicker('setStartDate', ev.date);
                         $('#endDay').datepicker('setEndDate', Next_Month_Day);
                  });
                  $('#endDay').datepicker();
                {% endjavascript %}
            </td>
      <td class="text-center">
         <div class="date" id="startDay" data-date="{{ now|sub_day|date: 'd/m/Y' }}" data-date-format="dd/mm/yyyy" 
              data-date-autoclose="true" data-date-language={{ z_language }} data-date-start-date="-6m" 
              data-date-end-date="+0d">
                  {_ From: _}&nbsp;&nbsp;
                  <input id="startDayInput" type="text" class="input-small-onnet" name="startDayInput" 
                                                    value="{{ now|sub_day|date: 'd/m/Y' }}" readonly/>
                  <span class="add-on" style="padding-left: 1em;"><i class="fa fa-calendar"></i></span>
               </div>
            </td>
            <td class="text-center">
               <div class="date" id="endDay" data-date-format="dd/mm/yyyy" data-date-autoclose="true" data-date-language={{ z_language }} data-date-start-date="-1d" data-date-end-date="-1d">{_ Till: _}&nbsp;&nbsp;
                  <input id="endDayInput" type="text" class="input-small-onnet" name="endDayInput" value="{{ now|sub_day|date: 'd/m/Y' }}" readonly/>
                  <span class="add-on"  style="padding-left: 1em;"><i class="fa fa-calendar"></i></span>
               </div>
            </td>
{% elif period == "month" %}
            <td>
                {% include "_onnet_widget_interval_button.tpl" %}
            </td>
            <td class="text-right"colspan="2">
               <div class="date" id="selectMonth" data-date="{{ now|sub_month|date: 'm/Y' }}" data-date-format="mm/yyyy" data-date-min-view-mode="months" data-date-autoclose="true"  data-date-language={{ z_language }} data-date-language={{ lang_code }} data-date-start-date="-6m" data-date-end-date="-1m">{_ Month: _}&nbsp;&nbsp;&nbsp;&nbsp;
                 <input id="monthInput" type="text" class="input-small-onnet" name="monthInput" value="{{ now|sub_month|date: 'm/Y' }}" readonly/>
                 <span class="add-on" style="padding-left: 1em;"><i class="fa fa-calendar"></i></span>
               </div>
               {% javascript %}
                  $('#selectMonth').datepicker();
               {% endjavascript %}
            </td>
{% else %}
            <td>
                {% include "_onnet_widget_interval_button.tpl" %}
            </td>
            <td class="text-right" colspan="2">
               <div class="date" id="startDay" data-date-format="dd/mm/yyyy" data-date-autoclose="true" data-date-language={{ z_language }} data-date-start-date="-6m" data-date-end-date="+0d">{_ Day: _}&nbsp;&nbsp;&nbsp;&nbsp;
                  <input id="startDayInput" type="text" class="input-small-onnet" name="startDayInput" value="{% now 'd/m/Y' %}" readonly/>
                  <span class="add-on" style="padding-left: 1em;"><i class="fa fa-calendar"></i></span>
               </div>
               {% javascript %}
                  $('#startDay').datepicker();
               {% endjavascript %}
            </td>
{% endif %}

