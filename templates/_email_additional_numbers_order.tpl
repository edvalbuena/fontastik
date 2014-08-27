<html>
	<head>
		<title>
                {_ Additional numbers order _} - {{ customername }}
                </title>
	</head>
	<body>
		<h3>{_ Additional numbers order received _}:</h3>

		<p>{_ Agreement number _}: <strong>{_ # _} {{ customeragreement[1] }} {_ dated _} {{ customeragreement[2][2]|date:'Y-m-d' }}</strong></p>
                <p>{_ Customer _}: <strong>{{ customername }} ({{ username }})</strong></p>
                <p>{_ Email _}: <strong>{{ email }}</strong></p>
                {% if chosennumbers %}
                <p>{_ Chosen numbers _}:<p>
                {% for chosennumber in chosennumbers %}
                  {% with chosennumber|split:":" as number, price %}
                    <strong>{{ number|pretty_phonenumber }} - {{ price }} {_ rub. _} ({_ excl VAT _})</strong><br />
                  {% endwith %}
                {% endfor %}
                {% endif %}
                {% if is_prepaid %}
                <br />
                {_ Please make sure that you have sufficient funds. _}<br />
                {_ Current balance _}: <strong>{{ account_balance }} {_ rub. _}</strong>
                {% endif %}

                <br />
		<p>{_ Best regards _},</p>
		<p>{_ OnNet Communications Inc. _}</p>
                <br />
                <br />
                <a style="font-size:small; color: #c0c0c0;" >{_ Requester's IP address _}: {{ clientip }}</a>
	</body>
</html>
