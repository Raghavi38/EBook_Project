<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Address Page</title>
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
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-body">
							<h4 class="text-center text-warning p-1">Add Address</h4>
							<form action="address" method="post">
							<input type="hidden" value="<%=u.getName() %>" name="name">
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="inputEmail4">Address</label> <input type="text"
											class="form-control" id="inputEmail4" name="add">
									</div>
									<div class="form-group col-md-6">
										<label for="inputPassword4">LandMark</label> <input
											type="text" class="form-control" id="inputPassword4"
											name="landmark">
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-4">
										<label for="inputEmail4">City</label> <input type="text"
											class="form-control" id="inputEmail4" name="city">
									</div>
									<div class="form-group col-md-4">
										<label for="inputPassword4">State</label> <input type="text"
											class="form-control" id="inputPassword4" name="state">
									</div>
									<div class="form-group col-md-4">
										<label for="inputPassword4">Pincode</label> <input type="text"
											class="form-control" id="inputPassword4" name="pin">
									</div>
								</div>
								<div class="text-center">
									<button class="btn btn-sm btn-warning text-dark">Add
										Address</button>
								</div>
							</form>


						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>