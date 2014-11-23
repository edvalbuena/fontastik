      <h5>{_ Status _}:
        {% if m.zkazoo.kz_call_recording_status %}
          <span class="zwarning" style="padding-left: 1em">{_ On _}</span>
        {% else %}
          <span class="zprimary" style="padding-left: 1em">{_ Off _}</span>
        {% endif %}
        {% if m.onnet.is_account_admin_auth or m.onnet.is_operators_session %}
          <i id="change_recording_status" style="cursor: pointer; padding-left: 1em" class="fa fa-refresh fa-1" title="{_ Details _}"></i>
          {% wire id="change_recording_status" action={postback postback="change_recording_status" delegate="mod_zkazoo"} %}
        {% endif %}
      </h5>

