<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload</title><link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>
</head>
<body>
<h2>File Upload</h2>

<div class="container" align="right">
		<form action="<c:url value='/logout' />" method="POST">
			<input name="_csrf" type="hidden" value="${_csrf.token}" /> <input
				name="submit" type="submit" class="btn btn-primary" value="Logout" />
		</form>
</div>

	<div class="container" align="center">
<br/>


<form method="post" action="upload.html" enctype="multipart/form-data">
	
		<table border="1" class="table table-hover  table-border">
			<tr>
				<th>CV:</th>
				<td><input type="file" name="cv"/></td>
			</tr>
			<tr>
				<th>Research Statement:</th>
				<td><input type="file" name="rs"/></td>
			</tr>
			<tr>
				<th>Teaching Statement:</th>
				<td><input type="file" name="ts"/></td>
			</tr>
			</table>
<input type="submit" name="upload" value="Upload" class= "btn btn-primary"/>

</form>
</div>
</body>
</html>