<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDaoImpl,java.util.*,com.entity.BookDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Old Books</title>
<%@ include file="all_components/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #ded9d9;
}
</style>
</head>
<body>
	<%@ include file="all_components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			BookDaoImpl dao3 = new BookDaoImpl(DBConnect.getConn());
			List<BookDetails> list3 = dao3.getAllOldBooks();
			for (BookDetails b3 : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="Books/<%=b3.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b3.getBookName()%></p>
						<p><%=b3.getAuthor()%></p>
						<p>
							Category:
							<%=b3.getBookCategory()%></p>

						<div class="row">
							<a href="view_books.jsp?id=<%=b3.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b3.getPrice()%></a>
						</div>

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