package com.jnnotice.db;

import java.sql.DriverManager;

import com.mysql.jdbc.Connection;

public class ConnectionManager {

	private ConnectionManager() {
	}

	public static Connection getConnection() {
		Connection conection = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/jn_notice", "root", "root");
			conection.setAutoCommit(false);
		} catch (Exception e) {
			e.printStackTrace();

		}
		return conection;
	}

}
