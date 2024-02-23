package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.DAO.BookOrderDaoImpl;
import com.DAO.CartDaoImpl;
import com.DB.DBConnect;
import com.entity.BookOrder;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order")
public class orderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pin = req.getParameter("pin");
			String payment = req.getParameter("payment");
			String full_address = address + " " + landmark + " " + city + " " + state + " " + pin;
			System.out.println(name + " " + email + " " + phno + " " + full_address);

			CartDaoImpl dao = new CartDaoImpl(DBConnect.getConn());
			List<Cart> clist = dao.getBookByUser(id);

			if (clist.isEmpty()) {
				session.setAttribute("failedAddBooksMsg", "Add Books to Cart");
				resp.sendRedirect("checkout.jsp");
			} else {
				BookOrderDaoImpl dao2 = new BookOrderDaoImpl(DBConnect.getConn());
				BookOrder o = null;
				int i = dao2.getOrderNo();
				ArrayList<BookOrder> orderList = new ArrayList<BookOrder>();

				for (Cart c : clist) {
					o = new BookOrder();
					o.setOrder_id("BOOK-ORD-00" + i);
					o.setUsername(name);
					o.setEmail(email);
					o.setFulladdress(full_address);
					o.setPhno(phno);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice() + "");
					o.setPaymentType(payment);
					orderList.add(o);
					i++;
				}
				if ("noselect".equals(payment)) {
					// System.out.println("Select payment method");
					session.setAttribute("failedPayMsg", "Select the Payment menthod");
					resp.sendRedirect("checkout.jsp");
				} else {
					boolean f = dao2.saveOrder(orderList);
					if (f) {
						// System.out.println("Order placed");
						// session.setAttribute("succMsg", "Order placed successfully");
						resp.sendRedirect("orderSuccess.jsp");
					} else {
						// System.out.println("Something wrong");
						session.setAttribute("failedOrderMsg", "Something wrong on server");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
