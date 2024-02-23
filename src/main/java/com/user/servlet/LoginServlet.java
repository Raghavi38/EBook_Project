package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDaoImpl;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			UserDaoImpl dao=new UserDaoImpl(DBConnect.getConn());
			HttpSession session=req.getSession();
			String email=req.getParameter("email");
			String pass=req.getParameter("password");
			String check=req.getParameter("check");
			//System.out.println(name+" "+pass);
			if(check!=null) {
			if("admin@gmail.com".equals(email) && "admin".equals(pass)) {
				User us=new User();
				us.setName("Admin");
				session.setAttribute("userobj",us.getName());
				resp.sendRedirect("admin/adminHome.jsp");
			}
			else {
				User us=dao.login(email, pass);
				//System.out.println(us);
				if(us!=null) {
					//System.out.println("hai");
					session.setAttribute("userName", us.getName());
					session.setAttribute("userEmail",us.getEmail());
					session.setAttribute("userOBJ", us);
					resp.sendRedirect("index.jsp");
				}
				else {
					session.setAttribute("failedMsg", "Email or Password Invalid");
					resp.sendRedirect("login.jsp");
				}
			}
			}
			else {
				session.setAttribute("failedMsg", "Agree Terms and Conditions");
				resp.sendRedirect("login.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
