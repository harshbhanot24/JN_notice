<%@page import="java.text.DecimalFormat"%>
<%@page import="com.jnnotice.bo.HomeNoticeBo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="com.jnnotice.*"%>
<%@ page import="com.*"%>

<%@page import="com.jnnotice.model.Trade"%>
<%@page import="com.jnnotice.model.User"%>
<%@page import="com.jnnotice.model.Notice"%>
<%@page import="com.jnnotice.bo.HomeNoticeBo"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>JN NOTICEB</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- LINK to CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/custum.css">
<!--scripts-->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
	type="text/javascript"></script>
</head>
<body>
<%
					String name = null;
					Map<String, List<Object>> map = new HashMap<String, List<Object>>();
					HomeNoticeBo obj = new HomeNoticeBo();
					String query = null;
					map = (Map<String, List<Object>>) request.getAttribute("MAP");
					System.out.println("map in jsp is " + map);
					List<Object> Noticelist = new LinkedList<Object>();
					List<Object> Userlist = new LinkedList<Object>();
					List<Object> Tradelist = new LinkedList<Object>();
					List<Object> NIDlist = new LinkedList<Object>();
					Noticelist = map.get("NOTICELIST");
					System.out.println(Noticelist);
					Userlist = map.get("USERLIST");
					Tradelist = map.get("TRADELIST");
					NIDlist = map.get("NIDLIST");
				%><!-- end of java code -->
<%int itemPerPage = 2;//here we can add logic for custum items per page
						int start = 0;//by default we want to start from 0

						long key = Noticelist.size() / itemPerPage;
						int keyInt = Noticelist.size() / itemPerPage;
						if (key > keyInt) {
							keyInt += 1;
						}

						if (request.getAttribute("index") != null) {
							String index = (String) request.getAttribute("index");
							DecimalFormat decimalFormat = new DecimalFormat();
							start = decimalFormat.parse(index).intValue();
							System.out.println("The value of start at jsp is" + start);
						} else {
							start = 0;
						}
%>	<header>
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
									<li class="menuItem"><a href="#features">About us</a></li>

									<li class="menuItem"><a href="#extras">Settings</a></li>
									<li class="menuItem"><a href="#wordpress">Latest</a></li>
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
				<button class="btn btn-primary">
					<a href="${pageContext.request.contextPath}/loginServlet">Sign
						in</a> <i class="fa fa-sign-in"></i>
				</button>
				<button class="btn btn-primary">
					Sign up <i class="fa fa-user-plus"></i>
				</button>
				<br> <br>
			</div>
		</div>


	</div>
	<br>
	<!--main section-->
	<div class="container-fluid">
		<div class=" box-shadow" id="well">
			<div class="row">
				<div class="col-md-2 col-sm-4">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Library</li>
					</ol>
				</div>
				<div class="col-md-2 col-md-offset-8 col-sm-4 col-sm-offset-4">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search for..."> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button">Go!</button>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2 col-sm-12">
				<div class="row">
					<div class="col-md-12">
						<div class="list-group">
							<a href="#" class="list-group-item active">Filter By<span
								class="badge">TRADE</span></a>
							<form method="get"
								action="${pageContext.request.contextPath}/FilterServletTradeGET">
								<table class="table table-hover" id="table">

									<tbody>
										<tr>
											<td><fieldset class="form-group">
													<input type="radio" id="CE" name="trade" value="CE">
													<label for="CE"></label>
												</fieldset></td>
											<td><i class="fa fa-fort-awesome"></i> CE</td>
										</tr>
										<tr>
											<td><fieldset class="form-group">
													<input type="radio" id="ECE" name="trade" value="ECE">
													<label for="ECE"></label>
												</fieldset></td>
											<td><i class="fa fa-plug"></i> ECE</td>
										</tr>
										<tr>
											<td><fieldset class="form-group">
													<input type="radio" id="ME" name="trade" value="ME">
													<label for="ME"></label>
												</fieldset></td>
											<td><i class="fa fa-anchor"></i> ME</td>
										</tr>
										<tr>
											<td><fieldset class="form-group">
													<input type="radio" id="TE" name="trade" value="TE">
													<label for="TE"></label>
												</fieldset></td>
											<td><i class="fa fa-black-tie"></i> TE</td>
										</tr>
										<tr>
											<td><fieldset class="form-group">
													<input type="radio" id="AP" name="trade" value="AP">
													<label for="AP"></label>
												</fieldset></td>
											<td><i class="fa fa-flask"></i> AP</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="2">
												<div class="btn-group btn-group-justified" role="group"
													aria-label="...">
													<div class="btn-group" role="group">
														<button type="reset" class="btn btn-warning">Reset</button>
													</div>
													<div class="btn-group" role="group">
														<button type="submit" class="btn btn-primary">Filter</button>
													</div>
												</div>
											</td>

										</tr>
									</tfoot>
								</table>
							</form>
						</div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-12">
						<div class="list-group">
							<a href="#" class="list-group-item active">Filter By<span
								class="badge">Type</span></a>
							<form method="get"
								action="${pageContext.request.contextPath}/FilterServletTypeGet">
								<table class="table table-hover" id="table">

									<tbody>
										<tr>
											<td><fieldset class="form-group">
													<input type="radio" id="Notice" name="type" value="Notice">
													<label for="Notice"></label>
												</fieldset></td>
											<td><i class="fa fa-newspaper-o"></i> Notice</td>
										</tr>
										<tr>
											<td><fieldset class="form-group">
													<input type="radio" id="assignment" name="type"
														value="Assignment"> <label for="assignment"></label>
												</fieldset></td>
											<td><i class="fa fa-wpforms"></i> Assignment</td>
										</tr>
										<tr>
											<td><fieldset class="form-group">
													<input type="radio" id="event" name="type" value="Event">
													<label for="event"></label>
												</fieldset></td>
											<td><i class="fa fa-heartbeat"></i> Events</td>
										</tr>
										<tr>
											<td><fieldset class="form-group">
													<input type="radio" id="other" name="type" value="Others">
													<label for="other"></label>
												</fieldset></td>
											<td><i class="fa fa-twitch"></i> Others</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="2">
												<div class="btn-group btn-group-justified" role="group"
													aria-label="...">
													<div class="btn-group" role="group">
														<button type="reset" class="btn btn-warning">Reset</button>
													</div>
													<div class="btn-group" role="group">
														<button type="submit" class="btn btn-primary">Filter</button>
													</div>
												</div>
											</td>

										</tr>
									</tfoot>
								</table>
							</form>
						</div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-primary active">
							<div class="panel-heading">
								<h3 class="panel-title active">
									Select Dates &nbsp;<i class="fa fa-sliders"></i>
								</h3>
							</div>
							<div class="panel-body">
								<div class="input-group">
									<i class="fa fa-calendar-check-o"></i><label for="start_date">Start
										Date</label> <input type="date" class="form-control" id="start_date"
										name="start_date">
								</div>
								<div class="input-group">
									<i class="fa fa-calendar-check-o"></i><label for="end_date">End
										Date</label> <input type="date" class="form-control" id="end_date"
										name="end_date">
								</div>
							</div>
							<div class="panel-footer">
								<div class="btn-group btn-group-justified" role="group"
									aria-label="...">
									<div class="btn-group" role="group">
										<button type="button" class="btn btn-warning">Reset</button>
									</div>
									<div class="btn-group" role="group">
										<button type="button" class="btn btn-primary">Filter</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--date filter here-->
				</div>
				<br>
				<!--dropdown fliter-->

				<div class="dropdown-menu">
					<ul class="list-group">
						<li class="list-group-item"><span
							class="tag tag-default tag-pill pull-xs-right">14</span> Cras
							justo odio</li>
						<li class="list-group-item"><span
							class="tag tag-default tag-pill pull-xs-right">2</span> Dapibus
							ac facilisis in</li>
						<li class="list-group-item"><span
							class="tag tag-default tag-pill pull-xs-right">1</span> Morbi leo
							risus</li>
					</ul>
				</div>
			</div>

			<!--filter here-->
			<div class="vertical-line"></div>
			<div class="col-md-7 col-sm-7 col-xs-7">
				<div class="row">
					<div class="col-md-8">
						<h1 class="text-capitalize" id="title">
							<i class="fa fa-search"></i> Find the latest information here <i
								class="fa fa-hand-o-down"></i>
						</h1>
					</div>
					<div class="col-md-2 col-md-offset-1">
						<br>
						<%
							String FILTER = "none";
							String Trade_sort = null;
							String type_sort = null;
							if (request.getAttribute("IS_TRADE_FILTER_ON") != null) {
								Trade_sort = (String) request.getAttribute("IS_TRADE_FILTER_ON");
							}
							if (request.getAttribute("IS_TYPE_FILTER_ON") != null) {
								type_sort = (String) request.getAttribute("IS_TYPE_FILTER_ON");
							}
						%>
						<div class="dropdown">
							<button class="btn btn-primary dropdown-toggle" type="button"
								id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="true">
								Sort By <span class="caret"></span>
							</button>
							<ul class="dropdown-menu dropdown-menu-left"
								aria-labelledby="dropdownMenu1">
								<%
									if (request.getAttribute("IS_TRADE_FILTER_ON") != null) {
										Trade_sort = (String) request.getAttribute("IS_TRADE_FILTER_ON");
								%>
								<li><a href="${pageContext.request.contextPath}/FilterServletTradeGET?start=<%=(start)%>&trade=<%=Trade_sort%>&flag=false">Newest first</a></li>
								<li><a href="${pageContext.request.contextPath}/FilterServletTradeGET?start=<%=(start)%>&trade=<%=Trade_sort%>&flag=true">oldest first</a></li>
								<%
									} if (request.getAttribute("IS_TYPE_FILTER_ON") != null) {
										 
										type_sort = (String) request.getAttribute("IS_TYPE_FILTER_ON");
								%>
								<li><a href="${pageContext.request.contextPath}/FilterServletTypeGet?start=<%=(start)%>&type=<%=type_sort%>&flag=false">Newest first</a></li>
								<li><a href="${pageContext.request.contextPath}/FilterServletTypeGet?start=<%=(start)%>&type=<%=type_sort%>&flag=true">oldest first</a></li>
								<%
									}else{
								%>
							
							<li><a href="${pageContext.request.contextPath}/RedirectServlet?start=<%=(start)%>&type=<%=type_sort%>&flag=false">Newest first</a></li>
							<li><a href="${pageContext.request.contextPath}/RedirectServlet?start=<%=(start)%>&type=<%=type_sort%>&flag=true">oldest first</a></li>
							<%
								}
							%>

							</ul>
						</div>
					</div>
				</div>

				<!--Section: Blog v.3-->
				<!-- %%%%%%%%%%%%%%JAVA CODE HERE -->
				
				<section class="section extra-margins">
					<!--First row-->
					<%
						
						for (int i = (start * itemPerPage); i < Noticelist.size(); i++) {
							if (i == (start * itemPerPage) + itemPerPage) {
								break;
							}
							Boolean flag_trade = false;
							List<String> tradeName = new LinkedList<String>();
							Notice notice = new Notice();
							notice = (Notice) Noticelist.get(i);
							String thumbs = "fa-thumbs-down";
							if (notice.getAttachment() != null)
								if (notice.getAttachment().equalsIgnoreCase("yes")) {
									thumbs = "fa-thumbs-up";
								}
							for (Object user : Userlist) {
								User userobj = (User) user;
								if (notice.getUid() == (userobj.getUid())) {
									name = userobj.getName();
								}
							}
							for (Object trade : Tradelist) {
								Trade tradeobj = new Trade();
								tradeobj = (Trade) trade;
								if (tradeobj.getNID() == notice.getNid()) {
									flag_trade = true;
									tradeName.add(tradeobj.getTradeShort());
								}
							}
							//logic to get username for a particular notice
					%>
					<%
						Map<String, String> mapTradeFav = new HashMap<String, String>();
							mapTradeFav.put("Notice", "fa-newspaper-o");
							mapTradeFav.put("Assignment", "fa-wpforms");
							mapTradeFav.put("Event", "fa-heartbeat");
							mapTradeFav.put("Others", "fa-twitch");
							mapTradeFav.put("TE", "fa-black-tie");
							mapTradeFav.put("ECE", "fa-plug");
							mapTradeFav.put("AP", "fa-flask");
							mapTradeFav.put("ME", "fa-anchor");
							mapTradeFav.put("CE", "fa-fort-awesome");
					%>
					<div class="row block">

						<!--1 column-->
						<div class="col-md-12 ">
							<!--Excerpt-->
							<a href="#">
								<h5 class="<%=notice.getType()%> text-capitalize">
									<i class="fa <%=mapTradeFav.get(notice.getType())%> "></i>
									<%=notice.getType()%>
								</h5>
							</a>
							<%
								if (notice.getName() != null) {
							%>
							<h4 class="heading"><%=notice.getName()%></h4>
							<%
								}
							%>
							<div class="row trade-group">
								<%
									if (flag_trade == true) {
											for (String trade_short : tradeName) {
								%>
								<div class="col-md-2">
									<i class="fa <%=mapTradeFav.get(trade_short)%>"></i>
									<%=trade_short%>
								</div>

								<%
									}
										}
								%>


							</div>
							<div class="row text_top">
								<div class="col-md-2 ">
									<i class="fa fa-calendar"></i><span>&nbsp;<%=notice.getUpdated()%></span>
								</div>
								<div class="col-md-2 text-center">
									<i class="fa fa-user"></i><a href="#"
										class="techer_name teacher_link"><span> <%=name%></span></a>
								</div>


								<div class="col-md-3 text-center">
									<i class="fa fa-paperclip"></i> Attachments <i
										class="fa <%=thumbs%> fa-border" aria-hidden="true"></i>
								</div>
							</div>
							<p class="<%=notice.getType()%>-text"><%=notice.getMessage()%>
								<%
									if ((notice.getAttachment() != null) && (notice.getMessage() != null))
											if ((notice.getMessage().length() > 100) || notice.getAttachment().equalsIgnoreCase("yes")) {
								%><a href="#" class="readMore">...read more&nbsp;<i
									class="fa fa-plus-circle"></i>
								</a>
								<%
									}
								%><!-- this will only work if length is >100 or notice has attachments -->
							</p>

						</div>
						<!--/1 column-->

					</div>
					<br>
					<%
						}
						//end of for loop
					%>
					<!--/First row-->

					<hr>

				</section>
			</div>
			<div class="col-md-3 col-sm-3 col-xs-3">
				<div class="panel panel-primary">
					<div class="panel-heading text-center">
						<b>About Us</b>
					</div>
					<div class="panel-body">
						<p>With supporting text below as a natural lead-in to
							additional content.</p>
						<a class="btn btn-danger">Go somewhere</a>
					</div>
				</div>
				<!-- Nav tabs -->
				<ul class="nav nav-tabs md-pills pills-ins" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#panel11" role="tab"><i
							class="fa fa-user"></i> Profile</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#panel12" role="tab"><i class="fa fa-heart"></i> Follow</a>
					</li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#panel13" role="tab"><i class="fa fa-envelope"></i>
							Contact</a></li>
				</ul>

				<!-- Tab panels -->
				<div class="tab-content">

					<!--Panel 1-->
					<div class="tab-pane fade in active" id="panel11" role="tabpanel">
						<br>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Nihil odit magnam minima, soluta doloribus reiciendis molestiae
							placeat unde eos molestias. Quisquam aperiam, pariatur. Tempora,
							placeat ratione porro voluptate odit minima.</p>
					</div>
					<!--/.Panel 1-->

					<!--Panel 2-->
					<div class="tab-pane fade" id="panel12" role="tabpanel">
						<br>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Nihil odit magnam minima, soluta doloribus reiciendis molestiae
							placeat unde eos molestias. Quisquam aperiam, pariatur. Tempora,
							placeat ratione porro voluptate odit minima.</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Nihil odit magnam minima, soluta doloribus reiciendis molestiae
							placeat unde eos molestias. Quisquam aperiam, pariatur. Tempora,
							placeat ratione porro voluptate odit minima.</p>
					</div>
					<!--/.Panel 2-->

					<!--Panel 3-->
					<div class="tab-pane fade" id="panel13" role="tabpanel">
						<br>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Nihil odit magnam minima, soluta doloribus reiciendis molestiae
							placeat unde eos molestias. Quisquam aperiam, pariatur. Tempora,
							placeat ratione porro voluptate odit minima.</p>
					</div>
					<!--/.Panel 3-->

					<!--Panel 4-->
					<div class="tab-pane fade" id="panel14" role="tabpanel">
						<br>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Nihil odit magnam minima, soluta doloribus reiciendis molestiae
							placeat unde eos molestias. Quisquam aperiam, pariatur. Tempora,
							placeat ratione porro voluptate odit minima.</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Nihil odit magnam minima, soluta doloribus reiciendis molestiae
							placeat unde eos molestias. Quisquam aperiam, pariatur. Tempora,
							placeat ratione porro voluptate odit minima.</p>
					</div>
					<!--/.Panel 4-->

				</div>
			</div>

		</div>
	</div>
	<!--pagination-->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<%
					String PAGINATION_FILTER = "none";
					if (request.getAttribute("PAGINATION_FILTER") != null) {
						PAGINATION_FILTER = (String) request.getAttribute("PAGINATION_FILTER");
					}
					String Trade = null;
					String type = null;
					if (request.getAttribute("IS_TRADE_FILTER_ON") != null) {
						Trade = (String) request.getAttribute("IS_TRADE_FILTER_ON");
					}
					if (request.getAttribute("IS_TYPE_FILTER_ON") != null) {
						type = (String) request.getAttribute("IS_TYPE_FILTER_ON");
						System.out.println("SIZE of noticeLIST at home in type is" + Noticelist.size());
					}
				%>
				<jsp:include page="Pagination.jsp" flush="true">
					<jsp:param value="<%=start%>" name="start" />
					<jsp:param value="<%=Trade%>" name="trade" />
					<jsp:param value="<%=type%>" name="type" />
					<jsp:param value="<%=keyInt%>" name="keyInt" />
					<jsp:param value="<%=PAGINATION_FILTER%>" name="PAGINATION_FILTER" />
				</jsp:include>

			</div>
		</div>
	</div>
	<footer>
		<div class="row">

			<!--First column-->
			<div class="col-md-4">
				<h5 class="text-center">About Us</h5>
				<p>Here you can use rows and columns here to organize your
					footer content.</p>
			</div>
			<!--/.First column-->

			<!--Second column-->
			<div class="col-md-4">
				<h5 class="text-center">Important Links</h5>
				<ul>
					<li><a href="#!">Link 1</a></li>
					<li><a href="#!">Link 2</a></li>
					<li><a href="#!">Link 3</a></li>
					<li><a href="#!">Link 4</a></li>
				</ul>
			</div>
			<div class="col-md-4">
				<h5 class="text-center">Find Us</h5>

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
