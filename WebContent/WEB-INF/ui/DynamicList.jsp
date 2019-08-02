
<%@page import="com.jnnotice.model.Trade"%>
<%@page import="com.jnnotice.model.User"%>
<%@page import="com.jnnotice.model.Notice"%>
<%@page import="com.jnnotice.bo.HomeNoticeBo"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jnnotice.*"%>
<%
	String name = null;
	Map<String, List<Object>> map = new HashMap<String, List<Object>>();
	HomeNoticeBo obj = new HomeNoticeBo();
// 	map = obj.selectNotice();
	List<Object> Noticelist = new LinkedList<Object>();
	List<Object> Userlist = new LinkedList<Object>();
	List<Object> Tradelist = new LinkedList<Object>();
	List<Object> NIDlist = new LinkedList<Object>();
	Noticelist = map.get("NOTICELIST");
	Userlist = map.get("USERLIST");
	Tradelist = map.get("TRADELIST");
	NIDlist = map.get("NIDLIST");
	System.out.println(Noticelist);
	System.out.println(Userlist);
	System.out.println(Tradelist);
	System.out.println(NIDlist);
%><!-- end of java code -->
<section class="section extra-margins">
	<!--First row-->
	<%
		for (int i = 0; i < Noticelist.size(); i++) {
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