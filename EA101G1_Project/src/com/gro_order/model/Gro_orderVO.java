package com.gro_order.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Gro_orderVO implements Serializable{
//private String gro_Id;
	private String ord_Id;
	private String mem_Id;
	private String ordstat_Id;
	private String gro_Id;
	private Timestamp add_Date;
	public String getOrd_Id() {
		return ord_Id;
	}
	public void setOrd_Id(String ord_Id) {
		this.ord_Id = ord_Id;
	}
	public String getMem_Id() {
		return mem_Id;
	}
	public void setMem_Id(String mem_Id) {
		this.mem_Id = mem_Id;
	}
	public String getOrdstat_Id() {
		return ordstat_Id;
	}
	public void setOrdstat_Id(String ordstat_Id) {
		this.ordstat_Id = ordstat_Id;
	}
	public String getGro_Id() {
		return gro_Id;
	}
	public void setGro_Id(String gro_Id) {
		this.gro_Id = gro_Id;
	}
	public Timestamp getAdd_Date() {
		return add_Date;
	}
	public void setAdd_Date(Timestamp add_Date) {
		this.add_Date = add_Date;
	}
	

	
}
