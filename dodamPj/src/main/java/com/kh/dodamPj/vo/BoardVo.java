package com.kh.dodamPj.vo;

import java.sql.Timestamp;
import java.util.Arrays;

public class BoardVo {
	private int b_no;
	private String b_title;
	private String b_content;
	private String user_id;
	private Timestamp b_regdate;
	private int b_count;
	private int re_group;
	private int re_seq;
	private int re_level;
	private int comment_cnt;
	private String b_picture;
	private String[] files;
	private String file_name;
	
	public BoardVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardVo(int b_no, String b_title, String b_content, String user_id, Timestamp b_regdate, int b_count,
			int re_group, int re_seq, int re_level, int comment_cnt, String b_picture, String[] files,
			String file_name) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_content = b_content;
		this.user_id = user_id;
		this.b_regdate = b_regdate;
		this.b_count = b_count;
		this.re_group = re_group;
		this.re_seq = re_seq;
		this.re_level = re_level;
		this.comment_cnt = comment_cnt;
		this.b_picture = b_picture;
		this.files = files;
		this.file_name = file_name;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Timestamp getB_regdate() {
		return b_regdate;
	}

	public void setB_regdate(Timestamp b_regdate) {
		this.b_regdate = b_regdate;
	}

	public int getB_count() {
		return b_count;
	}

	public void setB_count(int b_count) {
		this.b_count = b_count;
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

	public int getComment_cnt() {
		return comment_cnt;
	}

	public void setComment_cnt(int comment_cnt) {
		this.comment_cnt = comment_cnt;
	}

	public String getB_picture() {
		return b_picture;
	}

	public void setB_picture(String b_picture) {
		this.b_picture = b_picture;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	@Override
	public String toString() {
		return "BoardVo [b_no=" + b_no + ", b_title=" + b_title + ", b_content=" + b_content + ", user_id=" + user_id
				+ ", b_regdate=" + b_regdate + ", b_count=" + b_count + ", re_group=" + re_group + ", re_seq=" + re_seq
				+ ", re_level=" + re_level + ", comment_cnt=" + comment_cnt + ", b_picture=" + b_picture + ", files="
				+ Arrays.toString(files) + ", file_name=" + file_name + "]";
	}


}
