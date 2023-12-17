<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Signup</title>
<link rel="stylesheet" href="css/signup.css">
</head>
<body>
<%String message =(String) request.getAttribute("message"); %>
<%if(message!=null){ %>
<h2><%=message %></h2>
<%}else{ %>
<h2 class="heading" ><%="WELCOME TO STUDENT APPLICATION PLEASE SIGN IN" %></h2>
<%} %>
	<form class="input" action="sign" method="post">
		Name::<input type="text" name="name"><br>
		Email::<input type="email" name="email"><br>
		Password::<input type="password" name="password"><br>
		Address::<input type="text" name="address"><br>
		Phone::<input type="tel" name="phone"><br>
		Course::<br>
		<label><input type="radio" name="course" value="Development"> Development</label><br>
		<label><input type="radio" name="course" value="Testing"> Testing</label><br>
		<input type="submit" value="SignUp">
	</form>
</body>
</html>