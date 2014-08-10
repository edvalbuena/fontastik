       {% for classifier in m.zkazoo.kz_list_classifiers %}
           <tr>
              <td width="5%" style="text-align: center;">
                  <i id={{ classifier[1] }} style="cursor: pointer;" class="fa fa-info-circle" title="{_ Details _}"></i>
              </td>
              <td style="text-align: center;">
                  {{ classifier[1] }}
              </td>
              <td style="text-align: center;">
                  {% if m.zkazoo[{get_ts_restriction classifier=classifier[1]}]|match:"deny" %}
                      <i class="fa fa-ban" title="{_ Denied _}"></i>
                  {% elseif m.zkazoo[{get_ts_restriction classifier=classifier[1]}]|match:"allow" %}
                      <i class="fa fa-check-circle" title="{_ Allowed _}"></i>
                  {% else %}
                      <i class="fa fa-minus-circle" title="{_ Not applicable _}"></i>
                  {% endif %}
              </td>
              {% if m.onnet.is_operators_session %}
                  <td id="ts_{{ classifier[1] }}" style="text-align: center;">
                      <i style="cursor: pointer;" class="fa fa-refresh" title="{_ Change _}"></i>
                  </td>
              {% endif %}
              <td style="text-align: center;">
                  {% if m.zkazoo[{get_acc_restriction classifier=classifier[1]}]|match:"deny" %}
                      <i class="fa fa-ban" title="{_ Denied _}"></i>
                  {% else %}
                      <i class="fa fa-check-circle" title="{_ Allowed _}"></i>
                  {% endif %}
              </td>
              {% if m.onnet.is_operators_session %}
                  <td id="acc_{{ classifier[1] }}" style="text-align: center;">
                      <i style="cursor: pointer;" class="fa fa-refresh" title="{_ Change _}"></i>
                  </td>
              {% endif %}
              {% if m.onnet.is_operators_session %}
                {% wire id="ts_"++classifier[1] action={postback postback={change_call_restriction type='trunkstore' classifier=classifier[1]} delegate="mod_zkazoo"} %}
                {% wire id="acc_"++classifier[1] action={postback postback={change_call_restriction type='account' classifier=classifier[1]} delegate="mod_zkazoo"} %}
              {% endif %}
              {% wire id=classifier[1] action={ dialog_open title=_"Restrictions details" template="_fax_details.tpl" arg=classifier } %}
           </tr>
       {% endfor %}
