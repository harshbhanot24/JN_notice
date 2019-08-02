package com.jnnotice.bo;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.jnnotice.dao.HomeNoticedao;
import com.jnnotice.model.Notice;

public class HomeNoticeBo {
	
public Map<String, List<Object>> selectNotice(String query) throws SQLException{
	HomeNoticedao homeNoticedao=new HomeNoticedao (); 
	Map<String, List<Object>> map=new HashMap<String, List<Object>>();
	
	map=homeNoticedao.selectNotice(query);

	return map;
	
	
}

}
