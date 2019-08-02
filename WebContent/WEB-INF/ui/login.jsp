<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- LINK to CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/custum.css">
<link href="${pageContext.request.contextPath}/css/stickup.css"
	rel="stylesheet">
<!--scripts-->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
	type="text/javascript"></script>
</head>
<body>
	<header>
		<div class="navbar-wrapper box-shadow-blue">
			<div class="container">
				<div class="navwrapper">
					<div class="navbar navbar-inverse navbar-fixed-top">
						<div class="container">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle"
									data-toggle="collapse" data-target=".navbar-collapse">
									<span class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
								<a class="navbar-brand" href="#">JN NOTICE</a>
							</div>
							<div class="navbar-collapse collapse">
								<ul class="nav navbar-nav">
									<li class="menuItem active"><a href="#home">Home</a></li>
									<li class="menuItem"><a href="#features">About Us</a></li>
									<li class="menuItem"><a href="#updates">Setting</a></li>
									<li class="menuItem"><a href="#installation">Admin</a></li>

									<li class="menuItem"><a href="#contact">Contact</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- End Navbar -->

			</div>
		</div>
	</header>
	<div class="container-fluid box-shadow-blue">
		<div class="row" id="panel">
			<br> <br> <br>
			<div class="col-md-2">
				<i class="fa fa-5x fa-newspaper-o"></i>
			</div>
			<div class="col-md-4 col-md-offset-2">
				<h1 class="text-capitalize text-center text-info text-shadow">JN
					NOTICE BOARD</h1>
			</div>
			<div class="col-md-2 col-md-offset-2">
				<button class="btn btn-primary">Sign in</button>
				<button class="btn btn-primary">Sign up</button>
				<br> <br>
			</div>
		</div>


	</div>
	<hr>
	<!--main section-->
	<div>
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4" id="login">
					<form action="loginServlet" method="post">
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								type="email" class="form-control" id="email" placeholder="Email"
								name="email">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" class="form-control" id="password"
								placeholder="Password" name="password">
						</div>

						<button type="submit" class="btn btn-primary">Submit</button>
						<a href="#"> Forgot password?</a>
					</form>
				</div>
			</div>
		</div>
		<!--end of container-->
	</div>
	<!-- footer workes here -->
	<footer>
		<div class="row">

			<!--First column-->
			<div class="col-md-3 col-md-offset-1">
				<h5 class="text-center text-shadow">About Us</h5>
				<p>This website is intended to broadcast messages and
					information to the students and other college administration.lorem
					ipsum</p>
			</div>
			<!--/.First column-->

			<!--Second column-->
			<div class="col-md-4">
				<h5 class="text-center text-shadow">Important Links</h5>
				<ul>
					<li><a href="#!">Home</a></li>
					<li><a href="#!">Users</a></li>
					<li><a href="#!">Notices</a></li>
					<li><a href="#!">Add User</a></li>
					<li><a href="#!">About Us</a></li>
					<li><a href="#!">Contact Us</a></li>
				</ul>
			</div>
			<!--/.Second column-->
			<!--third colomn-->
			<div class="col-md-4">
				<h5 class="text-center text-shadow">Find Us</h5>
				<p>
					Jawahar Lal Nehru Government Engineering College <br>
					SunderNagar, Mandi <br>Himachal Pradesh,175002

				</p>
			</div>
		</div>
		<!--/.Footer Links-->

		<!--Copyright-->
		<div class="footer-copyright">
			<div class="container-fluid text-center">
				© 2016 Copyright: <a href="#"> JNGEC. SunderNagar </a>
			</div>
		</div>
		<!--/.Copyright-->

	</footer>
</body>
</html>