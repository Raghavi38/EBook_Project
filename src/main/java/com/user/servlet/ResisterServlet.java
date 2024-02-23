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


@WebServlet("/register")
public class ResisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String password=req.getParameter("pass");
			String check=req.getParameter("check");
			System.out.println(name+" "+email+" "+phno+" "+password+" "+check);
			
			User us=new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			
			HttpSession session=req.getSession();
			if(check!=null) {
				UserDaoImpl dao2=new UserDaoImpl(DBConnect.getConn());
				boolean f2=dao2.checkUser(email);
				System.out.println(f2);
				if(f2) {
					UserDaoImpl dao=new UserDaoImpl(DBConnect.getConn());
					//System.out.println("connected");
					boolean f=dao.UserRegister(us);
				if(f) {
					System.out.println("connected");
					System.out.println("User registration successful...");
					session.setAttribute("succMsg","User registration successful...");
					resp.sendRedirect("register.jsp");
				}
				else
				{
					//System.out.println("Something went wrong on server");
					session.setAttribute("failedMsg","Something went wrong on server...");
					resp.sendRedirect("register.jsp");
				}
			}else {
				session.setAttribute("failedMsg","User Already exists...");
				resp.sendRedirect("register.jsp");
			}
			}
			else {
				//System.out.println("Agree Terms and Conditions...");
				session.setAttribute("failedMsg","Agree Terms and Conditions...");
				resp.sendRedirect("register.jsp");
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	

}
