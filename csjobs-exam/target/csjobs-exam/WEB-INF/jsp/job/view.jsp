<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>CSJobs - Job</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>
</head>
<body>
<ul class="breadcrumb">
    <li><a href="../index.html"><span class="label label-default">Home</span></a></li>
    
</ul>
<center>
		<jsp:include page="../layout/header.jsp"></jsp:include>

	</center><hr
		style="width: 100%; color: black; height: 3px; background-color: black;" />
	
<h2><span class="label label-default">${job.title}</span></h2>
<p><b>Posted on:</b> <fmt:formatDate value="${job.publishDate}" pattern="M/d/yyyy" /></p>
<p><b>Close on:</b>  <fmt:formatDate value="${job.closeDate}" pattern="M/d/yyyy" /></p>
<p><b>Job Description:</b></p>
<p>${job.description}</p>
</body>
</html>
