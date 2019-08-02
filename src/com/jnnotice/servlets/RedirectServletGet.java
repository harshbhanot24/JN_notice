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

@WebServlet("/RedirectServletGet")
public class RedirectServletGet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RedirectServletGet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HomeNoticeBo obj=new HomeNoticeBo();
		Map<String, List<Object>> map=new HashMap<String, List<Object>>();
		try {		
			map=obj.selectNotice(null);
//			System.out.println(map);
			System.out.println("try is done in redirect servlet");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("MAP", map);
		String index=(String) request.getParameter("index");
		String max=(String)request.getAttribute("max");
		System.out.println("index at servlet is"+index);
		request.setAttribute("index",index);
		request.setAttribute("PAGINATION_FILTER","HOMEGET");
		request.getRequestDispatcher("WEB-INF/ui/home.jsp").forward(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
