<!-- this is pagination jsp for using same home page for filter So pagination will be different -->
<%@page import="com.jnnotice.model.Notice"%>
<%@page import="java.text.DecimalFormat"%>
<% 
String trade=(String)request.getParameter("trade");
//for trade filter to implement	
String type=(String)request.getParameter("type");//for type filter to implement	
String startString=request.getParameter("start");
String PAGINATION_FILTER=(String)request.getParameter("PAGINATION_FILTER");
			int start=0;
		if ( startString!= null) {
			DecimalFormat decimalFormat = new DecimalFormat();
			start = decimalFormat.parse(startString).intValue();
			System.out.println("The value of start at"+PAGINATION_FILTER+" jsp is" + start);
		}
		int keyInt=0;
		String keyString=(String)request.getParameter("keyInt");//with JSP include always use getParameter
		if(keyString!=null){
			DecimalFormat decimalFormat = new DecimalFormat();
			keyInt = decimalFormat.parse(keyString).intValue();
			System.out.println("The value of KEYINT at pagination jsp is" + keyInt);
			
		}
		%>
<nav id="page" aria-label="Page navigation">

	<ul class="pagination">
		<%
							if (start == 0) {
						%>
		<li class="page-item disabled">
			<%
								} else {
							%>
		
		<li class="page-item ">
			<%
								}
							%> <% if(PAGINATION_FILTER.equalsIgnoreCase("TYPEGET") && start!=0){ %> <a
			href="${pageContext.request.contextPath}/FilterServletTypeGet?start=<%=(start-1)%>&type=<%=type %>"
			aria-label="Previous"><span aria-hidden="true">&laquo;</span>
				</a> <%}
			if((PAGINATION_FILTER.equalsIgnoreCase("TRADEGET")) && start!=0){
			%> <a
				href="${pageContext.request.contextPath}/FilterServletTradeGET?start=<%=(start-1)%>&trade=<%=trade %>"
				aria-label="Previous"><span aria-hidden="true">&laquo;</span>
				</a> <%}
			if((PAGINATION_FILTER.equalsIgnoreCase("none")) && start!=0){
			%> <a
					href="${pageContext.request.contextPath}/RedirectServlet?start=<%=(start-1) %>"
					aria-label="Previous"><span aria-hidden="true">&laquo;</span>
				</a> <%} %> 
		</li>
		<%
							
							for (int i = 1; i <= keyInt; i++) {
						%>
		<%
							if (i == start+1) {
						%>
		<li class="page-item active">
			<%
								} else {
							%>
		
		<li class="page-item ">
			<%
								}
							%> <% if(PAGINATION_FILTER.equalsIgnoreCase("TYPEGET")){ %> <a
			href="${pageContext.request.contextPath}/FilterServletTypeGet?start=<%=(i-1)%>&type=<%=type %>"><%=i %>
		</a> <%}
			if((PAGINATION_FILTER.equalsIgnoreCase("TRADEGET"))){
			%> <a
			href="${pageContext.request.contextPath}/FilterServletTradeGET?start=<%=i-1 %>&trade=<%=trade%>"><%=i %>
		</a> <%}
			if((PAGINATION_FILTER.equalsIgnoreCase("none"))){
			%> <a
			href="${pageContext.request.contextPath}/RedirectServlet?start=<%=i-1 %>"><%=i %>
		</a> <%} %>
		</li>
		<%
							}
						%>


		<% 	if (start+1 < keyInt) {
							%>
		<li class="page-item">
			<%
								
							%> <% if(PAGINATION_FILTER.equalsIgnoreCase("TYPEGET") && (start+1!= keyInt)){ %> <a
			href="${pageContext.request.contextPath}/FilterServletTypeGet?start=<%=(start+1)%>&type=<%=type %>"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span>
		</a> <%}
			if((PAGINATION_FILTER.equalsIgnoreCase("TRADEGET")) && (start+1!= keyInt)){
			%> <a
			href="${pageContext.request.contextPath}/FilterServletTradeGET?start=<%=(start+1)%>&trade=<%=trade %>"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span>
		</a> <%}
			if((PAGINATION_FILTER.equalsIgnoreCase("none")) && (start+1!= keyInt)){
			%> <a
			href="${pageContext.request.contextPath}/RedirectServlet?start=<%=(start+1) %>"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span>
		</a> <%}
			} %>
		</li>
	</ul>
</nav>