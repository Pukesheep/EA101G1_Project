package com.ptype.model;

public class PtypeVO implements java.io.Serializable {

	private static final long serialVersionUID = 863461475089768994L;
	
	private Integer ptype_id;
	private String type;
	
	public void setPtype_id(Integer ptype_id) {
		this.ptype_id = ptype_id;
	}
	
	public Integer getPtype_id() {
		return ptype_id;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getType() {
		return type;
	}
}
