<html>
	<head>
		<title>
                OnNet.su {_ Password recovery _}
                </title>
	</head>
	<body>
		<h3>{_ Access details to email_}: {{ email }}</h3>
                <br />
                <table border="1" cellspacing="0" cellpadding="10">
                    <thead>
                        <td>{_ Counterparty _}</td>
                        <td>{_ Login _}</td>
                        <td>{_ Password _}</td>
                    </thead>
                    <tbody>
                        {% for counterparty, login, password in userdata %}
                            <tr>
                                <td>{{ counterparty }}</td>
                                <td>{{ login }}</td>
                                <td>{{ password }}</td>
                        {% endfor %}
                    </tbody>
                </table>
                <br />
		<p>{_ Best regards _},</p>
		<p>{_ OnNet communications Inc. _}</p>
                <br />
                <br />
                <a style="font-size:small; color: #c0c0c0;" >{_ Requester's IP address _}: {{ clientip }}</a>
	</body>
</html>
