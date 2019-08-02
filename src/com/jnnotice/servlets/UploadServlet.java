package com.jnnotice.servlets;

import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.constants.IConstants;
import com.jnnotice.bo.Bonotice;
import com.jnnotice.model.Attachment;
import com.jnnotice.model.Notice;
import com.jnnotice.model.Trade;
import com.jnnotice.model.User;

@WebServlet("/UploadServlet")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB
public class UploadServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String Name;
	String type;
	String message;
	String trade;
	String check_timed;
	String Start_date;
	String end_date;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map<String, String> map = new HashMap<String, String>();
		LinkedList<Attachment> list = new LinkedList<Attachment>();
		// code to get user from session object so to map notice with user who added it
		HttpSession session = request.getSession(false);
		User user=new User();
		user=(User) session.getAttribute(IConstants.SESSION_USER);
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (!isMultipart) {// gets values of text fields
		} else {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = null;
			try {
				items = (List) upload.parseRequest(request);
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
			Iterator<Throwable> itr = ((Iterable<Throwable>) items).iterator();
			while (itr.hasNext()) {
				FileItem item = (FileItem) itr.next();
				if (item.isFormField()) {
					  String name = item.getFieldName();
					    String value = item.getString();
					map.put(item.getFieldName(), item.getString());
				
				} else {
					try {
						Attachment attachment = new Attachment();
						attachment.setFileName(item.getName());
						attachment.setFile(item.getInputStream());
						attachment.setContentType(item.getContentType());
						if(!item.getContentType().equalsIgnoreCase("application/octet-stream")){
						list.add(attachment);
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}

			}

		} // end of upload code
		try {
			Notice notice = new Notice();
			notice.setName(map.get("name"));
			notice.setType(map.get("genre"));
			notice.setMessage(map.get("message"));
			notice.setIs_timed(map.get("check_timed"));
			if ((notice.isIs_timed().equalsIgnoreCase("yes"))) {
				Start_date = map.get("start_date");
				end_date = map.get("end_date");
				Date start = null;
				Date end = null;
			
				SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-mm-dd");
				try {
					start = formatter1.parse(Start_date);
					end = formatter1.parse(end_date);
					notice.setStart_date(start);
					notice.setEnd_date(end);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			List<Trade> tradelist = new LinkedList<Trade>();
			
			String[] tradeArray = { "ECE", "ME", "CE", "TE" };//array of the trades from trade table 
			for (String tradeName : tradeArray) {
				if(map.get(tradeName)!=null){//check to ensure value is present for trade
				if (!map.get(tradeName).isEmpty()) {
					Trade obj = new Trade();
					obj.setTradeShort(tradeName);
					obj.setTradeFull(tradeName);
					System.out.println(obj.getTradeFull());
					tradelist.add(obj);
				}
				}
			}

			Bonotice.addNotice(notice, list, tradelist,user);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
