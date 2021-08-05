package com.kh.dodamPj.vo;

import java.sql.Timestamp;
import java.util.Arrays;

public class NoticeVo {
	private int n_no;
	private String n_title;
	private String n_content;
	private Timestamp n_date;
	private int n_readcount;
	private int n_group;
	private int n_seq;
	private int n_level;
	private String n_filepath;
	private String n_pic;

	// 첨부파일
	private String[] files;

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}
	public NoticeVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NoticeVo(int n_no, String n_title, String n_content, Timestamp n_date, int n_readcount, int n_group,
			int n_seq, int n_level, String n_filepath, String n_pic, String[] files) {
		super();
		this.n_no = n_no;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_date = n_date;
		this.n_readcount = n_readcount;
		this.n_group = n_group;
		this.n_seq = n_seq;
		this.n_level = n_level;
		this.n_filepath = n_filepath;
		this.n_pic = n_pic;
		this.files = files;
	}

	public int getN_no() {
		return n_no;
	}

	public void setN_no(int n_no) {
		this.n_no = n_no;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public Timestamp getN_date() {
		return n_date;
	}

	public void setN_date(Timestamp n_date) {
		this.n_date = n_date;
	}

	public int getN_readcount() {
		return n_readcount;
	}

	public void setN_readcount(int n_readcount) {
		this.n_readcount = n_readcount;
	}

	public int getN_group() {
		return n_group;
	}

	public void setN_group(int n_group) {
		this.n_group = n_group;
	}

	public int getN_seq() {
		return n_seq;
	}

	public void setN_seq(int n_seq) {
		this.n_seq = n_seq;
	}

	public int getN_level() {
		return n_level;
	}

	public void setN_level(int n_level) {
		this.n_level = n_level;
	}

	public String getN_filepath() {
		return n_filepath;
	}

	public void setN_filepath(String n_filepath) {
		this.n_filepath = n_filepath;
	}


	public String getN_pic() {
		return n_pic;
	}

	public void setN_pic(String n_pic) {
		this.n_pic = n_pic;
	}

	@Override
	public String toString() {
		return "NoticeVo [n_no=" + n_no + ", n_title=" + n_title + ", n_content=" + n_content + ", n_date=" + n_date
				+ ", n_readcount=" + n_readcount + ", n_group=" + n_group + ", n_seq=" + n_seq + ", n_level=" + n_level
				+ ", n_filepath=" + n_filepath + ", n_pic=" + n_pic + ", files=" + Arrays.toString(files) + "]";
	}
	
	
}
