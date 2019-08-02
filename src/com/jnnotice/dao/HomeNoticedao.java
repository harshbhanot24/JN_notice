package com.jnnotice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.jnnotice.db.ConnectionManager;
import com.jnnotice.model.Notice;
import com.jnnotice.model.Trade;
import com.jnnotice.model.User;

public class HomeNoticedao {

	public Map<String, List<Object>> selectNotice(String query) throws SQLException {
		Map<String, List<Object>> map = new HashMap<String, List<Object>>();
		int count = 0;
		String queryFinal="select notice.NID as NNID,notice.UID as NUID,user.UID as UserID,notice.HEADING,notice.MESSAGE,notice.IS_ATTACHEMENT,notice.`TYPE`,notice.IS_TIMED,notice.START_DATE,notice.END_DATE,notice.UPDATED,notice.ACTIVE as nactive,user.NAME as Uname,user.TID as UTID,user.active as uactive from notice,user where user.UID=notice.UID order by notice.UPDATED desc ";
		if(query!=null){
			queryFinal=query;
	}//custum query code
		List<Object> list = new LinkedList<Object>();
		List<Object> Userlist = new LinkedList<Object>();
		List<Object> Tradelist = new LinkedList<Object>();
		List<Object> NIDlist = new LinkedList<Object>();
		Connection conn = null;
		PreparedStatement preStmt = null;
		PreparedStatement preStmtUser = null;
		try {

			conn = ConnectionManager.getConnection();
			preStmt = conn.prepareStatement(queryFinal,Statement.RETURN_GENERATED_KEYS);

			ResultSet rs = preStmt.executeQuery();
			while (rs.next()) {				
				// condition to check if user and notice is active or not also
				// if it is within prescribed dates
				if ((rs.getString("nactive").equalsIgnoreCase("yes"))
						&& rs.getString("uactive").equalsIgnoreCase("yes")) {
					int UID = rs.getInt("UTID");
					User user = new User();
					NIDlist.add(rs.getInt("NNID"));//this may not be needed if yes then remove iTTTTT
					
					Notice notice = new Notice();
					notice.setUid(rs.getInt("NUID"));
					notice.setUpdated(rs.getDate("UPDATED"));
					notice.setNid(rs.getInt("NNID"));
					notice.setName(rs.getString("HEADING"));
					notice.setMessage(rs.getString("MESSAGE"));
					notice.setType(rs.getString("TYPE"));
					notice.setIs_timed(rs.getString("IS_TIMED"));
					if (notice.isIs_timed().equalsIgnoreCase("yes")) {
						notice.setEnd_date(rs.getDate("END_DATE"));
						notice.setStart_date(rs.getDate("START_DATE"));
					}
					if (rs.getString("IS_ATTACHEMENT").equalsIgnoreCase("YES")) {
						notice.setAttachment("YES");
					}
					Date date = new Date();
					user.setName(rs.getString("Uname"));
					user.setUid(rs.getInt("UserID"));
					// to add trade value to the user
					if (UID == 1) {
						user.setTrade("ECE");
					}
					if (UID == 2) {
						user.setTrade("ME");
					}
					if (UID == 3) {
						user.setTrade("CE");
					}
					if (UID == 4) {
						user.setTrade("TE");
					}
					if (UID == 5) {
						user.setTrade("AP");
					}
					Userlist.add(user);
					if (notice.getIs_timed().equalsIgnoreCase("yes")) {
						if ((date.compareTo(notice.getStart_date()) >= 0)
								&& date.compareTo(notice.getEnd_date()) <= 0) {
							list.add(notice);
						}
					} // check if date is timed or not
					else {

						list.add(notice);
						count++;

					}
				}
				System.out.println("count of notices is" + count);

			} // end of while loop to add list
			
				preStmtUser = conn.prepareStatement(
						"select trade.TRADE_SHORT,trade.NID,trade.TRADE_NAME,trade.ACTIVE from trade,notice where trade.NID=notice.NID");
			
			ResultSet rsTrade = preStmtUser.executeQuery();
			while (rsTrade.next()) {
				Trade trade = new Trade();
				trade.setTradeShort(rsTrade.getString("TRADE_SHORT"));
				trade.setNID(rsTrade.getInt("NID"));
				trade.setTradeFull(rsTrade.getString("TRADE_SHORT"));
				if(rsTrade.getString("ACTIVE").equalsIgnoreCase("yes")){
					trade.setActive(true);
				}
				Tradelist.add(trade);
			} // end of for loop
			map.put("NOTICELIST", list);
			map.put("TRADELIST", Tradelist);
			map.put("USERLIST", Userlist);
			map.put("NIDLIST",NIDlist);
			preStmt.close();
			preStmtUser.close();
			conn.commit();

		} // end of try block
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			conn.rollback();
		} finally {
			conn.close();

		}

		return map;
	}

}
