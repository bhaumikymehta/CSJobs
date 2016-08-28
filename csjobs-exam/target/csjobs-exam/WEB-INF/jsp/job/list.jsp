<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS Jobs</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body background="87CEFA">

	<center>

		<jsp:include page="../layout/header.jsp"></jsp:include>

	</center>
	<hr
		style="width: 100%; color: black; height: 3px; background-color: black;" />
	<div class="container" align="center">
		<c:if test="${empty authenticatedUser}">
			<div class="row">
				<div class="col-sm-6" align="right">


					<a href="<c:url value='/register.html' />" class="btn btn-info">Register</a>
				</div>

				<div class="col-sm-6" align="left">
					<a href="<c:url value='/login.html' />" class="btn btn-info">Login</a>
				</div>
			</div>
		</c:if>


		<c:if test="${not empty authenticatedUser}">
			<p>
				You are logged in as <em>${authenticatedUser.firstName},
					${authenticatedUser.lastName}</em>. <div class="container" align="right">
		<form action="<c:url value='/logout' />" method="POST">
			<input name="_csrf" type="hidden" value="${_csrf.token}" /> <input
				name="submit" type="submit" class="btn btn-primary" value="Logout" />
		</form>
</div>
			</p>
		</c:if>

		<h3>
			<span class="label label-default">Open Job Postions</span>
		</h3>
		<div class="list-group">
			<ul>
				<c:forEach items="${openJobs}" var="job">
					<li><a href="<c:url value='/job/view.html?id=${job.id}' />"
						class="list-group-item">${job.title}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>
