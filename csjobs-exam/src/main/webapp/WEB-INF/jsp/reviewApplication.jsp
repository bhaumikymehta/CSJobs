<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>CS Jobs -Review Job Applications</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
</head>
<body>
	<div class="container" align="right">
		<form action="<c:url value='/logout' />" method="post">
			<input name="_csrf" type="hidden" value="${_csrf.token}" /> <input
				name="submit" type="submit" class="btn btn-primary" value="Logout" />
		</form>
	</div>



	<div class="container" align="center">
		<br />
		
		
		<h2>Applications</h2>
		<table border="1" class="table table-hover  table-border">
			<tr>
				<th>Applicant Name</th>
				<th>Submit Date</th>
				<th>Current job title</th>
				<th>Current job institution</th>
				<th>Current job year</th>
			</tr>
					<c:forEach items="${reviewApplications}" var="application">
				<tr>
				<td>${application.applicant.firstName}</td>
					<td><fmt:formatDate value="${application.submitDate}"
							pattern="M/d/yyyy" /></td>
					<td>${application.currentJobTitle}</td>
					<td>${application.currentJobInstitution}</td>
					<td>${application.currentJobYear}</td>

				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>