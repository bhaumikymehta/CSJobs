<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS Jobs - Admin</title>
</head>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<body>

	<p>
		<b>Welcome <em>${authenticatedUser.firstName}
				${authenticatedUser.lastName}</em>.
		</b>
	</p>

	<h3>
		<span class="label label-default">Admin Home</span>
	</h3>
	<div class="container" align="right">
		<form action="<c:url value='/logout'  />" method="POST">
			<input name="_csrf" type="hidden" value="${_csrf.token}" /> <input
				name="submit" type="submit" class="btn btn-primary" value="Logout" />
		</form>
</div>
	<div class="container" align="center">
<br/>
<div align="left"></div>
	<p>	<a href="newJob.html" class="btn btn-info">Create new job</a></p>
</div>
	
	
	
		<table border="1" class="table table-hover  table-border">
			<tr>
				<th>Job</th>
				<th>Publish date</th>
				<th>Close date</th>
				<th>Operations</th>
				<th>Applications</th>
			</tr>
			<c:forEach items="${jobs}" var="job">
				<tr>
					<td><a href="<c:url value='viewAdmin.html?id=${job.id}' />"
						class="btn btnn-info">${job.title}</a></td>
					<td><fmt:formatDate value="${job.publishDate}"
							pattern="M/d/yyyy" /></td>
					<td><fmt:formatDate value="${job.closeDate}"
							pattern="M/d/yyyy" /></td>
					<td><a href="edit.html?jobId=${job.id}" class="btn btnn-info">Edit</a></td>
					<td><a href="listApplication.html?jobId=${job.id}"
						class="btn btn-info">View Applications</a></td>

				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>
