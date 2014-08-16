    <div style="background-color: #E86110;" class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="hidden-xs navbar-brand" href="/">OnNet communications</a>
          <a class="visible-xs navbar-brand" href="/">OnNet</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
           {% if not m.onnet.is_auth %}
            <li class="hidden-sm hidden-md"><a href="/">{_ Home _}</a></li>
           {% endif %}
           {% if m.onnet.is_auth %}
            <li class="visible-sm" id="cogs-menu">
              <a href="/onnet_dashboard">
                <i class="fa fa-gears fa-lg"></i>
              </a>
            </li>
            <li class="hidden-sm"><a href="/onnet_dashboard">{_ Dashboard _}</a></li>
            <li class="hidden-sm"><a href="/finance_details">{_ Payments _}</a></li>
            <li class="hidden-sm hidden-md"><a href="/documents">{_ Documents _}</a></li>
            {% if m.modules.info.mod_zkazoo.enabled %}
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">{_ Telephony _} <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  {% if m.zkazoo.get_kazoo_account_id %}
                    <li><a href="/status_panel">{_ Status panel _}</a></li>
                  {% endif %}
                  {% if m.onnet.is_operators_session %}
                  <li><a href="/fax_in">{_ Incoming Faxes _}</a></li>
                  <li><a href="/fax_out">{_ Outgoing Faxes _}</a></li>
                  <li><a href="/call_recordings">{_ Call recordings _}</a></li>
                  {% endif %}
                </ul>
              </li>
           {% endif %}
           {% endif %}
           {% if not m.onnet.is_auth %}
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">{_ Services _} <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="/virtualoffice">{_ Virtual Office _}</a></li>
                  <li><a href="/hostedpbx">{_ Hosted PBX _}</a></li>
                  <li><a href="/phonenumbers">{_ Phone Numbers _}</a></li>
                  <li><a href="/virtualserver">{_ Virtual Server _}</a></li>
                  <li><a href="/cloudstorage">{_ Cloud Storage _}</a></li>
                  <li><a href="/spla">{_ Hosted Microsoft Software _}</a></li>
                  <li><a href="/internet">{_ Internet Access _}</a></li>
                  <li class="divider"></li>
                  <li><a href="/serviceorder">{_ Service Order _}</a></li>
                  <li><a href="/payments">{_ Payments _}</a></li>
                </ul>
            </li>
           {% endif %}
           {% if not m.onnet.is_auth %}
            <li class="dropdown hidden-sm">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">{_ About us _} <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="/aboutus">{_ About us _}</a></li>
                  <li><a href="/network">{_ Network _}</a></li>
                  <li><a href="/trademark">{_ Trademark _}</a></li>
                  <li><a href="/licenses">{_ Licenses _}</a></li>
                  <li><a href="/companydetails">{_ Company details _}</a></li>
                  <li><a href="/contactus">{_ Contact us _}</a></li>
                </ul>
            </li>
           {% endif %}
           {% if not m.onnet.is_auth %}
            <li class="hidden-sm hidden-md"><a href="/contactus">{_ Contact us _}</a></li>
           {% endif %}
            <!-- Profile links for extra small screens -->
            <!-- <li class="visible-xs"><a href="sign-in.html">{_ Sign in _}</a></li> -->
            <!-- <li  class="visible-xs"><a href="#">Sign out</a></li> -->
          </ul>
          <ul class="nav navbar-nav navbar-right hidden-xs">
          {% if not m.onnet.is_auth %}
            <!-- Sign in & Sign up -->
            <li id="sign-in">
              <a href="#">{_ Sign in _}</a>
              <div class="search-box hidden" id="sign-in-box">
                {% wire id="sign_in_form" type="submit" postback={onnetauth} delegate="onnet" %}
                <form id="sign_in_form" class="input-group" method="post" action="postback">
                  <input type="text" class="form-control mb-10" placeholder="{_ Login _}" id="username" 
                          name="username" value=""  autofocus="autofocus" autocapitalize="off" autocomplete="on" tabindex=1 />
                  {% validate id="username" type={presence} %}

                  <input type="password" class="form-control mb-10" placeholder="{_ Password _}" 
                          id="password" name="password" value="" autocomplete="on" tabindex=2/>

                  {% button text=_"Enter" action={submit target="sign_in_form"} class="btn btn-default" %}
                  <a id="forgot-pwd" class="undecorate-link pull-right">{_ Forgot your password? _}</a>
                </form>
              </div>
              <div class="search-box hidden" id="forgot-pwd-box">
                {% wire id="forgottenpwd_form" type="submit" postback={forgottenpwd} delegate="onnet" %}
                <form id="forgottenpwd_form" class="input-group" method="post" action="postback">
                  <div class="mb-10" style="width: 230px; text-transform: none;">{_ Input Email _}</div>
                  <input class="form-control mb-10" placeholder="{_ Email _}" type="text" id="user_email" 
                         name="user_email" value=""  autofocus="autofocus" autocapitalize="off" autocomplete="on" tabindex=1>
                  {% validate id="user_email" type={presence} type={email} %}
                  {% button text=_"Receive password" action={submit target="forgottenpwd_form"} class="btn btn-default" %}
                  <button id="cancel-pwd-btn" class="btn btn-default pull-right" type="button">{_ Cancel _}</button>
                </form>
              </div>
            </li>
          {% endif %}
          {% if m.onnet.is_auth %}
            <!-- Signed in. Profile Menu -->
            <li id="profile-menu" class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">{_ My Account _} <b class="caret"></b></a>
              <ul class="dropdown-menu">
                  <li><a href="/onnet_dashboard">{_ Dashboard _}</a></li>
                  <li><a href="/account_details">{_ Account Details _}</a></li>
                  <li><a href="/finance_details">{_ Payments _}</a></li>
                  <li><a href="/statistics">{_ Statistics _}</a></li>
                  <li><a href="/documents">{_ Documents _}</a></li>
                  <li class="divider"></li>
                  <li><a id="sign_out_menu" href="#">{_ Sign out _}</a></li>
                 {% wire id="sign_out_menu" postback={signout} delegate="onnet" %} 
              </ul>
            </li>
            <li class="visible-lg">
              <a id="sign_out" href="#">{_ Sign out _}</a>
              {% wire id="sign_out" postback={signout} delegate="onnet" %} 
            </li>
          {% endif %}
          {% if not m.onnet.is_auth %}
            <!-- Place Order -->
            <li id="order">
              <a href="/first_order"><i class="fa fa-shopping-cart" style="padding-right: .5em;"></i> {_ Order _}</a>
            </li>
          {% endif %}
            {% all include "language_choice.tpl" %}
          </ul>
        </div>
      </div>
    </div>
