<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Add a new CD into APHASIA Music Store DB</title>
</head>
<body>
	<jsp:useBean id="database" class="mkozina.mstore.storage.DataBase" scope="application" />
	<jsp:useBean id="compactdisc" class="mkozina.mstore.data.CompactDisc" scope="session" />
	<form action="addCompactDisc.jsp">
	Artist :<input type="text" name="artist" value="" /><br />
	Album :<input type="text" name="album" value="" /><br />
	Year :<input type="text" name="year" value="" /><br />
	Tracks :<input type="text" name="tracks" value="" /><br />
	<input type="submit" value=" OK " />
	</form>
	<p><a href="index.jsp">Back to Main Page</a></p>
</body>
</html>