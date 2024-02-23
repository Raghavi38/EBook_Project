<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.DAO.BookDaoImpl,com.DB.DBConnect,java.util.*,com.entity.BookDetails"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:All Books</title>
<%@ include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="navbar.jsp"%>
	<%
	if(session.getAttribute("userobj")==null){
		response.sendRedirect("../login.jsp");
	}
	%>
	<h3 class="text-center text-dark p-2">Hello Admin</h3>
	<h4 class="text-center text-dark p-2">All Books</h4>
	<div class="text-center text-success" style="font-weight:bold;">
		<%
		if (session.getAttribute("succMsg") != null) {
			out.println(session.getAttribute("succMsg").toString());
			session.removeAttribute("succMsg");
		}
		%>
	</div>
	<div class="text-center text-danger" style="font-weight:bold;">
		<%
		if (session.getAttribute("failedMsg") != null) {
			out.println(session.getAttribute("failedMsg").toString());
			session.removeAttribute("failedMsg");
		}
		%>
	</div>
	<br>
	<table class="table ">
		<thead class="table-dark">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">CoverPage</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author Name</th>
				<th scope="col">Price</th>
				<th scope="col">Book Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			BookDaoImpl dao = new BookDaoImpl(DBConnect.getConn());
			List<BookDetails> list = dao.getAllBooks();
			for (BookDetails b : list) {
			%>

			<tr>
				<td><%=b.getBookId()%></td>
				<td><img src="../Books/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50px;"></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>
				<td><a href="editBooks.jsp?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a> <a href="../delete?id=<%=b.getBookId() %>"
					class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i> Delete</a></td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>

	<div style="margin-top: 140px;">
		<%@ include file="footer.jsp"%>
	</div>

</body>
</html>