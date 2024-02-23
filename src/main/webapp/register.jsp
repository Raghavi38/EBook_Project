<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Register</title>
<%@ include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_components/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Registration Page</h4>
						<div class="text-center text-success">
						<%
						if(session.getAttribute("succMsg")!=null){
							//System.out.println("succMsg");
							out.println(session.getAttribute("succMsg").toString());
							session.removeAttribute("succMsg");
							}
						%>
						</div>
						
						<div class="text-center text-danger">
						<%
						if(session.getAttribute("failedMsg")!=null){
							//System.out.println("failedMsg");
							out.println(session.getAttribute("failedMsg").toString());
							session.removeAttribute("failedMsg");
							}
						%>
						</div>
						
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone Number</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phno">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="pass">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree Terms and Conditions</label>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary mt-1">Submit</button>
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