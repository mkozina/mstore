<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="mkozina.mstore.data.CompactDisc" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page isELIgnored="false" %>

<html>
<head>
	<title>List of CD's in APHASIA Music Store DB</title>
	<link href="<c:url value="/resources/main.css" />" rel="stylesheet">
</head>
<body>

	<jsp:useBean id="database" class="mkozina.mstore.storage.DataBase" scope="application" />

	<table>
		<c:set var="access" value="0"/>
		<c:set var="thead" value="0"/>
		<c:forEach var="cd" items="${database.allCompactDiscs}" varStatus="no">
			<c:if test="${(param.artist == cd.artist) || (param.artist == '')}">
			<c:if test="${(param.album == cd.album) || (param.album == '')}">
			<c:if test="${(param.year == cd.year) || (param.year == '')}">
			<c:if test="${(param.tracks == cd.tracks) || (param.tracks == '')}">
			<c:set var="access" value="1"/>
			<c:if test="${(access == 1) && (thead == 0)}">
				<thead>
					<tr>
						<td>Artist</td>
						<td>Album</td>
						<td>Year</td>
						<td>Tracks</td>
						<td>Operations<td>
					</tr>
				</thead>
				<c:set var="thead" value="1"/>
			</c:if>
			<tr>
				<td>${cd.artist}</td>
				<td>${cd.album}</td>
				<td>${cd.year}</td>
				<td>${cd.tracks}</td>
				<td>
					<form action="getCompactDiscDataToModify.jsp">
						<input type="hidden" name="artist" value="${cd.artist}" />
						<input type="hidden" name="album" value="${cd.album}" />
						<input type="hidden" name="year" value="${cd.year}" />
						<input type="hidden" name="tracks" value="${cd.tracks}" />
						<input type="hidden" name="no" value="<c:out value="${no.index}" />" />
						<input type="submit" value="modify" />
					</form>
					<form action="deleteCompactDisc.jsp">
						<input type="hidden" name="artist" value="${cd.artist}" />
						<input type="hidden" name="album" value="${cd.album}" />
						<input type="hidden" name="year" value="${cd.year}" />
						<input type="hidden" name="tracks" value="${cd.tracks}" />
						<input type="hidden" name="no" value="<c:out value="${no.index}" />" />
						<input type="submit" value="delete" />
					</form>
				</td>
			</tr>
			</c:if>
			</c:if>
			</c:if>
			</c:if>
		</c:forEach>
		<c:if test="${access == 0}"><p>Sorry, there is nothing that matches your search.</p></c:if>
	</table>
	
	<p><a href="getCompactDiscDataToSearch.jsp">Search again</a></p>
	<p><a href="showAllCompactDiscs.jsp">Take a look at your DB</a></p>
	<p><a href="index.jsp">Back to Main Page</a></p>
	
</body>
</html>