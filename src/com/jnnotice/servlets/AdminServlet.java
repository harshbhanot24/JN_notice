package com.jnnotice.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.constants.IConstants;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet({ "/adminHome", "/adminHomePost" })
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		if (session != null) {
			// fetch data from DB now
			
			
			String alertFlag = (String) session.getAttribute(IConstants.ALERT_FLAG);

			if (alertFlag != null && alertFlag.length() > 0) {
				session.removeAttribute(IConstants.ALERT_FLAG);
				request.setAttribute(IConstants.ALERT_FLAG, alertFlag);
			}

			request.getRequestDispatcher("WEB-INF/ui/admin.jsp").forward(request, response);
		}
		else{
			response.sendRedirect(request.getContextPath() + "/loginServlet");
		}
		

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
