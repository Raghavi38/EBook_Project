package com.admin.servlet;

import java.io.IOException;

import com.DAO.BookDaoImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class DeleteBookServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			BookDaoImpl dao=new BookDaoImpl(DBConnect.getConn());
			boolean f=dao.deletBooks(id);
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("succMsg", "Book Deleted Successfully");
				resp.sendRedirect("admin/allBooks.jsp");
			}
			else {
				session.setAttribute("failedMsg", "Something wrong on server...");
				resp.sendRedirect("admin/allBooks.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
