package com.oto.model;

import java.sql.Timestamp;

public class OtoVO implements java.io.Serializable{
	private String cr_id;
	private String user_one;
	private String user_two;
	private Timestamp cr_time;
	private String cr_word;
	private byte[] cr_pic;
	private Integer cr_status;
	
	
	public OtoVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public String getCr_id() {
		return cr_id;
	}


	public void setCr_id(String cr_id) {
		this.cr_id = cr_id;
	}


	public String getUser_one() {
		return user_one;
	}


	public void setUser_one(String user_one) {
		this.user_one = user_one;
	}


	public String getUser_two() {
		return user_two;
	}


	public void setUser_two(String user_two) {
		this.user_two = user_two;
	}


	public Timestamp getCr_time() {
		return cr_time;
	}


	public void setCr_time(Timestamp cr_time) {
		this.cr_time = cr_time;
	}


	public String getCr_word() {
		return cr_word;
	}


	public void setCr_word(String cr_word) {
		this.cr_word = cr_word;
	}


	public byte[] getCr_pic() {
		return cr_pic;
	}


	public void setCr_pic(byte[] cr_pic) {
		this.cr_pic = cr_pic;
	}


	public Integer getCr_status() {
		return cr_status;
	}


	public void setCr_status(Integer cr_status) {
		this.cr_status = cr_status;
	}
	
	

}
