<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile Page</title>
<%@ include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_components/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("userOBJ");
	if (session.getAttribute("userOBJ") == null)
		response.sendRedirect("login.jsp");
	%>



	<div class="container p-3">
		<div class="container text-success text-center">
			<%
			if (session.getAttribute("succMsg") != null) {
				out.println(session.getAttribute("succMsg").toString());
				session.removeAttribute("succMsg");
			}
			%>
		</div>

		<div class="container text-danger text-center">
			<%
			if (session.getAttribute("failedMsg") != null) {
				out.println(session.getAttribute("failedMsg").toString());
				session.removeAttribute("failedMsg");
			}
			%>
		</div>
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center text-danger p-1">Edit Profile</h4>
						<form action="update_profile" method="post">
							<input type="hidden" value="<%=u.getId()%>" name="id">
							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname"
									value="<%=u.getName()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email"
									value="<%=u.getEmail()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone Number</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phno"
									value="<%=u.getPhno()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="pass" value="<%=u.getPassword()%>">
							</div>
							<div>
								<button type="submit" class="btn btn-danger mt-1">Update</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="all_components/footer.jsp"%>
</body>
</html>