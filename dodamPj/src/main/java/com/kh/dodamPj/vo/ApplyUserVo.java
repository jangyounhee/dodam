package com.kh.dodamPj.vo;

public class ApplyUserVo {
	private int au_no;
	private int ad_no;
	private String user_name;
	private String user_tel;
	private String adopt_date;
	private String adopt_time;
	private String form_title;
	private String form_content;
	private String form_pw;
	private String user_id;
	
	public ApplyUserVo() {
		super();
	}

	public ApplyUserVo(int au_no, int ad_no, String user_id, String user_name, String user_tel, String adopt_date, 
			String adopt_time, String form_title, String form_content, String form_pw) {
		super();
		this.au_no = au_no;
		this.ad_no = ad_no;
		this.user_id = user_id;		
		this.user_name = user_name;
		this.user_tel = user_tel;
		this.adopt_date = adopt_date;
		this.adopt_time = adopt_time;
		this.form_title = form_title;
		this.form_content = form_content;
		this.form_pw = form_pw;
	}

	public int getAu_no() {
		return au_no;
	}

	public void setAu_no(int au_no) {
		this.au_no = au_no;
	}

	public int getAd_no() {
		return ad_no;
	}

	public void setAd_no(int ad_no) {
		this.ad_no = ad_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public String getAdopt_date() {
		return adopt_date;
	}

	public void setAdopt_date(String adopt_date) {
		this.adopt_date = adopt_date;
	}

	public String getAdopt_time() {
		return adopt_time;
	}

	public void setAdopt_time(String adopt_time) {
		this.adopt_time = adopt_time;
	}

	public String getForm_title() {
		return form_title;
	}

	public void setForm_title(String form_title) {
		this.form_title = form_title;
	}

	public String getForm_content() {
		return form_content;
	}

	public void setForm_content(String form_content) {
		this.form_content = form_content;
	}

	public String getForm_pw() {
		return form_pw;
	}

	public void setForm_pw(String form_pw) {
		this.form_pw = form_pw;
	}

	@Override
	public String toString() {
		return "ApplyUserVo [au_no=" + au_no + ", ad_no=" + ad_no + ", user_name=" + user_name + ", user_tel="
				+ user_tel + ", adopt_date=" + adopt_date + ", adopt_time=" + adopt_time + ", form_title=" + form_title
				+ ", form_content=" + form_content + ", form_pw=" + form_pw + ", user_id=" + user_id + "]";
	}

}
