package com.admin.servlet;

import java.io.IOException;

import com.DAO.BookDaoImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/edit_Books")
public class EditBookServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String bookName = req.getParameter("bname");
			String author=req.getParameter("aname");
			String price=req.getParameter("price");
			String status=req.getParameter("bstatus");
			BookDetails b=new BookDetails();
			b.setBookId(id);
			b.setBookName(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			BookDaoImpl dao=new BookDaoImpl(DBConnect.getConn());
			boolean f=dao.updateEditBooks(b);
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("succMsg", "Book Updated Successfully");
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
