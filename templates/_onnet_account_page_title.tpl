<div class="pl-10 pr-10">
  <div class="pull-right">
  <p>
    {_ Logged in as _}
    <a href="/account_details">{{ m.onnet[{accounts_table fields="name" limit=1}] }}</a>
    {% if m.onnet.is_operators_session %} <a style="color:red; text-decoration:none;">{_ Operator _}-{{ m.session.lb_user_id }}</a>{% endif %}
  </p>
  </div>
  <h2>{{ title }}</h2>
</div>
