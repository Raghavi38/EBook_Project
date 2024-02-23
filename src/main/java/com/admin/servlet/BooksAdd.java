package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import com.DAO.BookDaoImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bookName = req.getParameter("bname");
		String author=req.getParameter("aname");
		String price=req.getParameter("price");
		String categories=req.getParameter("category");
		String status=req.getParameter("bstatus");
		Part part=req.getPart("bimg");
		String fileName=part.getSubmittedFileName();
		
		BookDetails b=new BookDetails(bookName, author, price, categories, status, fileName,"admin@gmail.com");
		//System.out.println(b);
		BookDaoImpl dao=new BookDaoImpl(DBConnect.getConn());
		
		
		boolean f=dao.addBooks(b);
		//System.out.println("Added"+f);
		HttpSession session=req.getSession();
		if(f) {
			String path=getServletContext().getRealPath("")+"Books";
			//System.out.println(path);
			File file=new File(path);
			part.write(path+File.separator+fileName);
			session.setAttribute("succMsg", "Book added successfully");
			resp.sendRedirect("admin/addBooks.jsp");
		}
		else {
			session.setAttribute("failedMsg", "Something wrong on server...");
			resp.sendRedirect("admin/addBooks.jsp");
		}
	}
}
