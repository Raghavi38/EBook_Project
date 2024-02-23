package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDaoImpl;
import com.DB.DBConnect;
import com.entity.Address;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/address")
public class AddAddressServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name=req.getParameter("name");
			String address=req.getParameter("add");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pin=req.getParameter("pin");
			
			Address a=new Address();
			a.setAddress(address);
			a.setLandmark(landmark);
			a.setCity(city);
			a.setState(state);
			a.setPincode(pin);
			
			HttpSession session=req.getSession();
			UserDaoImpl dao=new UserDaoImpl(DBConnect.getConn());
			boolean f=dao.addAddress(name,a);
			if(f) {
				session.setAttribute("succMsg", "Address added successfully");
				resp.sendRedirect("user_address.jsp");
			}else {
				session.setAttribute("failedMsg", "Semething wrong on server");
				resp.sendRedirect("user_address.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
