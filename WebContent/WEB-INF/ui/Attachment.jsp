<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="com.jnnotice.model.*" %>
		<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
<!-- META TAGS -->
<meta charset="UTF-8">

<!-- Title -->
<title>JN NOTICEB</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- LINK to CSS-->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/custum.css">
<link href="css/stickup.css" rel="stylesheet">
<!--scripts-->
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>

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
									<li class="menuItem"><a href="#features">Users</a></li>
									<li class="menuItem"><a href="#updates">Notices</a></li>
									<li class="menuItem"><a href="#installation">Add user</a></li>
									<li class="menuItem"><a href="#one-pager">Update User</a></li>
									<li class="menuItem"><a href="#extras"></a></li>
									<li class="menuItem"><a href="#wordpress">About Us</a></li>
									<li class="menuItem"><a href="#contact">Contact us</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- End Navbar -->

			</div>
		</div>
	</header>
	<br>
	<br>
	<!--main section-->
	<div class="container">
		<div class="row text-center">
			<div class="col-md-3">
				<div class="col-md-12  text-center" id="faculty">
					<div class="row">
						<div class="col-md-12">
							<br>
							<div class="row">
								<div class="col-sm-4">
									<i class="fa fa-4x fa-users"></i>
								</div>
								<div class="col-sm-8">
									<div class="row">
										faculty registered <span class="badge">40</span>
									</div>
									<br>
									<div class="row">
										faculty active <span class="badge">40</span>
									</div>
								</div>
								<br>
							</div>
						</div>
					</div>
					<!--end of 12 md col-->


				</div>
				<div class="col-md-12 col-md-offset-0  text-center"
					id="notice_stats">
					<div class="row">
						<div class="col-md-12">
							<br>
							<div class="row">
								<div class="col-sm-4">
									<i class="fa fa-4x fa-newspaper-o"></i>
								</div>
								<br>
								<div class="col-sm-8">
									<div class="row">
										Notices posted <span class="badge">40</span>
									</div>
									<br>
									<div class="row">
										Notices active <span class="badge">26</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12 col-md-offset-0 text-center" id="events_stats">
					<div class="row">
						<div class="col-md-12">
							<br>
							<div class="row">
								<div class="col-sm-4">
									<i class="fa fa-4x fa-calendar"></i>
								</div>
								<div class="col-sm-8">
									<br>
									<div class="row">
										Events Created <span class="badge">40</span>
									</div>
									<br>
									<div class="row">
										Events active <span class="badge">26</span>
									</div>
								</div>
							</div>

						</div>

					</div>


				</div>


			</div>
			<div class="col-md-8 col-md-offset-1" id="box">
				<!-- Button trigger modal -->
				<% Notice notice=new Notice();
				notice=(Notice)session.getAttribute("NOTICE");
				%>
				<div class="row">
					<div class="col-md-6">
					<h3><%=notice.getName() %></h3><br>
					<h4><%=notice.getMessage() %></h4>
					</div>
				</div>
				<button type="button" class="btn btn-primary btn-lg"
					data-toggle="modal" data-target="#myModal">Do you want to add attachments</button>

				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Add Attachments</h4>
							</div>
							<div class="modal-body">
							<%=notice.getType() %>
							
						<form method="post" action="${pageContext.request.contextPath}/UploadServlet" enctype="multipart/form-data">
							<%session.setAttribute("NOTICE", notice); %>
							<input type="file" name="file" id="file" multiple>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary">Upload</button>
									</form>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

		<br> <br> <br>
		<!--footer data to be shown here-->
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

		<script src="js/jquery.min.js"></script>
		<script>
		
	</script>
</body>
</html>