package com.jnnotice.bo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jnnotice.dao.DaoUser;
import com.jnnotice.model.User;

public class BoUser {
	List<User> liJn = new ArrayList<User>();

	@Override
	public String toString() {
		return "BoUser [getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}

	public BoUser() {
		// TODO Auto-generated constructor stub
	}

	public static int add(User userparam) throws SQLException {
		User user = new User();
		user = userparam;
		DaoUser jndoa = new DaoUser();
		int count = jndoa.add(user);
		return count;
	}

	public User validateUser(String userName, String password) throws SQLException {
		DaoUser daoUser = new DaoUser();
		User user = daoUser.validateUser(userName, password);

		return user;
	}

	public  List<User> user_table() throws SQLException {
		DaoUser daoUser = new DaoUser();
		liJn = daoUser.user_table();
		
		return liJn;

	}

}
