<%@page import="student_with_jsp.dto.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Student</title>
<link rel="stylesheet" href="css/edit.css">
</head>
<body>
	<%Student student =(Student)request.getAttribute("student");%>
	<form class="input" action="edit" method="post">
		Id::<input type="number" name="id" value="<%=student.getId()%>" readonly="readonly"><br>
		Name::<input type="text" name="name" value="<%=student.getName()%>" required="required"><br>
		Email::<input type="email" name="email" value="<%=student.getEmail()%>" required="required"><br>
		Password::<input type="password" name="password" value="<%=student.getPassword()%>"required="required""><br>
		Address::<input type="text" name="address" value="<%=student.getAddress()%>"required="required""><br>
		Phone::<input type="tel" name="phone" value="<%=student.getPhone()%>"required="required"><br>
		Course::<br>
		<label><input type="radio" name="course" value="Development"> Development</label><br>
		<label><input type="radio" name="course" value="Testing"> Testing</label><br>
        <input type="submit" value="Edit">
	</form>
</body>
</html>