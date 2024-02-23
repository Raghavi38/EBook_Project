<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User: Old Books</title>
<%@ include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_components/navbar.jsp"%>
	<div class="container text-success">
		<%
		if (session.getAttribute("succMsg") != null) {
			out.println(session.getAttribute("succMsg").toString());
			session.removeAttribute("succMsg");
		}
		%>
	</div>
	
	<div class="container text-danger">
		<%
		if (session.getAttribute("failedMsg") != null) {
			out.println(session.getAttribute("failedMsg").toString());
			session.removeAttribute("failedMsg");
		}
		%>
	</div>
	
	<div class="container p-3">
		<table class="table">
			<thead class="thead bg-primary text-white">
				<tr>
					<th scope="col">BookName</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				BookDaoImpl dao = new BookDaoImpl(DBConnect.getConn());
				if (session.getAttribute("userOBJ") != null) {
					User u = (User) session.getAttribute("userOBJ");
					String email = u.getEmail();
					List<BookDetails> list = dao.getBookByOld("Old", email);
					for (BookDetails b : list) {
				%>
				<tr>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><a
						href="remove_old_book?bid=<%=b.getBookId()%>&&email=<%=email %>"
						class="btn btn-danger">Remove</a></td>
				</tr>
				<%
				}
				} else {
				%>
				<%
				response.sendRedirect("login.jsp");
				%>
				<%
				}
				%>
			</tbody>
		</table>

	</div>
</body>
</html>