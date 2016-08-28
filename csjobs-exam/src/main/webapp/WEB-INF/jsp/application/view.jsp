<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>CS Jobs - Application</title>
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
		<h3>${application.job.title}</h3>

		<p>Applicant: ${application.applicant.firstName}
			${application.applicant.lastName}</p>
		<p>
			Submitted:
			<fmt:formatDate value="${application.submitDate}" pattern="M/d/yyyy" />
		</p>
		<p>Current Position: ${application.currentJobTitle} at
			${application.currentJobInstitution} since
			${application.currentJobYear}</p>


		<table border="1" class="table table-hover  table-border">
			<tr>
				<th>Degree</th>
				<th>School</th>
				<th>Year</th>
			</tr>
			<c:forEach items="${application.degrees}" var="degree">
				<tr>
					<td>${degree.name}</td>
					<td>${degree.school}</td>
					<td>${degree.year}</td>
				</tr>
			</c:forEach>
		</table>


		<table border="1" class="table table-hover  table-border">
			<tr>
				<th>File Type</th>
				<th>Uploaded Date</th>
			</tr>

			<c:if test="${empty application.cv  }">
				<tr>
					<td>CV</td>

					<td><fmt:formatDate value="${application.cv.date}"
							pattern="M/d/yyyy" /></td>

					<td><a href="../download.html?fileId=${application.cv.id}"
						class="btn btn-primary">Open</a></td>

				</tr>
			</c:if>
			<c:if test="${empty application.researchStatement }">
				<tr>
					<td>Research Statement</td>

					<td><fmt:formatDate
							value="${application.researchStatement.date}" pattern="M/d/yyyy" /></td>

					<td><a
						href="../download.html?fileId=${application.researchStatement.id}"
						class="btn btn-primary">Open</a></td>

				</tr>
			</c:if>
			<c:if test="${empty application.teachingStatement">
				<tr>
					<td>Teaching Statement</td>

					<td><fmt:formatDate
							value="${application.teachingStatement.date}" pattern="M/d/yyyy" /></td>

					<td><a
						href="../download.html?fileId=${application.teachingStatement.id}&applicationId=${application.id}"
						class="btn btn-primary">Open</a></td>

				</tr>
			</c:if>
		</table>
		</div>
</body>
</html>
