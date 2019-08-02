package com.jnnotice.bo;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import com.jnnotice.dao.DaoNotice;
import com.jnnotice.model.Attachment;
import com.jnnotice.model.Notice;
import com.jnnotice.model.Trade;
import com.jnnotice.model.User;

public class Bonotice {

	public static int addNotice(Notice notice, LinkedList<Attachment> list, List<Trade> tradelist, User user)
			throws ParseException {
	
		int noOfrow = 0;
		try {
			
			noOfrow = DaoNotice.addNotice(notice, list,tradelist,user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return noOfrow;
	}
}