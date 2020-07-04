package com.adm.model;

public class AdmVO implements java.io.Serializable {
	
	private String adm_no;
	private String adm_acco;
	private String adm_pass;
	private String adm_name;
	private Integer adm_state;

	public AdmVO() {
	 super();
}

	public String getAdm_no() {
		return adm_no;
	}

	public void setAdm_no(String adm_no) {
		this.adm_no = adm_no;
	}

	public String getAdm_acco() {
		return adm_acco;
	}

	public void setAdm_acco(String adm_acco) {
		this.adm_acco = adm_acco;
	}

	public String getAdm_pass() {
		return adm_pass;
	}

	public void setAdm_pass(String adm_pass) {
		this.adm_pass = adm_pass;
	}

	public String getAdm_name() {
		return adm_name;
	}

	public void setAdm_name(String adm_name) {
		this.adm_name = adm_name;
	}

	public Integer getAdm_state() {
		return adm_state;
	}

	public void setAdm_state(Integer adm_state) {
		this.adm_state = adm_state;
	}
	
}
