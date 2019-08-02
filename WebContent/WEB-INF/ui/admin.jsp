<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jnnotice.model.*"%>
<%@ page import="com.jnnotice.bo.*"%>
<%@ page import="com.constants.IConstants"%>
<!DOCTYPE html">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- LINK to CSS-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/custum.css">
<link href="<%=request.getContextPath()%>/css/stickup.css"
	rel="stylesheet">
<!--table css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/table.css">
<!--scripts-->
<script src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"
	type="text/javascript"></script>
</head>
<body style="margin-top: 50px;">
	<%
		List<User> liJn = new ArrayList<User>();
	BoUser user=new BoUser();
		liJn = user.user_table();
	%>
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
									<li class="menuItem"><a
										href="${pageContext.request.contextPath}/FacultyServlet">UPload</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- End Navbar -->
			</div>
		</div>
	</header>

	<%
		String alertFlag = (String) request.getAttribute(IConstants.ALERT_FLAG);

		if (alertFlag != null && alertFlag.length() > 0) {

			if (alertFlag.equals(IConstants.ALERT_SUCCESS)) {
	%>
	<div class="alert alert-success alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<strong>Well done!</strong> User added successfully.
	</div>

	<%
		} else {
	%>


	<div class="alert alert-danger alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<strong>Oh snap!</strong> Unable to add user.
	</div>

	<%
		}
		}
	%>

	<!--main section-->
	<div class="container">
		<div class="row text-center">
			<div class="col-md-3"></div>
			<div class="col-md-2  text-center" id="faculty">
				<div class="row">
					<div class="col-md-12">
						<br> <i class="fa fa-4x fa-users"></i>
					</div>
					<br>
					<div class="row">
						faculty registered <span class="badge">2</span>
					</div>
					<br>
					<div class="row">
						faculty active <span class="badge">3</span>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-md-offset-0  text-center" id="notice_stats">
				<div class="row">
					<div class="col-md-12">
						<br> <i class="fa fa-4x fa-newspaper-o"></i>
					</div>
					<br>
					<div class="row">
						Notices posted <span class="badge">40</span>
					</div>
					<br>
					<div class="row">
						Notices active <span class="badge">26</span>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-md-offset-0 text-center" id="events_stats">
				<div class="row">
					<div class="col-md-12">
						<br> <i class="fa fa-4x fa-calendar"></i>
					</div>
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
		<br> <br>
		<div class="row">
			<div class="col-md-4">
				<div class="panel panel-collapse panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title text-center">
							Add new Admin/Faculty <span class="fa fa-plus-square"></span>
						</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-12">
								<form data-toggle="validator" role="form" method="post"
									action="<%=request.getContextPath()%>/adminAddUserPost">
									<div class="form-group has-feedback">
										<label for="Name" class="control-label">Name</label>
										<div class="input-group">
											<input type="text" pattern="^[_A-z0-9]{1,}$" maxlength="15"
												class="form-control" id="Name" name="name"
												placeholder="Mr/Miss/Sh." required>
										</div>
										<span class="glyphicon form-control-feedback"
											aria-hidden="true"></span>
										<div class="help-block with-errors">Special characters
											are not allowed</div>
									</div>
									<div class="form-group">
										<label for="inputEmail" class="control-label">Email/UserName</label>
										<input type="email" class="form-control" id="inputEmail"
											name="email" placeholder="Email"
											data-error="Bruh, that email address is invalid" required>
										<div class="help-block with-errors"></div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="control-label">Password</label>
										<div class=" row">
											<div class="form-group col-sm-6">
												<input type="password" data-minlength="6"
													class="form-control" id="inputPassword" name="password"
													placeholder="Password" required>
												<div class="help-block">Minimum of 6 characters</div>
											</div>
											<div class="form-group col-sm-6">
												<input type="password" class="form-control"
													id="inputPasswordConfirm" data-match="#inputPassword"
													data-match-error="Whoops, these don't match"
													placeholder="Confirm" required>
												<div class="help-block with-errors">enter same
													password</div>
											</div>
										</div>
									</div>
									<label>Your Trade</label> <select class="form-control"
										name="trade">
										<option value="1">ECE</option>
										<option value="2">ME</option>
										<option value="3">CE</option>
										<option value="4">TE</option>
										<option value="5">AP</option>
									</select> <label>User Type</label> <select class="form-control"
										name="type">
										<option value="1">Admin</option>
										<option value="2">Faculty</option>
										<option value="3">Student</option>
									</select>
									<div class="form-group">
										<div class="checkbox">
											<label> <input type="checkbox" id="terms"
												data-error="Before you wreck yourself" required> I
												agree to T&C
											</label>
											<div class="help-block with-errors"></div>
										</div>
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</form>

							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="col-md-8 col-sm-12">
				<div class="panel panel-collapse panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title text-center">
							Admin / Faculty <span class="fa fa-table"></span>
						</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-12">
								<div id="no-more-tables">
									<table
										class="col-md-12 table-bordered table-striped table-condensed cf">
										<thead class="cf">
											<tr>
												<th>#</th>

												<th class="numeric">User</th>
												<th class="numeric">Name</th>
												<th class="numeric">Trade</th>
												<th class="numeric">Active</th>
												<th class="numeric">Created</th>
												<th class="numeric">Updated</th>
												<th class="numeric">Edit</th>
											</tr>
										</thead>
										<tbody>
											<%
												for (int i = 0; i < liJn.size(); i++) {
													User user1 = new User();
													user1 = liJn.get(i);
											%>
											<tr>
												<td data-title="#" class="numeric text-center"><%=i + 1%></td>
												<td data-title="User" class="numeric text-center"><%=user1.getType()%></td>
												<td data-title="Name" class="numeric text-center"><%=user1.getName()%></td>
												<td data-title="Trade" class="numeric text-center"><%=user1.getTrade()%></td>
												<td data-title="Active" class="numeric text-center">
													<%
														if (user1.getActive().equalsIgnoreCase("yes")) {
													%> <i class="fa fa-check "></i> <%
 	} else {
 %> <i class="fa fa-times "></i> <%
 	}
 %>
												</td>
												<td data-title="Created" class="numeric"><%=user1.getCreated()%></td>
												<td data-title="Updated" class="numeric"><%=user1.getUpdated()%></td>
												<td data-title="Edit" class="text-center"><a href="#"><i
														class="fa fa-pencil"></i></a>&nbsp; &nbsp;<a href="#"><i
														class="fa fa-trash"></i></a></td>
											</tr>

											<%
												}
											%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-collapse panel-danger">
					<div class="panel-heading">
						<h3 class="panel-title text-center">
							Notice <span class="fa fa-table"></span>
						</h3>
					</div>
					<div class="panel-body">
						<div id="no-more-tables">
							<table class="table  table-striped table-responsive  table-hover">
								<tr>
									<th class="text-center">#</th>
									<th class="text-center">Notice</th>
									<th class="text-center">Posted by</th>
									<th class="text-center">Trade/event</th>
									<th class="text-center">Active</th>
									<th class="text-center">Created</th>
									<th class="text-center">Updated</th>
									<th class="text-center">Edit</th>
								</tr>
								<tr>
									<td class="text-center">1.</td>
									<td class="text-center">Admin</td>
									<td class="text-center">Akshay Kumar</td>
									<td class="text-center">ME</td>
									<td class="text-center"><i class="fa fa-times "></i></td>
									<td class="text-center">23/06/17</td>
									<td class="text-center">22/03/12</td>
									<td class="text-center"><a href="#"><i
											class="fa fa-pencil"></i></a>&nbsp; <a href="#"><i
											class="fa fa-wrench"></i></a> &nbsp;<a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>
								<tr>
									<td class="text-center">2.</td>
									<td class="text-center">faculty</td>
									<td class="text-center">Harsh bhanot</td>
									<td class="text-center">ECE</td>
									<td class="text-center"><i class="fa fa-check "></i></td>
									<td class="text-center">21/06/17</td>
									<td class="text-center">22/01/12</td>
									<td class="text-center"><a href="#"><i
											class="fa fa-pencil"></i></a>&nbsp; <a href="#"><i
											class="fa fa-wrench"></i></a> &nbsp;<a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>
								<tr>
									<td class="text-center">3.</td>
									<td class="text-center">Admin</td>
									<td class="text-center">Monika Kumari</td>
									<td class="text-center">TE</td>
									<td class="text-center"><i class="fa fa-check "></i></td>
									<td class="text-center">21/02/17</td>
									<td class="text-center">22/01/12</td>
									<td class="text-center"><a href="#"><i
											class="fa fa-pencil"></i></a>&nbsp; <a href="#"><i
											class="fa fa-wrench"></i></a> &nbsp;<a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>
								<tr>
									<td class="text-center">4.</td>
									<td class="text-center">Admin</td>
									<td class="text-center">Harsh bhanot</td>
									<td class="text-center">ECE</td>
									<td class="text-center"><i class="fa fa-check "></i></td>
									<td class="text-center">21/06/17</td>
									<td class="text-center">22/01/12</td>
									<td class="text-center"><a href="#"><i
											class="fa fa-pencil"></i></a>&nbsp; <a href="#"><i
											class="fa fa-wrench"></i></a> &nbsp;<a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>
								<tr>
									<td class="text-center">5.</td>
									<td class="text-center">Admin</td>
									<td class="text-center">Harsh bhanot</td>
									<td class="text-center">ECE</td>
									<td class="text-center"><i class="fa fa-check "></i></td>
									<td class="text-center">21/06/17</td>
									<td class="text-center">22/01/12</td>
									<td class="text-center"><a href="#"><i
											class="fa fa-pencil"></i></a>&nbsp; <a href="#"><i
											class="fa fa-wrench"></i></a> &nbsp;<a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>
								<tr>
									<td class="text-center">5.</td>
									<td class="text-center">Admin</td>
									<td class="text-center">Harsh bhanot</td>
									<td class="text-center">ECE</td>
									<td class="text-center"><i class="fa fa-check "></i></td>
									<td class="text-center">21/06/17</td>
									<td class="text-center">22/01/12</td>
									<td class="text-center"><a href="#"><i
											class="fa fa-pencil"></i></a>&nbsp; <a href="#"><i
											class="fa fa-wrench"></i></a> &nbsp;<a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>
								<tr>
									<td class="text-center">6.</td>
									<td class="text-center">Admin</td>
									<td class="text-center">Harsh bhanot</td>
									<td class="text-center">ECE</td>
									<td class="text-center"><i class="fa fa-check "></i></td>
									<td class="text-center">21/06/17</td>
									<td class="text-center">22/01/12</td>
									<td class="text-center"><a href="#"><i
											class="fa fa-pencil"></i></a>&nbsp; <a href="#"><i
											class="fa fa-wrench"></i></a> &nbsp;<a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>
								<tr>
									<td class="text-center">7.</td>
									<td class="text-center">Admin</td>
									<td class="text-center">Harsh bhanot</td>
									<td class="text-center">ECE</td>
									<td class="text-center"><i class="fa fa-check "></i></td>
									<td class="text-center">21/06/17</td>
									<td class="text-center">22/01/12</td>
									<td class="text-center"><a href="#"><i
											class="fa fa-pencil"></i></a>&nbsp; <a href="#"><i
											class="fa fa-wrench"></i></a> &nbsp;<a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>
								<tr>
									<td class="text-center">8.</td>
									<td class="text-center">Admin</td>
									<td class="text-center">Harsh bhanot</td>
									<td class="text-center">ECE</td>
									<td class="text-center"><i class="fa fa-check "></i></td>
									<td class="text-center">21/06/17</td>
									<td class="text-center">22/01/12</td>
									<td class="text-center"><a href="#"><i
											class="fa fa-pencil"></i></a>&nbsp; <a href="#"><i
											class="fa fa-wrench"></i></a> &nbsp;<a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>
								<tfoot>
									<tr>
										<td colspan="8">lorem ipsum abc dejnaharjiwsj
											jlskadhrfjknsdan lkawenrlkeawnrlkewan
											lkewalrnewalkrlwkaenrlkawe</td>
									</tr>

								</tfoot>
							</table>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!--end of container-->
	<hr>
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