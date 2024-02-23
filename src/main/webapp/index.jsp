<%@page import="com.DAO.BookDaoImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.DB.DBConnect,java.util.*,com.entity.BookDetails"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Index</title>
<%@ include file="all_components/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/b.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #ded9d9;
}
</style>
</head>
<body style="background-color: #f5f0f0">
	<%
	User u = (User) session.getAttribute("userOBJ");
	%>

	<%@ include file="all_components/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-danger">E-Book Management System</h2>
	</div>



	<div class="container">

		<!-- Start Recent Book-->
		<h3 class="text-center">Recent Books</h3>
		<div class="row">
			<%

			BookDaoImpl dao2=new BookDaoImpl(DBConnect.getConn());
			List<BookDetails> list2 = dao2.getRecentBooks();
			for (BookDetails b2 : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Books/<%=b2.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b2.getBookName()%></p>
						<p><%=b2.getAuthor()%></p>
						<p>
							Category:
							<%=b2.getBookCategory()%></p>
						<%
						if (b2.getBookCategory().equals("Old")) {
						%>

						<div class="row">
							<a href="view_books.jsp?id=<%=b2.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b2.getPrice()%></a>
						</div>
						<%
						} else {
						%>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="bt btn-danger btn-sm "><i
								class="fa-solid fa-cart-shopping"></i> Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b2.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm "><i
								class="fa-solid fa-cart-shopping"></i> Add Cart</a>
							<%
							}
							%>
							<a
								href="view_books.jsp?id=<%=b2.getBookId()%>"
								class="bt btn-success btn-sm ml-1">View Details</a> <a href=""
								class="bt btn-danger btn-sm "><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b2.getPrice()%></a>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>

		<div class="text-center mt-2">
			<a href="all_recent_book.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>
		<!--End Recent Book  -->
		<hr>
		<!-- Start New Book-->
		<h3 class="text-center">New Books</h3>
		<div class="row">
			<%
			BookDaoImpl dao = new BookDaoImpl(DBConnect.getConn());
			List<BookDetails> list = dao.getNewBooks();
			for (BookDetails b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Books/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:
							<%=b.getBookCategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="bt btn-danger btn-sm "><i
								class="fa-solid fa-cart-shopping"></i> Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm "><i
								class="fa-solid fa-cart-shopping"></i> Add Cart</a>
							<%
							}
							%>

							<a href="view_books.jsp?id=<%=b.getBookId()%>"
								class="bt btn-success btn-sm ml-1">View Details</a> <a href=""
								class="bt btn-danger btn-sm "><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>

		<div class="text-center mt-2">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
		<!--End New Book  -->
		<hr>

		<!-- Start Old Book-->
		<h3 class="text-center">Old Books</h3>
		<div class="row">
			<%
			BookDaoImpl dao3 = new BookDaoImpl(DBConnect.getConn());
			List<BookDetails> list3 = dao3.getOldBooks();
			for (BookDetails b3 : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Books/<%=b3.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b3.getBookName()%></p>
						<p><%=b3.getAuthor()%></p>
						<p>
							Category:
							<%=b3.getBookCategory()%></p>

						<div class="row">
							<a href="view_books.jsp?id=<%=b3.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b3.getPrice()%></a>
						</div>

					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>

		<div class="text-center mt-2">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
		<!--End Old Book  -->


	</div>

	<%@ include file="all_components/footer.jsp"%>

</body>
</html>
