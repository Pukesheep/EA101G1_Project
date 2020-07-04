package com.favpost.model;

public class FavpostVO implements java.io.Serializable {

	private static final long serialVersionUID = 2310355540162774670L;
	
	private String mem_id;
	private String post_id;
	
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	public String getMem_id() {
		return mem_id;
	}
	
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	
	public String getPost_id() {
		return post_id;
	}
	
}
