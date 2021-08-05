package com.kh.dodamPj.vo;

import java.sql.Timestamp;

public class CustomerBoardVo {
	private int cb_no;
	private String cb_title;
	private String cb_content;
	private String user_id;
	private Timestamp cb_regdate;
	private int cb_count;
	private int re_group;
	private int re_seq;
	private int re_level;
	private String reply;
	
	public CustomerBoardVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CustomerBoardVo(int cb_no, String cb_title, String cb_content, String user_id, Timestamp cb_regdate,
			int cb_count, int re_group, int re_seq, int re_level, String reply) {
		super();
		this.cb_no = cb_no;
		this.cb_title = cb_title;
		this.cb_content = cb_content;
		this.user_id = user_id;
		this.cb_regdate = cb_regdate;
		this.cb_count = cb_count;
		this.re_group = re_group;
		this.re_seq = re_seq;
		this.re_level = re_level;
		this.reply = reply;
	}

	public int getCb_no() {
		return cb_no;
	}

	public void setCb_no(int cb_no) {
		this.cb_no = cb_no;
	}

	public String getCb_title() {
		return cb_title;
	}

	public void setCb_title(String cb_title) {
		this.cb_title = cb_title;
	}

	public String getCb_content() {
		return cb_content;
	}

	public void setCb_content(String cb_content) {
		this.cb_content = cb_content;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Timestamp getCb_regdate() {
		return cb_regdate;
	}

	public void setCb_regdate(Timestamp cb_regdate) {
		this.cb_regdate = cb_regdate;
	}

	public int getCb_count() {
		return cb_count;
	}

	public void setCb_count(int cb_count) {
		this.cb_count = cb_count;
	}

	public int getRe_group() {
		return re_group;
	}

	public void setRe_group(int re_group) {
		this.re_group = re_group;
	}

	public int getRe_seq() {
		return re_seq;
	}

	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}

	public int getRe_level() {
		return re_level;
	}

	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	@Override
	public String toString() {
		return "CustomerBoardVo [cb_no=" + cb_no + ", cb_title=" + cb_title + ", cb_content=" + cb_content
				+ ", user_id=" + user_id + ", cb_regdate=" + cb_regdate + ", cb_count=" + cb_count + ", re_group="
				+ re_group + ", re_seq=" + re_seq + ", re_level=" + re_level + ", reply=" + reply + "]";
	}

}
