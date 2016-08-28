<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>CS Jobs - Login</title><link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>
</head>
<body>

<c:url value="/j_security_check" var="login" />
<form action="${login }" method="post">

	
		<table border="1" class="table table-hover  table-border">
<tr>
  <th>Email:</th>
  <td><input type="text" name="j_username" /></td>
</tr>
<tr>
  <th>Password:</th>
  <td><input type="password" name="j_password" /></td>
</tr>
<tr>
  <th><br /></th>
  <td>
      <input name="${_csrf.parameterName }" type="hidden" 
		value="${_csrf.token}" />

  <input type="submit" name="login" value="Login" class="btn btnn-info"/></td>
</tr>
</table>
</form>
</body>
</html>
