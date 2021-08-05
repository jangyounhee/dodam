package com.kh.dodamPj.vo;

public class VolunteerVo {

	private int v_no;
	private String user_id;
	private String v_name;
	private int v_age;
	private String v_place;
	private String v_phonenum;
	private String v_email;
	private String v_time;
	private String v_date;
	private String v_etc;
	
	public VolunteerVo() {
		super();
		
	}
	
	public VolunteerVo(int v_no, String user_id, String v_name, int v_age, String v_place, String v_phonenum,
			String v_email, String v_time, String v_date, String v_etc) {
		super();
		this.v_no = v_no;
		this.user_id = user_id;
		this.v_name = v_name;
		this.v_age = v_age;
		this.v_place = v_place;
		this.v_phonenum = v_phonenum;
		this.v_email = v_email;
		this.v_time = v_time;
		this.v_date = v_date;
		this.v_etc = v_etc;
	}
	
	public int getV_no() {
		return v_no;
	}
	public void setV_no(int v_no) {
		this.v_no = v_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getV_name() {
		return v_name;
	}
	public void setV_name(String v_name) {
		this.v_name = v_name;
	}
	public int getV_age() {
		return v_age;
	}
	public void setV_age(int v_age) {
		this.v_age = v_age;
	}
	public String getV_place() {
		return v_place;
	}
	public void setV_place(String v_place) {
		this.v_place = v_place;
	}
	public String getV_phonenum() {
		return v_phonenum;
	}
	public void setV_phonenum(String v_phonenum) {
		this.v_phonenum = v_phonenum;
	}
	public String getV_email() {
		return v_email;
	}
	public void setV_email(String v_email) {
		this.v_email = v_email;
	}
	public String getV_time() {
		return v_time;
	}
	public void setV_time(String v_time) {
		this.v_time = v_time;
	}
	public String getV_date() {
		return v_date;
	}
	public void setV_date(String v_date) {
		this.v_date = v_date;
	}
	public String getV_etc() {
		return v_etc;
	}
	public void setV_etc(String v_etc) {
		this.v_etc = v_etc;
	}
	
	@Override
	public String toString() {
		return "VolunteerVo [v_no=" + v_no + ", user_id=" + user_id + ", v_name=" + v_name + ", v_age=" + v_age
				+ ", v_place=" + v_place + ", v_phonenum=" + v_phonenum + ", v_email=" + v_email + ", v_time=" + v_time
				+ ", v_date=" + v_date + ", v_etc=" + v_etc + "]";
	}
	
}
