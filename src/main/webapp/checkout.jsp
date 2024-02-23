<%@page import="com.entity.User,java.util.*,com.entity.Cart"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
<%@ include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@ include file="all_components/navbar.jsp"%>
	<%
	if (session.getAttribute("userOBJ") == null)
		response.sendRedirect("login.jsp");
	%>

	<%
	if (session.getAttribute("deleteMsg") != null) {
	%>
	<div class="alert alert-success" role="alert">Book Removed from
		Cart Succesfully...</div>
	<%
	session.removeAttribute("deleteMsg");
	}
	%>


	<%
	if (session.getAttribute("failedMsg") != null) {
	%>
	<div class="alert alert-danger" role="alert">Something wrong on
		server...</div>
	<%
	session.removeAttribute("failedMsg");
	}
	%>
	<%
	if (session.getAttribute("failedOrderMsg") != null) {
	%>
	<div class="alert alert-danger" role="alert">Something wrong on
		server...</div>
	<%
	session.removeAttribute("failedOrderMsg");
	}
	%>
	<%
	if (session.getAttribute("failedPayMsg") != null) {
	%>
	<div class="alert alert-danger" role="alert">Select the Payment Method...</div>
	<%
	session.removeAttribute("failedPayMsg");
	}
	%>



	<div class="container">
		<div class="row p-3">
			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Item</h3>
						<table class="table mt-3">
							<thead class="thead-dark">
								<tr>
									<th scope="col">BookName</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userOBJ");
								CartDaoImpl dao = new CartDaoImpl(DBConnect.getConn());
								List<Cart> list = dao.getBookByUser(u.getId());
								Double totalPrice = 0.00;
								for (Cart c : list) {
									totalPrice = c.getTotalPrice();
								%>
								<tr>
									<td><%=c.getBookName()%></td>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>

								</tr>
								<%
								}
								%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

			</div>
			<div class="col-md-6">
				<%
				User u1 = (User) session.getAttribute("userOBJ");
				%>
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">You Details for Order</h3>
						<form action="order" method="post">
							<input type="hidden" value=<%=u1.getId()%> name="id">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" id="inputEmail4" value="<%=u.getName()%>"
										readonly="readonly" name="name">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										class="form-control" id="inputPassword4"
										value="<%=u.getEmail()%>" readonly="readonly" name="email">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Mobile No</label> <input type="number"
										class="form-control" id="inputEmail4" value="<%=u.getPhno()%>"
										readonly="readonly" name="phno">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4" value="<%=u.getAddress()%>" name="address" required="required">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">LandMark</label> <input type="text"
										class="form-control" id="inputEmail4" value="<%=u.getLandmark()%>" name="landmark" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4" value="<%=u.getCity()%>" name="city" required="required">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" value="<%=u.getState() %>" name="state" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pincode</label> <input
										type="text" class="form-control" id="inputPassword4" value="<%=u.getPincode() %>"
										name="pin" required="required">
								</div>
							</div>
							<div class="form-group">
								<label>Payment Mode</label> <select class="form-control"
									name="payment" required="required">
									<option value="noselect">--Select--</option>
									<option value="cod">Cash on Delivery</option>
								</select>
							</div>
							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>