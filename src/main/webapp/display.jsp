<%@page import="student_with_jsp.dto.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student details</title>
<link rel="stylesheet" href="css/display.css">
</head>
<body>
	<%String n=(String)request.getAttribute("studentNameWhoChangedTheDetails"); %>

<%if(n!=null){ %>
<h1><%="CHANGED BY "+n %></h1>
<%} %>
	<%List<Student> students =(List)request.getAttribute("list"); %>
	<table border="2px">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Address</th>
			<th>Email</th>
			<th>Password</th>
			<th>Course</th>
			<th>Fees</th>
			<th>Phone</th>
			<th>Delete</th>
			<th>Update</th>
		</tr>
		
		
		<%for(Student student:students){ %>
		<tr>
		<td><%=student.getId() %></td>
		<td><%=student.getName() %></td>
		<td><%=student.getAddress() %></td>
		<td><%=student.getEmail() %></td>
		<td><%=student.getPassword() %></td>
		<td><%=student.getCourse() %></td>
		<td><%=student.getFees() %></td>
		<td><%=student.getPhone() %></td>
		<td><a href="delete?id=<%=student.getId()%>">Delete</a></td>
		<td><a href="update?id=<%=student.getId()%>">Update</a></td>
		</tr>
		<%} %>
	</table>
</body>
</html>