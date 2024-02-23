<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDaoImpl,java.util.*,com.entity.BookDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Books</title>
<%@ include file="all_components/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #ded9d9;
}
</style>
</head>
<body>
	<%
	User u = (User) session.getAttribute("userOBJ");
	%>
	
	<%@ include file="all_components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			BookDaoImpl dao = new BookDaoImpl(DBConnect.getConn());
			List<BookDetails> list = dao.getAllNewBooks();
			for (BookDetails b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-1">
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
	</div>
	
	<%
	if (session.getAttribute("cartMsg") != null) {
	%>
	<div aria-live="polite" aria-atomic="true"
		style="position: relative; min-height: 200px;">
		<div class="toast" style="position: absolute top-0 start-50
                translate-middle-x">
			<div class="toast-header">
			</div>
			<div class="toast-body text-light text-center " style="background-color:black;height:30px;width:400px;margin-left:35%;"><%=session.getAttribute("cartMsg").toString() %>
			</div>
		</div>
	</div>
	<%
	session.removeAttribute("cartMsg");
	}
	%>
	<%
	if (session.getAttribute("failedMsg") != null) {
	%>
	<div aria-live="polite" aria-atomic="true"
		style="position: relative; min-height: 200px;">
		<div class="toast" style="position: absolute top-0 start-50
                translate-middle-x">
			<div class="toast-header">
			</div>
			<div class="toast-body text-light text-center " style="background-color:black;height:30px;width:400px;margin-left:35%;"><%=session.getAttribute("failedMsg").toString() %>
			</div>
		</div>
	</div>
	<%
	session.removeAttribute("failedMsg");
	}
	%>
	
</body>
</html>