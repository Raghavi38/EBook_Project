<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Success page</title>
<%@ include file="all_components/allCss.jsp"%>
</head>
<body>
	<%@ include file="all_components/navbar.jsp"%>
	<div class="container text-center p-5">
	<i class="fa-solid fa-circle-check text-success fa-4x"></i>
	<h1>Thank You</h1>
	<h2>Your Order has been placed successfully</h2>
	<h5>Within 7 days your product will be delivered at your Address</h5>
	<a href="index.jsp" class="btn btn-success">Home</a>
	<a href="order.jsp" class="btn btn-danger">View Order</a>
	</div>
</body>
</html>