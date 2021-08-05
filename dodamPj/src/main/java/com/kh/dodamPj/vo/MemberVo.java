package com.kh.dodamPj.vo;

public class MemberVo {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_email;
	private String phoneNum;
	private int user_birth;
	private int auth_level;
	private String user_pw2;
	
	public MemberVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MemberVo(String user_id, String user_pw, String user_name, String user_email, String phoneNum,
			int user_birth, int auth_level, String user_pw2) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_email = user_email;
		this.phoneNum = phoneNum;
		this.user_birth = user_birth;
		this.auth_level = auth_level;
		this.user_pw2 = user_pw2;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public int getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(int user_birth) {
		this.user_birth = user_birth;
	}
	public int getAuth_level() {
		return auth_level;
	}
	public void setAuth_level(int auth_level) {
		this.auth_level = auth_level;
	}
	public String getUser_pw2() {
		return user_pw2;
	}
	public void setUser_pw2(String user_pw2) {
		this.user_pw2 = user_pw2;
	}
	@Override
	public String toString() {
		return "MemberVo [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_email="
				+ user_email + ", phoneNum=" + phoneNum + ", user_birth=" + user_birth + ", auth_level=" + auth_level
				+ ", user_pw2=" + user_pw2 + "]";
	}
	
	
	
	
}
