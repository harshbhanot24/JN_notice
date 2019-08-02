package com.jnnotice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.jnnotice.db.ConnectionManager;
import com.jnnotice.model.User;

public class DaoUser {
	private String name, email, password, trade, type;
	List<User> liJn = new ArrayList<User>();

	public DaoUser() {
		// TODO Auto-generated constructor stub
	}

	public int add(User userparam) throws SQLException {
		User user = new User();
		user = userparam;
		name = user.getName();
		email = user.getEmail();
		password = user.getPassword();
		trade = user.getTrade();
		type = user.getType();
		Connection conn = null;
		PreparedStatement preStmt = null;
		int noOfRowsInserted = 0;

		try {
			int pk;
			conn = ConnectionManager.getConnection();
			preStmt = conn.prepareStatement(
					"insert into user(name,email,password,URID,TID,active,created,updated) values(?,?,?,?,?,?,now(),now());",
					Statement.RETURN_GENERATED_KEYS);
			preStmt.setString(1, name);
			preStmt.setString(2, email);
			preStmt.setString(3, password);
			preStmt.setString(4, type);
			preStmt.setString(5, trade);
			preStmt.setString(6, "yes");;
			noOfRowsInserted = preStmt.executeUpdate();

			ResultSet rs = preStmt.getGeneratedKeys();
			if (rs.next()) {
				pk = rs.getInt(1);
			}

			// Other insert pk

			preStmt.close();

			conn.commit();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			conn.rollback();
		} finally {
			conn.close();

		}

		return noOfRowsInserted;
	}

	public User validateUser(String userName, String password) throws SQLException {

		User user = null;
		PreparedStatement preStmt = null;
		Connection conn = ConnectionManager.getConnection();
		preStmt = conn.prepareStatement(
				"select u.uid, ur.urid,ur.role as userRole, u.tid,u.name,u.email, u.password, u.active as Uactive from user u, user_role ur where u.urid=ur.urid and u.EMAIL=? and password=? and u.active ='yes'");
		preStmt.setString(1, userName);
		preStmt.setString(2, password);

		ResultSet rs = preStmt.executeQuery();

		if (rs != null) {
			while (rs.next()) {
				User uservalidated = new User();
				uservalidated.setPassword(rs.getString("password"));
				uservalidated.setEmail(rs.getString("email"));
				uservalidated.setType(rs.getString("userRole"));
				uservalidated.setUid(rs.getInt("uid"));
				uservalidated.setActive(rs.getString("Uactive"));
				System.out.println("Hy here when we validat our user his uid is"+ uservalidated.getUid());
				return uservalidated;
			}
		}
		return user;
	}

	public List<User> user_table() throws SQLException {
		int count = 0;
		PreparedStatement preStmt = null;
		Connection conn = ConnectionManager.getConnection();
		preStmt = conn.prepareStatement(
				"select ur.role,u.UID as UserID,u.name,u.email,u.password,t.trade_short,u.active,u.created,u.updated from user u,user_role ur,trade t where u.TID=t.TID and u.URID=ur.URID;");
		ResultSet rs = preStmt.executeQuery();
		while (rs.next()) {
			User user = new User();
			user.setUid(rs.getInt("UserID"));
			user.setName(rs.getString("u.name"));
			user.setEmail(rs.getString("u.email"));
			user.setPassword(rs.getString("u.password"));
			user.setTrade(rs.getString("t.trade_short"));
			user.setActive(rs.getString("u.active"));
			user.setType(rs.getString("ur.role"));
			user.setCreated(rs.getTimestamp("u.created"));
			user.setUpdated(rs.getTimestamp("u.updated"));
			liJn.add(user);
			
		}

		return liJn;
	}
}
