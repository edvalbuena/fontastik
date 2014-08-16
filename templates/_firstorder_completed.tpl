<div class="container-fluid">
<div class="span4 offset4">
	
		<h3 style="color: red;">{_ Thank you for your order _}:</h3>
                <br />
                <p>{_ Order number _}: <strong>#{{ ordernumber }}</strong></p>
                <p>{_ Service name _}: {% ifequal servicetype "virtualoffice" %}<strong>{_ Virtual Office _}</strong>{% endifequal %}
                   {% ifequal servicetype "virtualpbx" %}<strong>{_ Hosted PBX _}</strong><p>{_ PBX Type _}: <strong>{{ pbxservicetype }}</strong></p>{% endifequal %}
                   {% ifequal servicetype "siptrunk" %}<strong>{_ SIP Trunk _}</strong>{% endifequal %}
                   {% ifequal servicetype "virtualserver" %}<strong>{_ Virtual Server _}</strong>{% endifequal %}
                </p>

                {% ifequal virtualservertype "crmvpbx" %}
                        <p>{_ Virtual server type _}: <strong>{_ Hosted PBX Server _}</strong></p>
                        {% ifequal vpbxtypes "crmvpbxtypes" %}
                                <p>{_ CRM Integration Ordered _}: <strong>
                                {% ifequal lastchoiceincrm "novacrmchoice" %}{_ Nova CRM Template _}{% endifequal %}
                                {% ifequal lastchoiceincrm "itturismchoice" %}{_ IT Tourism Template _}{% endifequal %}
                                </strong></p>
                        {% else %}
                                <p>{_ Server Template _}: <strong>{_ Stock FreePBX _}</strong></p>
                        {% endifequal %}
                {% endifequal %}

                {% if virtualservertype == "Linux" or virtualservertype == "Windows" %}
                        <p>{_ Virtual server type _}: <strong>{{ virtualservertype }}</strong></p>
                        <p>{_ Tariff _}: <strong>{{ servertariff }}</strong></p>
                        <p>{_ Server Template _}: <strong>{{ templatesdistro }}</strong></p>
                {% endif %}

                {% if chosennumbers %}
                <p>{_ Chosen numbers _}:<p>
                {% for chosennumber in chosennumbers %}
                  {% with chosennumber|split:":" as number, price %}
                    <strong>{{ number|pretty_phonenumber }} - {{ price }} {_ rub. _} ({_ excl VAT _})</strong><br />
                  {% endwith %}
                {% endfor %}
                {% endif %}
                {% if siplineamount %}<p>{_ Amount of concurrent calls _}: <strong>{{ siplineamount }}</strong><p>{% endif %}

                <p>
                {% if surname %}{_ Contact person _}: 
                <strong>{{ surname }}{% endif %}
                {% if firstname %} {{ firstname }}{% endif %}
                {% if middlename %} {{ middlename }}{% endif %}</strong>
                </p>
                {% if contactphone %}<p>{_ Contact phone number _}: <strong>{{ contactphone }}</strong></p>{% endif %}
                {% if contactemail %}<p>{_ Contact email address _}: <strong>{{ contactemail }}</strong></p>{% endif %}

                <p>{_ Counterparty type _}: <strong>{% ifequal counterpartytype "company" %}{_ Company _}{% else %}{_ Individual _}{% endifequal %}</strong></p>
                {% if companydetailsfile %}<p>{_ Company details file _}: <strong>{{ companydetailsfile }}</strong></p>{% endif %}
                {% if passportpage1 %}<p>{_ Passport page 1 copy _}: <strong>{{ passportpage1 }}</strong></p>{% endif %}
                {% if passportpage2 %}<p>{_ Passport reg. address page copy _}: <strong>{{ passportpage2 }}</strong></p>{% endif %}

                {% if comments %}
                {_ Comment _}:
		<strong><pre>{{ comments|force_escape|linebreaksbr }}</pre></strong>
                {% endif %}
                <br />
                {% if captchapassed %}{% if contactemail %}<p>{_ Order copy sent to your email _} <strong>{{ contactemail }}</strong></p>{% endif %}{% endif %}
                <br />
		<h4>{_ Best regards _},</h4>
		<h4>{_ OnNet communications Inc. _}</h4>


</div>
</div>
