package com.comm.model;

import java.sql.*;

public class CommVO implements java.io.Serializable {

	private static final long serialVersionUID = 8685702443507920045L;

	private String comm_id;
	private String post_id;
	private String mem_id;
	private Integer c_status;
	private String c_text;
	private java.sql.Timestamp last_edit;
	private java.sql.Timestamp post_time;
	
	public void setComm_id(String comm_id) {
		this.comm_id = comm_id;
	}
	
	public String getComm_id() {
		return comm_id;
	}
	
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	
	public String getPost_id() {
		return post_id;
	}
	
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	public String getMem_id() {
		return mem_id;
	}
	
	public void setC_status(Integer c_status) {
		this.c_status = c_status;
	}
	
	public Integer getC_status() {
		return c_status;
	}
	
	public void setC_text(String c_text) {
		this.c_text = c_text;
	}
	
	public String getC_text() {
		return c_text;
	}
	
	public void setLast_edit(Timestamp last_edit) {
		this.last_edit = last_edit;
	}
	
	public Timestamp getLast_edit() {
		return last_edit;
	}
	
	public void setPost_time(Timestamp post_time) {
		this.post_time = post_time;
	}
	
	public Timestamp getPost_time() {
		return post_time;
	}
	
}
