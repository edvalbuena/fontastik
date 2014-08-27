<html>
	<head>
		<title>
                {_ Invoice _} {_ for _} {{ customername }} 
                </title>
	</head>
	<body>
		<h3>{_ Dear customer _},</h3>
                <br />
		<p>{_ requested document attached to this email _}.</p>
		<p>{_ Agreement number _}: <strong>{_ # _} {{ customeragreement[1] }} {_ dated _} {{ customeragreement[2][2]|date:'Y-m-d' }}</strong></p>
                <p>{_ Customer _}: <strong>{{ customername }} ({{ username }})</strong></p>
                <br />
		<p>{_ Best regards _},</p>
		<p>{_ OnNet Communications Inc. _}</p>
                <br />
                <a style="font-size:small; color: #c0c0c0;" >{_ Requester's IP address _}: {{ clientip }}</a>
	</body>
</html>
