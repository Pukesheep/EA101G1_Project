package com.CustomerMessage.model;

import java.sql.Timestamp;


public class CustomerMessageVO implements java.io.Serializable{
	private String cm_id;
	private Timestamp cm_time;
	private String cm_word;
	private byte[] cm_pic;
	private Integer cm_status;
	private String cm_customerid;
	

	public CustomerMessageVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public String getCm_id() {
		return cm_id;
	}


	public void setCm_id(String cm_id) {
		this.cm_id = cm_id;
	}


	public Timestamp getCm_time() {
		return cm_time;
	}


	public void setCm_time(Timestamp cm_time) {
		this.cm_time = cm_time;
	}


	public String getCm_word() {
		return cm_word;
	}


	public void setCm_word(String cm_word) {
		this.cm_word = cm_word;
	}


	public byte[] getCm_pic() {
		return cm_pic;
	}


	public void setCm_pic(byte[] cm_pic) {
		this.cm_pic = cm_pic;
	}


	public Integer getCm_status() {
		return cm_status;
	}


	public void setCm_status(Integer cm_status) {
		this.cm_status = cm_status;
	}


	public String getCm_customerid() {
		return cm_customerid;
	}


	public void setCm_customerid(String cm_customerid) {
		this.cm_customerid = cm_customerid;
	}
	
}
