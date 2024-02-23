<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Book Page</title>
<%@ include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_components/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("userOBJ");
	if (session.getAttribute("userOBJ") == null)
		response.sendRedirect("login.jsp");
	%>

	<div class="text-center text-success">
		<%
		if (session.getAttribute("succMsg") != null) {
			out.println(session.getAttribute("succMsg").toString());
			session.removeAttribute("succMsg");
		}
		%>
	</div>
	<div class="text-center text-danger">
		<%
		if (session.getAttribute("failedMsg") != null) {
			out.println(session.getAttribute("failedMsg").toString());
			session.removeAttribute("failedMsg");
		}
		%>
	</div>


	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-primary p-1">Sell Books</h4>
						<form action="add_old_books" method="post"
							enctype="multipart/form-data">
							<input type="hidden" value="<%=u.getEmail()%>" name="uEmail">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="bname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="aname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="price">
							</div>
							<div class="form-group">
								<label for="exampleFormControlField">Upload Photo</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlField">
							</div>
							<button type="submit" class="btn btn-primary">Sell</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="all_components/footer.jsp"%>
</body>
</html>