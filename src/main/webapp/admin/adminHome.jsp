<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Home</title>
<%@ include file="allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<%
	if(session.getAttribute("userobj")==null){
		response.sendRedirect("../login.jsp");
	}
	%>
	<div class="text-center text-dark p-2">
		<h2>Hello,Admin</h2>
	</div>

	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="addBooks.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-square-plus fa-3x text-primary"></i><br>
							<h4>Add Books</h4>
							-----------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="allBooks.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-success"></i><br>
							<h4>All Books</h4>
							-----------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-gift fa-3x text-warning"></i><br>
							<h4>Orders</h4>
							-----------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a data-toggle="modal" data-target="#exampleModalCenter">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-right-from-bracket fa-3x text-danger"></i><br>
							<h4>Logout</h4>
							-----------
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>

	<!--Start Logout Module-->

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<h4>Do You want to Logout?</h4>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<a href="../Logout" type="button" class="btn btn-primary">Logout</a>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- End Logout Module -->

	<div style="margin-top: 100px;">
		<%@ include file="footer.jsp"%>
	</div>



</body>
</html>