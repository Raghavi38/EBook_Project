


<div class="container-fluid"
	style="height: 10px; background-color: #4dd0e1;"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fa-solid fa-book"></i> EBooks
			</h3>
		</div>
		<div class="col-md-6"></div>
		<div class="col-md-3">
			<%
			if (session.getAttribute("userobj") != null) {
			%>
			<a class="btn btn-success"><i
				class="fa-solid fa-user"></i> <%
 out.println(session.getAttribute("userobj"));
 %> </a> <a data-toggle="modal" data-target="#exampleModalCenter"
				class="btn btn-primary text-white"> <i
				class="fa-solid fa-right-from-bracket"></i> Logout
			</a>
			<%
			} else {
			%>
			<a href="../login.jsp" class="btn btn-success"><i
				class="fa-solid fa-right-to-bracket"></i> Login</a> <a
				href="../register.jsp" class="btn btn-primary text-white"><i
				class="fa-solid fa-user"></i> Register</a>
			<%
			}
			%>
		</div>
	</div>
</div>

<!--Start Logout Module-->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="text-center">
				<h4>Do You want to Logout?</h4>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a href="../Logout" type="button" class="btn btn-primary">Logout</a>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<!-- End Logout Module -->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto ">
			<li class="nav-item active"><a class="nav-link"
				href="adminHome.jsp"><i class="fa-solid fa-house"></i> Home<span
					class="sr-only">(current)</span></a></li>
	</div>
</nav>
