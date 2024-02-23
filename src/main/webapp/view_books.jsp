<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Details</title>
<%@ include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_components/navbar.jsp"%>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	BookDaoImpl dao = new BookDaoImpl(DBConnect.getConn());
	BookDetails b = dao.getBookById(id);
	%>
	<div class="container p-4">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="Books/<%=b.getPhotoName()%>"
					style="height: 150px; width: 100px;"><br>
				<div class="p-3">
					<h4>
						Book Name: <span class="text-success"><%=b.getBookName()%></span>
					</h4>
					<h4>
						Author Name: <span class="text-success"><%=b.getAuthor()%></span>
					</h4>
					<h4>
						Category: <span class="text-success"><%=b.getBookCategory()%></span>
					</h4>
				</div>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName()%></h2>
				<%
				if("Old".equals(b.getBookCategory())){
				%>
				<h5 class="text-primary">Contact to Seller</h5>
				<h5 class="text-primary"><i class="fa-solid fa-envelope"></i> Email: <%=b.getUserEmail() %></h5>
				<%}
				%>
				<div class="row p-3">
					<div class="col-md-4 text-danger text-center p-3">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash on Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-3">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Order</p>
					</div>
					<div class="col-md-4 text-danger text-center p-3">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Delivery</p>
					</div>
				</div>
				<%
				if("Old".equals(b.getBookCategory())){
				%>
				<div class="text-center p-2">
					<a href="index.jsp" class="btn btn-success"> Continue Shopping</a> <a href=""
						class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i>
						<%=b.getPrice()%></a>
				</div>
				<%}else{
				%>
				<div class="text-center p-2">
					<a href="" class="btn btn-primary"><i
						class="fa-solid fa-cart-shopping"></i> Add Cart</a> <a href=""
						class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i>
						<%=b.getPrice()%></a>
				</div>
				<%
				}%>
			</div>


		</div>
	</div>
</body>
</html>