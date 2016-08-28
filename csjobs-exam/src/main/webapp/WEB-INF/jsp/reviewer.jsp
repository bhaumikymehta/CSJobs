<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS Jobs - Reviewer</title>
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

	<p>
		Welcome <em>${authenticatedUser.firstName}
			${authenticatedUser.lastName}</em>.
	</p>

	<h3>Reviewer Home</h3>
	<table border="1" class="table table-hover  table-border">
			<tr>
				<th>Job Positions</th>
				</tr>
				<c:forEach items="${reviewerJobs}" var="jobs">
				<tr>
					<td><a href="<c:url value='reviewApplication.html?id=${jobs.id}' />"
						class="btn btn-info">${jobs.title}</a></td>

				</tr>
			</c:forEach>
		</table>
						
						
		

</body>
</html>
