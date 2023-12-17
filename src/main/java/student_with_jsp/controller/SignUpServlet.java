package student_with_jsp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import student_with_jsp.dao.StudentDao;
import student_with_jsp.dto.Student;

public class SignUpServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String address = req.getParameter("address");
		long phone = Long.parseLong(req.getParameter("phone"));
		String course = req.getParameter("course");
		
		double dfees = Double.parseDouble(getServletContext().getInitParameter("developmentfees"));
		double tfees = Double.parseDouble(getServletContext().getInitParameter("testingfees"));
		
		Student student = new Student();
		student.setAddress(address);
		student.setCourse(course);
		student.setEmail(email);
		student.setName(name);
		student.setPassword(password);
		student.setPhone(phone);
		
		if (course.equals("Development")) {
			student.setFees(dfees);
		}
		else {
			student.setFees(tfees);
		}
		
		StudentDao studentDao = new StudentDao();
		List<Student> list = studentDao.getAllStudents();
		boolean value= true;
		for(Student st:list) {
			if (email.equals(st.getEmail())) {
				value =false;
				break;
			}
		}
		if (value) {
//			email is not present in the database so we can let him to signup
			studentDao.signupStudent(student);
			req.setAttribute("message", "SIGNED UP SUCCESSFUL PLEASE LOGIN ");
			RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
			dispatcher.forward(req, resp);
		}
		else {
//			email already present means that email is already taken by other student
			req.setAttribute("message", "CHOOSE A DIFFERENT MAIL ID");
			RequestDispatcher dispatcher = req.getRequestDispatcher("Signup.jsp");
			dispatcher.include(req, resp);
		}
	}
}
