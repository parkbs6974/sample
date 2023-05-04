package com.mystudy.ajax.vo;

import java.sql.Date;

public class AdminVO {
	String id;
	String pw;
	String name;
	String email;
	Date regdate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "AdminVO [id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email + ", regdate=" + regdate
				+ "]";
	}
	
	
}
