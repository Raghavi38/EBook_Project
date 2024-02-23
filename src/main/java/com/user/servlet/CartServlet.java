package com.user.servlet;

import java.io.IOException;
import com.DAO.BookDaoImpl;
import com.DAO.CartDaoImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			BookDaoImpl dao=new BookDaoImpl(DBConnect.getConn());
			BookDetails b=dao.getBookById(bid);
			Cart c=new Cart();
			c.setBid(bid);
			c.setUid(uid);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			CartDaoImpl dao2=new CartDaoImpl(DBConnect.getConn());
			boolean f=dao2.addCart(c);
			HttpSession session=req.getSession();
			if(f) {
				//System.out.println("Added to cart successfully");
				session.setAttribute("cartMsg","Added to cart successfully" );
				resp.sendRedirect("all_new_book.jsp");
			}
			else {
				//System.out.println("Not added to cart");
				session.setAttribute("failedMsg", "Not added to cart.Something wrong on server...");
				resp.sendRedirect("all_new_book.jsp");;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
