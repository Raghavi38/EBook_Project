<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Setting Page</title>
<%@ include file="all_components/allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #f0f1f2;">
	<%
	User u = (User) session.getAttribute("userOBJ");
	if (session.getAttribute("userOBJ") == null)
		response.sendRedirect("login.jsp");
	%>
	<%@ include file="all_components/navbar.jsp"%>
	<div class="container">
		<%
		if (session.getAttribute("userOBJ") != null) {
		%>
		<h3 class="text-center p-2">
			Hello,
			<%=u.getName()%></h3>
		<%
		}
		%>
		<div class="row p-4">
			<div class="col-md-4">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-center">
								<i class="fa-solid fa-book-open fa-3x text-primary"></i>
								<h4>Sell Old Book</h4>
							</div>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-4">
				<a href="old_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-center">
								<i class="fa-solid fa-book-open fa-3x text-primary"></i>
								<h4>Old Books List</h4>
							</div>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-center">
								<i class="fa-solid fa-pen-to-square fa-3x text-danger"></i>
								<h4>Edit Profile</h4>
							</div>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 mt-3">
				<a href="user_address.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-center">
								<i class="fa-solid fa-location-dot fa-3x text-warning"></i>
								<h4>Your Address</h4>
								<p>Edit Address</p>
							</div>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 mt-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-center">
								<i class="fa-solid fa-box-open fa-3x text-success"></i>
								<h4>My Order</h4>
								<p>Track your Order</p>
							</div>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 mt-3">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-center">
								<i class="fa-solid fa-phone fa-3x text-primary"></i>
								<h4>Help Center</h4>
								<p>24*7 Service</p>
							</div>
						</div>
					</div>
				</a>
			</div>

		</div>
	</div>

	<%@ include file="all_components/footer.jsp"%>
</body>
</html>