<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Add a new CD into APHASIA Music Store DB</title>
</head>
<body>
	<jsp:useBean id="compactdisc" class="mkozina.mstore.data.CompactDisc" scope="session" />
	<jsp:setProperty name="compactdisc" property="*" />
	<jsp:useBean id="database" class="mkozina.mstore.storage.DataBase" scope="application" />
	<%
	database.add(compactdisc);
	%>
	<p>Following CD has been added to DB: </p>
	<p>Artist: <jsp:getProperty name="compactdisc" property="artist"></jsp:getProperty></p>
	<p>Album: <jsp:getProperty name="compactdisc" property="album"></jsp:getProperty></p>
	<p>Year: <jsp:getProperty name="compactdisc" property="year"></jsp:getProperty></p>
	<p>Tracks: <jsp:getProperty name="compactdisc" property="tracks"></jsp:getProperty></p> 
	<p><a href="showAllCompactDiscs.jsp">Take a look at your DB</a></p>
	<p><a href="index.jsp">Back to Main Page</a></p>
</body>
</html>