package com.rebate.model;

public class RebateVO implements java.io.Serializable{
	
	private String reb_No;
	private Integer discount;
	private String  people;
	public String getReb_No() {
		return reb_No;
	}
	public void setReb_No(String reb_No) {
		this.reb_No = reb_No;
	}
	public Integer getDiscount() {
		return discount;
	}
	public void setDiscount(Integer discount) {
		this.discount = discount;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	


}