package com.jnnotice.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import com.jnnotice.db.ConnectionManager;
import com.jnnotice.model.Attachment;
import com.jnnotice.model.Notice;
import com.jnnotice.model.Trade;
import com.jnnotice.model.User;

public class DaoNotice {
	public static int addNotice(Notice notice, LinkedList<Attachment> list, List<Trade> tradelist, User user)
			throws SQLException {

		// logic to check attachment is present or not
		String is_attachment = null;
		System.out.println("size of list is" + list.size());
		if (list.isEmpty()) {
			is_attachment = "no";
			System.out.println("list of attachments in dao notice is empty");
		} else {
			is_attachment = "yes";
		}
		Connection conn = null;
		PreparedStatement preStmt = null;
		int noOfRowsInserted = 0;

		try {
			int pk = 0;
			int uid = user.getUid();
			conn = ConnectionManager.getConnection();
			preStmt = conn.prepareStatement(
					"insert into notice(UID,heading,MESSAGE,IS_ATTACHEMENT,TYPE,IS_TIMED,START_DATE,END_DATE,ACTIVE,CREATED,UPDATED) values (?,?,?,?,?,?,?,?,'yes',now(),now())",
					Statement.RETURN_GENERATED_KEYS);
			java.sql.Date sqlDate = null, sqlDateend = null;
			if (notice.isIs_timed().equalsIgnoreCase("yes")) {
				java.util.Date utilDateStart = notice.getStart_date();// bug is here that
																		// same
																		// date
																		// is
																		// feed
																		// to db
																		// all
																		// the
																		// time
				sqlDate = new java.sql.Date(utilDateStart.getTime());
				java.util.Date utilDateend = notice.getEnd_date();
				sqlDateend = new java.sql.Date(utilDateend.getTime());
				// System.out.println("we are in notice dao layer and dates
				// added to db are"+notice.getStart_date()+"
				// "+notice.getEnd_date());
			}
			preStmt.setInt(1, uid);
			preStmt.setString(2, notice.getName());
			preStmt.setString(3, notice.getMessage());
			preStmt.setString(4, is_attachment);
			preStmt.setString(5, notice.getType());
			preStmt.setString(6, notice.isIs_timed());
			preStmt.setDate(7, sqlDate);
			preStmt.setDate(8, sqlDateend);
			noOfRowsInserted = preStmt.executeUpdate();

			ResultSet rs = preStmt.getGeneratedKeys();
			if (rs.next()) {
				pk = rs.getInt(1);
			}
			if (!tradelist.isEmpty()) {
				for (Trade li : tradelist) {
					preStmt = conn.prepareStatement(
							"insert into trade(NID,TRADE_SHORT,TRADE_NAME,ACTIVE,CREATED,UPDATED) values(?,?,?,'yes',now(),now());",
							Statement.RETURN_GENERATED_KEYS);
					preStmt.setInt(1, pk);
					preStmt.setString(2, li.getTradeShort());
					preStmt.setString(3, li.getTradeFull());
					noOfRowsInserted = preStmt.executeUpdate();
				}
			} // we also put a check if the trade list we are getting from user
				// is empty or not
			// code to save attachments in db
			if (is_attachment.equalsIgnoreCase("yes")) {
				System.out.println("here we find attachments are there true");
				for (Attachment li : list) {
					InputStream file;
					String fileName, contentType;
					fileName = li.getFileName();
					contentType = li.getContentType();
					file = li.getFile();
					preStmt = conn.prepareStatement(
							"insert into notice_attachemnt (nid,FILE_NAME,CONTENT_TYPE,FILE,CREATED,UPDATED) values (?,?,?,?,now(),now())",
							Statement.RETURN_GENERATED_KEYS);
					preStmt.setInt(1, pk);
					preStmt.setString(2, fileName);
					preStmt.setString(3, contentType);
					preStmt.setBinaryStream(4, file);
					noOfRowsInserted = preStmt.executeUpdate();
				}
			} // end of upload
				// code to save trade information in DB

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

}// end of add notice
