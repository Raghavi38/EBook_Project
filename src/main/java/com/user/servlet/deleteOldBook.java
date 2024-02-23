package com.user.servlet;

import java.io.IOException;

import com.DAO.BookDaoImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/remove_old_book")
public class deleteOldBook extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid=Integer.parseInt(req.getParameter("bid"));
			String bookCategory="Old";
			String email=req.getParameter("email");
			BookDaoImpl dao=new BookDaoImpl(DBConnect.getConn());
			boolean f=dao.deleteOldBook(bookCategory, email, bid);
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("succMsg", "Old Book Deleted successfully!");
				resp.sendRedirect("old_books.jsp");
			}
			else {
				session.setAttribute("failedMsg", "Something worng on server...");
				resp.sendRedirect("old_books.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
