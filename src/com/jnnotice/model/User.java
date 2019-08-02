package com.jnnotice.model;

import java.util.Date;

public class User {
	private String  name, email, password, trade, type, active;
	private Date created, updated;
	int uid;
	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Date getUpdated() {
		return updated;
	}



	public void setUpdated(Date updated) {
		this.updated = updated;
	}

	public User() {
	}

	public User(String name, String email, String password, String trade, String type, String active, Date created,
			Date updated) {
		this.name = name;
		this.email = email;
		this.password = password;
		this.trade = trade;
		this.type = type;
		this.active = active;
		this.created = created;
		this.updated = updated;
	}

	public User(String name, String email, String password, String trade, String type, String active) {
		this.name = name;
		this.email = email;
		this.password = password;
		this.trade = trade;
		this.type = type;
		this.active = active;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [name=" + name + ", email=" + email + ", password=" + password + ", trade=" + trade + ", type="
				+ type + ", active=" + active + "]";
	}

	public String getTrade() {
		return trade;
	}

	public void setTrade(String trade) {
		this.trade = trade;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
