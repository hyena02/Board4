package com.green.user.dto;

public class UserDTO {
//Field
	private String userid;
	private String passwd;
	private String username;
	private String email;
	private int    upoint;
	private String regdate;
//기본 생성자 추가
	public UserDTO() {}
	
	public UserDTO(String userid, String passwd, String username, String email, int upoint, String regdate) {
		this.userid = userid;
		this.passwd = passwd;
		this.username = username;
		this.email = email;
		this.upoint = upoint;
		this.regdate = regdate;
	}
//getter
	public String getUserid() {return userid;}
	public String getPasswd() {return passwd;}
	public String getUsername() {return username;}
	public String getEmail() {return email;}
	public int getUpoint() {return upoint;}
	public String getRegdate() {return regdate;}
//setter
	public void setUserid(String userid) {this.userid = userid;}
	public void setPasswd(String passwd) {this.passwd = passwd;}
	public void setUsername(String username) {this.username = username;}
	public void setEmail(String email) {this.email = email;}
	public void setUpoint(int upoint) {this.upoint = upoint;}
	public void setRegdate(String regdate) {this.regdate = regdate;}

	@Override
	public String toString() {
		return "userDTO [userid=" + userid + ", passwd=" + passwd + ", username=" + username + ", email=" + email
				+ ", upoint=" + upoint + ", regdate=" + regdate + "]";
	}
}
