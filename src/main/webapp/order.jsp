<%@page import="com.DAO.BookOrderDaoImpl"%>
<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDaoImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders Page</title>
<%@ include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_components/navbar.jsp"%>
	<%
	if(session.getAttribute("userOBJ")==null)
		response.sendRedirect("login.jsp");
	%>
	<div class="container p-3">
		<h3 class="text-center text-primary">Your Orders</h3>
		<table class="table mt-4">
			<thead class="thead bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody class="bg-light">
				<%
				User u = (User) session.getAttribute("userOBJ");
				BookOrderDaoImpl dao = new BookOrderDaoImpl(DBConnect.getConn());
				List<BookOrder> blist = dao.getOrderBooks(u.getEmail());
				for (BookOrder b : blist) {
				%>
				<tr>
					<th scope="row"><%=b.getOrder_id()%></th>
					<td><%=b.getUsername()%></td>
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
	</div>
	<br>
	<br>
	<br>
	<br>
	
	
	<div class="contanier-fluid mt-5 ">
	<%@ include file="all_components/footer.jsp"%>
	</div>
	
</body>
</html>