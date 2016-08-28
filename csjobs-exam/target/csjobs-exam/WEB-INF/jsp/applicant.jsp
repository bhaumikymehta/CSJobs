<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS Jobs - Applicant</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
</head>
<body>
	
	<div class="container" align="right">
		<form action="<c:url value='/logout' />" method="POST">
			<input name="_csrf" type="hidden" value="${_csrf.token}" /> <input
				name="submit" type="submit" value="Logout" />
		</form>
	</div>
	
	<hr
		style="width: 100%; color: black; height: 3px; background-color: black;" />


	<p>
		Welcome<em>${authenticatedUser.firstName}
			${authenticatedUser.lastName}</em>.
	</p>

	<div class="container" align="center">
		<h3>
			<span class="label label-default">Job Positions Applied</span>
		</h3>
		<c:if test="${user.applications.size() > 0}">

			<div class="list-group">
				<ul>
					<c:forEach items="${user.applications}" var="application">
						<li><a
							href="<c:url value='/job/view.html?id=${application.job.id}' /> " class="list-group-item">${application.job.title}</a>
							<a
							href="<c:url value='/application/view.html?id=${application.id}' />" class="btn btn-primary">Application</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</c:if>
		<br /> <br />

		<h3>
			<span class="label label-default">Job Positions Available</span>
		</h3>
		<c:if test="${availableJobs.size() > 0}">
			<div class="list-group">
				<ul>
					<c:forEach items="${availableJobs}" var="job">
						<li><a href="<c:url value='/job/view.html?id=${job.id}' />" class="list-group-item">${job.title}</a>
							<a
							href="<c:url value='/application/apply.html?jobId=${job.id}' />" class="btn btn-primary">Apply</a>
						</li>
					</c:forEach>
				</ul>

			</div>
		</c:if>
	</div>
</body>
</html>
