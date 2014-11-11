    <thead>
        <tr>
            <th style="text-align: center;">{_ Authorized CID _}</th>
            <th style="text-align: center;">{_ Outbound CID _}</th>
            <th style="text-align: center;">{_ User _}</th>
            <th style="text-align: center;">{_ Delete _}</th>
        </tr>
    </thead>
    <tbody>
      {% for cred in m.zkazoo.kz_cccp_creds_list %}
        {% if cred["cid"] %}
          <tr>
            <td style="text-align: center;">{{ cred["cid"] }}</td>
            <td style="text-align: center;">{{ cred["outbound_cid"] }}</td>
            <td style="text-align: center;">{{ m.zkazoo[{kz_get_user_by_id user_id=cred["owner_id"] }][1]["username"] }}</td>
            <td style="text-align: center;"><i id={{ cred["id"] }} style="cursor: pointer;" class="fa fa-trash-o" title="{_ Delete _}"></i></td>
          </tr>
          {% wire id=cred["id"] action={postback postback="del_cccp_doc" delegate="onnet"} %}
        {% endif %}
      {% endfor %}
    </tbody>

