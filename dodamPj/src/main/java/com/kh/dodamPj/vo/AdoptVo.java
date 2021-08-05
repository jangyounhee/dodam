package com.kh.dodamPj.vo;

import java.util.Arrays;

public class AdoptVo {
	private int ad_no;
	private String ad_adoptstate;
	private String ad_species;
	private String ad_kind;
	private String ad_gender;
	private String ad_age;
	private String ad_weight;
	private String ad_color;
	private String ad_findplace;
	private String ad_resqueday;
	private String ad_adoptpossible;
	private String[] files;
	private String ad_etc;
	private String ad_picture;
	
	public AdoptVo() {
		super();
	}

	public AdoptVo(int ad_no,String ad_adoptstate, String ad_species, String ad_kind, String ad_gender, String ad_age,
			String ad_picture) {
		super();
		this.ad_no = ad_no;
		this.ad_adoptstate = ad_adoptstate;
		this.ad_species = ad_species;
		this.ad_kind = ad_kind;
		this.ad_gender = ad_gender;
		this.ad_age = ad_age;
		this.ad_picture = ad_picture;
	}

	public int getAd_no() {
		return ad_no;
	}

	public void setAd_no(int ad_no) {
		this.ad_no = ad_no;
	}
	
	public String getAd_adoptstate() {
		return ad_adoptstate;
	}

	public void setAd_adoptstate(String ad_adoptstate) {
		this.ad_adoptstate = ad_adoptstate;
	}

	public String getAd_species() {
		return ad_species;
	}

	public void setAd_species(String ad_species) {
		this.ad_species = ad_species;
	}

	public String getAd_kind() {
		return ad_kind;
	}

	public void setAd_kind(String ad_kind) {
		this.ad_kind = ad_kind;
	}

	public String getAd_gender() {
		return ad_gender;
	}

	public void setAd_gender(String ad_gender) {
		this.ad_gender = ad_gender;
	}

	public String getAd_age() {
		return ad_age;
	}

	public void setAd_age(String ad_age) {
		this.ad_age = ad_age;
	}

	public String getAd_weight() {
		return ad_weight;
	}

	public void setAd_weight(String ad_weight) {
		this.ad_weight = ad_weight;
	}

	public String getAd_color() {
		return ad_color;
	}

	public void setAd_color(String ad_color) {
		this.ad_color = ad_color;
	}

	public String getAd_findplace() {
		return ad_findplace;
	}

	public void setAd_findplace(String ad_findplace) {
		this.ad_findplace = ad_findplace;
	}

	public String getAd_resqueday() {
		return ad_resqueday;
	}

	public void setAd_resqueday(String ad_resqueday) {
		this.ad_resqueday = ad_resqueday;
	}

	public String getAd_adoptpossible() {
		return ad_adoptpossible;
	}

	public void setAd_adoptpossible(String ad_adoptpossible) {
		this.ad_adoptpossible = ad_adoptpossible;
	}

	public String getAd_etc() {
		return ad_etc;
	}

	public void setAd_etc(String ad_etc) {
		this.ad_etc = ad_etc;
	}

	public String getAd_picture() {
		return ad_picture;
	}

	public void setAd_picture(String ad_picture) {
		this.ad_picture = ad_picture;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	@Override
	public String toString() {
		return "AdoptVo [ad_no=" + ad_no + ", ad_adoptstate=" + ad_adoptstate + ", ad_species=" + ad_species
				+ ", ad_kind=" + ad_kind + ", ad_gender=" + ad_gender + ", ad_age=" + ad_age + ", ad_weight="
				+ ad_weight + ", ad_color=" + ad_color + ", ad_findplace=" + ad_findplace + ", ad_resqueday="
				+ ad_resqueday + ", ad_adoptpossible=" + ad_adoptpossible + ", files=" + Arrays.toString(files)
				+ ", ad_etc=" + ad_etc + ", ad_picture=" + ad_picture + "]";
	}
	
}
