<html>
	<head>
		<title>
                {_ Service order _} - {% ifequal servicetype "virtualoffice" %}{_ Virtual Office _}{% endifequal %}{% ifequal servicetype "virtualpbx" %}{_ Hosted PBX _}{% endifequal %}{% ifequal servicetype "siptrunk" %}{_ SIP Trunk _}{% endifequal %}{% ifequal servicetype "virtualserver" %}{_ Virtual Server _}{% endifequal %} - #{{ ordernumber }}
                </title>
	</head>
	<body>
		<h3>{_ Service order received _}:</h3>

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

                {% if siplineamount %}<p>{_ Amount of concurrent calls _}: {{ siplineamount }}</p>{% endif %}

                <h4>{_ Contact information _}:</h4>
                {% if surname %}<p>{_ Surname _}: {{ surname }}</p>{% endif %}
                {% if firstname %}<p>{_ Firstname _}: {{ firstname }}</p>{% endif %}
                {% if middlename %}<p>{_ Middlename _}: {{ middlename }}</p>{% endif %}
                {% if contactphone %}<p>{_ Contact phone number _}: {{ contactphone }}</p>{% endif %}
                {% if contactemail %}<p>{_ Contact email address _}: {{ contactemail }}</p>{% endif %}

                <h4>{_ Counterparty information _}:</h4>
                <p>{_ Counterparty type _}: {% ifequal counterpartytype "company" %}{_ Company _}{% else %}{_ Individual _}{% endifequal %}</p>
                {% if companydetailsfile %}<p>{_ Company details file _}: {{ companydetailsfile }}</p>{% endif %}
                {% if passportpage1 %}<p>{_ Passport page 1 file _}: {{ passportpage1 }}</p>{% endif %}
                {% if passportpage2 %}<p>{_ Passport page 2 file _}: {{ passportpage2 }}</p>{% endif %}

                {% if comments %}
                <h4>{_ Comment _}:</h4>
		<pre>{{ comments|force_escape|linebreaksbr }}</pre>
                {% endif %}
                <br />
		<p>{_ Best regards _},</p>
		<p>{_ OnNet communications Inc. _}</p>
	</body>
</html>
