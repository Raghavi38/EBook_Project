<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Add Books</title>
<%@ include file="allCss.jsp"%>
</head>
<body style="background-color:#f0f1f2;">
	<%@ include file="navbar.jsp"%>
	<%
	if(session.getAttribute("userobj")==null){
		response.sendRedirect("../login.jsp");
	}
	%>
	<div class="container p-3">
		<div clas="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Add Books</h3>
						<div class="text-center text-success">
						<%
						if(session.getAttribute("succMsg")!=null){
							out.println(session.getAttribute("succMsg").toString());
							session.removeAttribute("succMsg");
						}
						%>
						</div>
						<div class="text-center text-danger">
						<%
						if(session.getAttribute("failedMsg")!=null){
							out.println(session.getAttribute("failedMsg").toString());
							session.removeAttribute("failedMsg");
						}
						%>
						</div>
						<form action="../add_books" method="post"
							enctype="multipart/form-data">
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
								<label for="inputState">Book Categories</label> <select
									id="inputState" name="category" class="form-control">
									<option selected>--select--</option>
									<option value="New">New Book</option>
								</select>
							</div>
							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="bstatus" class="form-control">
									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
							<div class="form-group">
							<label for="exampleFormControlField">Upload Photo</label>
							<input name="bimg" type="file" class="form-control-file" id="exampleFormControlField">
							</div>
							
							<button type="submit" class="btn btn-primary">Add</button>
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="footer.jsp"%>
</body>
</html>