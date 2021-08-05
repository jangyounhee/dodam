package com.kh.dodamPj.vo;

import java.util.Arrays;

public class AnimalVo {
	private int a_no;
	private String a_species;
	private String a_color;
	private String a_gender;
	private String a_age;
	private String a_weight;
	private String a_findplace;
	private String a_enterdate;
	private String a_neut;
	private String a_character;
	private String[] files;
	private String a_picture;
	private String a_state;
	
	public AnimalVo() {
		super();
	}

	public AnimalVo(int a_no, String a_species, String a_gender, String a_findplace, String a_picture) {
		super();
		this.a_no = a_no;
		this.a_species = a_species;
		this.a_gender = a_gender;
		this.a_findplace = a_findplace;
		this.a_picture = a_picture;
	}

	public int getA_no() {
		return a_no;
	}

	public void setA_no(int a_no) {
		this.a_no = a_no;
	}

	public String getA_species() {
		return a_species;
	}

	public void setA_species(String a_species) {
		this.a_species = a_species;
	}

	public String getA_color() {
		return a_color;
	}

	public void setA_color(String a_color) {
		this.a_color = a_color;
	}

	public String getA_gender() {
		return a_gender;
	}

	public void setA_gender(String a_gender) {
		this.a_gender = a_gender;
	}

	public String getA_age() {
		return a_age;
	}

	public void setA_age(String a_age) {
		this.a_age = a_age;
	}

	public String getA_weight() {
		return a_weight;
	}

	public void setA_weight(String a_weight) {
		this.a_weight = a_weight;
	}

	public String getA_findplace() {
		return a_findplace;
	}

	public void setA_findplace(String a_findplace) {
		this.a_findplace = a_findplace;
	}

	public String getA_enterdate() {
		return a_enterdate;
	}

	public void setA_enterdate(String a_enterdate) {
		this.a_enterdate = a_enterdate;
	}

	public String getA_neut() {
		return a_neut;
	}

	public void setA_neut(String a_neut) {
		this.a_neut = a_neut;
	}

	public String getA_character() {
		return a_character;
	}

	public void setA_character(String a_character) {
		this.a_character = a_character;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	public String getA_picture() {
		return a_picture;
	}

	public void setA_picture(String a_picture) {
		this.a_picture = a_picture;
	}

	public String getA_state() {
		return a_state;
	}

	public void setA_state(String a_state) {
		this.a_state = a_state;
	}

	@Override
	public String toString() {
		return "AnimalVo [a_no=" + a_no + ", a_species=" + a_species + ", a_color=" + a_color + ", a_gender=" + a_gender
				+ ", a_age=" + a_age + ", a_weight=" + a_weight + ", a_findplace=" + a_findplace + ", a_enterdate="
				+ a_enterdate + ", a_neut=" + a_neut + ", a_character=" + a_character + ", files="
				+ Arrays.toString(files) + ", a_picture=" + a_picture + ", a_state=" + a_state + "]";
	}
	
}
