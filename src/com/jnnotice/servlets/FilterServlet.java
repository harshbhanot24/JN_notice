package com.jnnotice.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jnnotice.bo.HomeNoticeBo;

@WebServlet({ "/FilterServletTypeGet", "/FilterServletPost" })
public class FilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		static String flag_global="desc";
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FilterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		String flag = request.getParameter("flag");
		if(flag!=null){
			if(flag.equalsIgnoreCase("true")){
				flag_global="asc";
			}else{
				flag_global="desc";
			}
		}
		String query = "select notice.NID as NNID,notice.UID as NUID,user.UID as UserID,notice.HEADING,notice.MESSAGE,notice.IS_ATTACHEMENT,notice.`TYPE`,notice.IS_TIMED,notice.START_DATE,notice.END_DATE,notice.UPDATED,notice.ACTIVE as nactive,user.NAME as Uname,user.TID as UTID,user.active as uactive from notice,user where user.UID=notice.UID  and(";
		String queryEnd = ")order by notice.UPDATED "+flag_global;
		query = query + "notice.`TYPE`=" + "'" + type + "'" + queryEnd;
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^"+query);
		HomeNoticeBo obj = new HomeNoticeBo();
		Map<String, List<Object>> map = new HashMap<String, List<Object>>();
		try {
			map = obj.selectNotice(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String index = (String) request.getParameter("start");
		if (index != null)
			request.setAttribute("index", index);// to give index to pagination											// system
		else
			request.setAttribute("index", null);
		request.setAttribute("MAP", map);
		request.setAttribute("PAGINATION_FILTER", "TYPEGET");
		request.setAttribute("IS_TYPE_FILTER_ON",type);//to get trade value again for pagination
		request.getRequestDispatcher("WEB-INF/ui/home.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}