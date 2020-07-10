package com.groupBuy.model;

import java.sql.Timestamp;

public class GroupBuyVO implements java.io.Serializable {

	public static final Integer OPEN_STATUS = 0;
	public static final Integer STANDARD_STATUS = 1;
	public static final Integer CLOSE_STATUS = 2;

	private String gro_Id;
	private String p_Id;
	private String reb1_No;
	private String reb2_No;
	private String reb3_No;
	private Timestamp start_Date;
	private Timestamp end_Date;
	private Integer grotime_Date;
	private Integer status;
	private String people;
	private Integer money;
//
	public String getGro_Id() {
		return gro_Id;
	}

	public void setGro_Id(String gro_Id) {
		this.gro_Id = gro_Id;
	}

	public String getP_Id() {
		return p_Id;
	}

	public void setP_Id(String p_Id) {
		this.p_Id = p_Id;
	}

	public String getReb1_No() {
		return reb1_No;
	}

	public void setReb1_No(String reb1_No) {
		this.reb1_No = reb1_No;
	}

	public String getReb2_No() {
		return reb2_No;
	}

	public void setReb2_No(String reb2_No) {
		this.reb2_No = reb2_No;
	}

	public String getReb3_No() {
		return reb3_No;
	}

	public void setReb3_No(String reb3_No) {
		this.reb3_No = reb3_No;
	}

	public Timestamp getStart_Date() {
		return start_Date;
	}

	public void setStart_Date(Timestamp start_Date) {
		this.start_Date = start_Date;
	}

	public Timestamp getEnd_Date() {
		return end_Date;
	}

	public void setEnd_Date(Timestamp end_Date) {
		this.end_Date = end_Date;
	}

	public Integer getGrotime_Date() {
		return grotime_Date;
	}

	public void setGrotime_Date(Integer grotime_Date) {
		this.grotime_Date = grotime_Date;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}
//
}