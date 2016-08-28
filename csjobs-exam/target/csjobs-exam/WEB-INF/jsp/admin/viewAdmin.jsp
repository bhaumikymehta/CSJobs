<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>CS Jobs - Admin</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>
</head>
<body>
	<div class="container" align="right">
		<form action="<c:url value='/logout' />" method="post">
			<input name="_csrf" type="hidden" value="${_csrf.token}" /> <input
				name="submit" type="submit" class="btn btn-primary" value="Logout" />
		</form>
</div>

	<div class="container" align="center">
<br/>

		<table border="1" class="table table-hover  table-border">
<tr>
	<td>Job title:</td>
  <td>${job.title}</td></tr>
  <tr>
  <td>Description</td>
  <td>${job.description}</td></tr>
  <tr>
  <td>publish date</td>
  <td>${job.publishDate}</td></tr><tr>
  <td>Close date</td>
  <td>${job.closeDate}</td></tr>

<tr>
  <td>Review Committee Chair</td>
  <td>${job.committeeChair.firstName}</td></tr>

<tr>
  <td>Review Committee Members</td>
  <td>
  <c:forEach items="${job.committeeMembers}" var="committee">
  
   ${committee.firstName}  

</c:forEach>
</td>
</tr>
</table>
</div>
</body>
</html>
