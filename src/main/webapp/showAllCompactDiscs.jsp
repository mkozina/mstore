<%@ page import="mkozina.mstore.data.CompactDisc" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>List of CD's in APHASIA Music Store DB</title>
</head>
<body>
	<jsp:useBean id="database" class="mkozina.mstore.storage.DataBase" scope="application" />
	<%
	for (CompactDisc compactDisc : database.getAllCompactDiscs()) {
		out.println(
				"<p>Artist: " + compactDisc.getArtist() + 
				"; Album: " + compactDisc.getAlbum() + 
				"; Year: " + compactDisc.getYear() + 
				"; Tracks: " + compactDisc.getTracks() + 
				"</p>");
	}
	%>
	<p><a href="getCompactDiscData.jsp">Insert a new CD into your DB</a></p>
	<p><a href="index.jsp">Back to Main Page</a></p>
</body>
</html>