
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDaoImpl,java.util.*,com.entity.BookDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Books</title>
<%@ include file="all_components/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #ded9d9;
}
</style>
</head>
<body>
	<%@ include file="all_components/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("userOBJ");
	%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			BookDaoImpl dao2 = new BookDaoImpl(DBConnect.getConn());
			List<BookDetails> list2 = dao2.getAllRecentBooks();
			for (BookDetails b2 : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="Books/<%=b2.getPhotoName()%>"
							style="width: 100px; height: 150px" class="img-thumblin">
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
							<a href="view_books.jsp?id=<%=b2.getBookId()%>"
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
	</div>
</body>
</html>