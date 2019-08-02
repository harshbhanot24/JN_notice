package com.jnnotice.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.constants.IConstants;
import com.jnnotice.bo.BoUser;
import com.jnnotice.model.User;

@WebServlet({ "/adminAddUser", "/adminAddUserPost" })
public class AdminAddUserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public AdminAddUserServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("WEB-INF/ui/admin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		if (session != null) {
			
			String name, email, password, trade, type;
			name = request.getParameter("name");
			email = request.getParameter("email");
			password = request.getParameter("password");
			trade = request.getParameter("trade");
			type = request.getParameter("type");
			User user = new User(name, email, password, trade, type, "yes");
			System.out.println("we are in user add servlet"+user);
			String alertFlag;
			try {
				BoUser.add(user);
				alertFlag = IConstants.ALERT_SUCCESS;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				alertFlag = IConstants.ALERT_ERROR;
			}

			session.setAttribute(IConstants.ALERT_FLAG, alertFlag);
			response.sendRedirect(request.getContextPath() + "/adminHome");
		}
		else{
			response.sendRedirect(request.getContextPath() + "/loginServlet");
		}

		
	}

}
