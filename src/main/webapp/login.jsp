<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook-Login</title>
<%@ include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_components/navbar.jsp"%>
	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Login</h3>
						<div class="text-center text-danger">
						<%
						if(session.getAttribute("failedMsg")!=null){
							out.println(session.getAttribute("failedMsg").toString());
							session.removeAttribute("failedMsg");
						}
						%>
						</div>
						<div class="text-center text-success">
						<%
						if(session.getAttribute("succMsg")!=null){
							out.println(session.getAttribute("succMsg").toString());
							session.removeAttribute("succMsg");
						}
						%>
						</div>
						
						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Check me out</label>
							</div>
							<div class="text-center">
							<button type="submit" class="btn btn-primary">Submit</button><br>
							<a href="register.jsp">Create Account</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container-fluid text-center text-white p-3 mt-4" style="background-color: #4dd0e1">
<h5>Design and Developed By Raghavi R</h5>
</div>
</body>
</html>