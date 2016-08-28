<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit job</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>
</head>
<body>

	<div class="container" align="right">
		<form action="<c:url value='/logout' />" method="POST">
			<input name="_csrf" type="hidden" value="${_csrf.token}" /> <input
				name="submit" type="submit" class="btn btn-primary" value="Logout" />
		</form>
</div>

	<div class="container" align="center">
<br/>

	<form:form modelAttribute="newJob">
	
		<table border="1" class="table table-hover  table-border">
			<tr>
				<th>Title</th>
				<td><form:input path="title" /> <b><form:errors
							path="title" /></b></td>
			</tr>
			<tr>
				<th>Description</th>
				<td><form:input path="description"  /> <b><form:errors
							path="description" /></b></td>
			</tr>
			<tr>
				<th>Publish Date</th>
				<td><input type ="text" name="publishDate" value="${newJob.publishDate }" /> <b><form:errors
							path="publishDate" /></b></td>
			</tr>
			<tr>
				<th>Close Date</th>
				<td><input type ="text" name="closeDate" value="${newJob.closeDate }" /> <b><form:errors
							path="closeDate" /></b></td>
			</tr>
			<tr>
				<th>Committee Chair</th>
				<td><select name="chairPersonId">
						<c:forEach items="${reviewers }" var="r">
							<option value="${r.id }">${r.firstName}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>Committee Members</th>
				<td><c:forEach items="${reviewers }" var="r">
						<input type="checkbox" value="${r.id }" name="committeeMembersIds" /> ${r.firstName }<br />
					</c:forEach></td>
			</tr>
			<tr>
				<td><br /></td>
				<td><input type="submit" name="edit" value="Edit" class="btn btn-primary"/></td>
			</tr>
		</table>
	</form:form>

</div>




</body>
</html>