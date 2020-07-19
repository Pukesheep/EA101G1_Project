package com.favImmed.model;

import java.io.Serializable;

public class FavImmedVO implements Serializable{
	private String immed_id;
	private String mem_id;
	
	public FavImmedVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getImmed_id() {
		return immed_id;
	}
	public void setImmed_id(String immed_id) {
		this.immed_id = immed_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	
}
