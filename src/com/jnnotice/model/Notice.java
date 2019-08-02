package com.jnnotice.model;

import java.util.Date;

public class Notice {

	@Override
	public String toString() {
		return "Notice [type=" + type + ", name=" + name + ", message=" + message + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", is_timed=" + is_timed + ", attachment=" + attachment + ", nid=" + nid
				+ "]";
	}

	String type, name, message;
	Date start_date, end_date;
	Date updated;

	public Date getUpdated() {
		return updated;
	}

	public void setUpdated(Date updated) {
		this.updated = updated;
	}

	String is_timed;
	String attachment;
	int nid, uid;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getNid() {
		return nid;
	}

	public void setNid(int nid) {
		this.nid = nid;
	}

	public String getAttachment() {
		return attachment;
	}

	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}

	public String getIs_timed() {
		return is_timed;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public String isIs_timed() {
		return is_timed;
	}

	public void setIs_timed(String is_timed) {
		this.is_timed = is_timed;
	}

}
