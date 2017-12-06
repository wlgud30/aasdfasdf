package com.login.dto;

import java.util.Date;

public class LoginDto {

	private int no;
	private String id;
	private String pw;
	private String name;
	private String nikname;
	private String email;
	private String phone;
	private String addr;
	private String subaddr;
	private String grade;
	private String enabled;
	private Date lastdate;
	
	
	
	public LoginDto(String id, String pw, String name, String nikname, String email, String phone, String addr,
			String subaddr) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nikname = nikname;
		this.email = email;
		this.phone = phone;
		this.addr = addr;
		this.subaddr = subaddr;
	}

	
	public LoginDto(int no, String grade) {
		super();
		this.no = no;
		this.grade = grade;
	}

	public LoginDto() {
		super();
	}
	
	public LoginDto(int no, String pw, String email, String phone, String addr, String subaddr) {
		super();
		this.no = no;
		this.pw = pw;
		this.email = email;
		this.phone = phone;
		this.addr = addr;
		this.subaddr = subaddr;
	}


	public LoginDto(int no, String id, String pw, String name, String nikname, String email, String phone, String addr,
			String subaddr, String grade, String enabled, Date lastdate) {
		super();
		this.no = no;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nikname = nikname;
		this.email = email;
		this.phone = phone;
		this.addr = addr;
		this.subaddr = subaddr;
		this.grade = grade;
		this.enabled = enabled;
		this.lastdate = lastdate;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
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
	public String getNikname() {
		return nikname;
	}
	public void setNikname(String nikname) {
		this.nikname = nikname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getSubaddr() {
		return subaddr;
	}
	public void setSubaddr(String subaddr) {
		this.subaddr = subaddr;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	public Date getLastdate() {
		return lastdate;
	}
	public void setLastdate(Date lastdate) {
		this.lastdate = lastdate;
	}
	
	
}
