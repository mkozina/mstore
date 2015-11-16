<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page isELIgnored="false" %>

<html>
<head>
	<title>Modify a CD from APHASIA Music Store DB</title>
</head>
<body>

	<jsp:useBean id="database" class="mkozina.mstore.storage.DataBase" scope="application" />
	<jsp:useBean id="compactdisc" class="mkozina.mstore.data.CompactDisc" scope="request" />
	<jsp:setProperty name="compactdisc" property="*" />
	
	<form action="modifyCompactDisc.jsp">
	Artist :<input type="text" name="artist" value="<jsp:getProperty name="compactdisc" property="artist"></jsp:getProperty>" /><br />
	Album :<input type="text" name="album" value="<jsp:getProperty name="compactdisc" property="album"></jsp:getProperty>" /><br />
	Year :<input type="text" name="year" value="<jsp:getProperty name="compactdisc" property="year"></jsp:getProperty>" /><br />
	Tracks :<input type="text" name="tracks" value="<jsp:getProperty name="compactdisc" property="tracks"></jsp:getProperty>" /><br />
	<input type="hidden" name="no" value="<c:out value="${param.no}" />" />
	<input type="submit" value="OK" />
	</form>
	
	<p><a href="showAllCompactDiscs.jsp">Take a look at your DB</a></p>
	<p><a href="index.jsp">Back to Main Page</a></p>
	
</body>
</html>