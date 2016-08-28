<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>CS Jobs - Apply</title>
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
	<h2>CS Jobs</h2>
	<div class="container" align="center">
		<br />

		<h3>${application.job.title}</h3>
		<p>Applicant: ${application.applicant.firstName}
			${application.applicant.lastName}</p>


		<form:form modelAttribute="application">
			<p>Current Job Position:</p>

			<table border="1" class="table table-hover  table-border">
				<tr>
					<th>Title</th>
					<td><form:input path="currentJobTitle" /></td>
				</tr>
				<tr>
					<th>Institution or Company</th>
					<td><form:input path="currentJobInstitution" /></td>
				</tr>
				<tr>
					<th>Starting Year</th>
					<td><form:input path="currentJobYear" /></td>
				</tr>
				<tr>
					<th><br /></th>
					<td><input type="submit" name="next" value="Next" class= "btn btn-primary"/></td>
				</tr>
			</table>

		</form:form>
		</div>
</body>
</html>
