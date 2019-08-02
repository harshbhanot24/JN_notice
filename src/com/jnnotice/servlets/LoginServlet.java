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

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/ui/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userName = request.getParameter("email");
		String password = request.getParameter("password");
		BoUser boUser = new BoUser();
		
		try {
			User user = null;
			user = boUser.validateUser(userName, password);
			System.out.println(user);
			if (user != null) {
				if (user.getEmail().equals(userName) && user.getPassword().equals(password)) {
					HttpSession session = request.getSession(true);
					session.setAttribute(IConstants.SESSION_USER, user);
		
					if (user.getType().equalsIgnoreCase(IConstants.USER_TYPE_ADMIN)) {
						response.sendRedirect(request.getContextPath()+"/adminHome");
					} else {
						request.getRequestDispatcher("WEB-INF/ui/faculty.jsp").forward(request, response);
					}
				} else {
					request.getRequestDispatcher("WEB-INF/ui/login.jsp").forward(request, response);
				}

			} else {
				request.getRequestDispatcher("WEB-INF/ui/login.jsp").forward(request, response);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
