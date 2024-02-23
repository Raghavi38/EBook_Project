<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDaoImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Orders</title>
<%@ include file="allCss.jsp"%>
</head>
<body style="background-color:#f0f1f2;">
	<%@ include file="navbar.jsp"%>
	<%
	if(session.getAttribute("userobj")==null){
		response.sendRedirect("../login.jsp");
	}
	%>
	<h3 class="text-center text-dark p-2">Orders</h3>
	<table class="table">
		<thead class="table-dark">
			<tr>
				<th scope="col">Order ID</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">PhNo</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment</th>
			</tr>
		</thead>
		<tbody>
			<%
				User u = (User) session.getAttribute("userOBJ");
				BookOrderDaoImpl dao = new BookOrderDaoImpl(DBConnect.getConn());
				List<BookOrder> blist = dao.getAllOrderBooks();
				for (BookOrder b : blist) {
				%>
				<tr>
					<th scope="row"><%=b.getOrder_id()%></th>
					<td><%=b.getUsername()%></td>
					<td><%=b.getEmail() %></td>
					<td><%=b.getFulladdress() %></td>
					<td><%=b.getPhno() %></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>
				</tr>
				<%
				}
				%>
		</tbody>
	</table>
	
	<div style="margin-top:155px;">
	<%@ include file="footer.jsp"%>
	</div>
	
</body>
</html>