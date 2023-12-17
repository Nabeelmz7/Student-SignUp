package student_with_jsp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import student_with_jsp.dao.StudentDao;
import student_with_jsp.dto.Student;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		StudentDao studentDao = new StudentDao();
		List<Student> students = studentDao.getAllStudents();
		boolean value=false;
		String studentPassword = null;
		String studentWhoLoggedIn=null;
		
		for(Student student:students) {
			if (email.equals(student.getEmail())) {
				//email is present
				value = true;
				studentPassword=student.getPassword();
				//cookies
				studentWhoLoggedIn=student.getName();
				break;
			}
		}
		if (value) {
			//email is present then compare the passwords
			if (password.equals(studentPassword)) {
				//login success
				
				Cookie cookie=new Cookie("namewhologgedin", studentWhoLoggedIn);
				resp.addCookie(cookie);
				
				HttpSession httpSession=req.getSession();
				httpSession.setAttribute("name", studentWhoLoggedIn);
				
				List<Student> list = studentDao.getAllStudents();
				req.setAttribute("list", list);
				RequestDispatcher dispatcher = req.getRequestDispatcher("display.jsp");
				dispatcher.forward(req, resp);
			}
			else {
				//password dosent match
				
				req.setAttribute("message", "INAVALID PASSWORD");
				RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
				dispatcher.include(req, resp);
			}
		}
		else {
			//email is dosent match
			
			req.setAttribute("message", "Invalid Email");
			RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
			dispatcher.include(req, resp);
		}
	}
}
