<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student LogIn</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<%String message=(String)request.getAttribute("message"); %>
	<%if(message!=null){ %>
	<h2><%=message %></h2>
	<%}else{ %>
	<h2 class="heading"><%="WELCOME TO LOGIN PAGE" %></h2>		
	<%} %>
	<form action="login" method="post">
	Email::<input type="email" name="email" class="email"><br>
	Password::<input type="password" name="password" class="pass"><br>
	<input type="submit" value="LogIn" class="submit">
	</form>
</body>
</html>