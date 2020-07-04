package com.immed.model;

import java.sql.Timestamp;

public class ImmedVO implements java.io.Serializable {
	private String immed_id;
	private String sale_id;
	private String buy_id;
	private String pt_id;
	private String immed_name;
	private Timestamp immed_start;
	private Integer immed_prc;
	private byte[] immed_pic;
	private String immed_desc;
	private Integer immed_sold;
	private Integer immed_down;
	private Timestamp ord_time;
	private String ordstat_id;
	private String rcpt_name;
	private String rcpt_cell;
	private String rcpt_add;

	public String getImmed_id() {
		return immed_id;
	}

	public void setImmed_id(String immed_id) {
		this.immed_id = immed_id;
	}

	public String getSale_id() {
		return sale_id;
	}

	public void setSale_id(String sale_id) {
		this.sale_id = sale_id;
	}

	public String getBuy_id() {
		return buy_id;
	}

	public void setBuy_id(String buy_id) {
		this.buy_id = buy_id;
	}

	public String getPt_id() {
		return pt_id;
	}

	public void setPt_id(String pt_id) {
		this.pt_id = pt_id;
	}

	public String getImmed_name() {
		return immed_name;
	}

	public void setImmed_name(String immed_name) {
		this.immed_name = immed_name;
	}

	public Timestamp getImmed_start() {
		return immed_start;
	}

	public void setImmed_start(Timestamp immed_start) {
		this.immed_start = immed_start;
	}

	public Integer getImmed_prc() {
		return immed_prc;
	}

	public void setImmed_prc(Integer immed_prc) {
		this.immed_prc = immed_prc;
	}

	public byte[] getImmed_pic() {
		return immed_pic;
	}

	public void setImmed_pic(byte[] immed_pic) {
		this.immed_pic = immed_pic;
	}

	public String getImmed_desc() {
		return immed_desc;
	}

	public void setImmed_desc(String immed_desc) {
		this.immed_desc = immed_desc;
	}

	public Integer getImmed_sold() {
		return immed_sold;
	}

	public void setImmed_sold(Integer immed_sold) {
		this.immed_sold = immed_sold;
	}

	public Integer getImmed_down() {
		return immed_down;
	}

	public void setImmed_down(Integer immed_down) {
		this.immed_down = immed_down;
	}

	public Timestamp getOrd_time() {
		return ord_time;
	}

	public void setOrd_time(Timestamp ord_time) {
		this.ord_time = ord_time;
	}

	public String getOrdstat_id() {
		return ordstat_id;
	}

	public void setOrdstat_id(String ordstat_id) {
		this.ordstat_id = ordstat_id;
	}

	public String getRcpt_name() {
		return rcpt_name;
	}

	public void setRcpt_name(String rcpt_name) {
		this.rcpt_name = rcpt_name;
	}

	public String getRcpt_cell() {
		return rcpt_cell;
	}

	public void setRcpt_cell(String rcpt_cell) {
		this.rcpt_cell = rcpt_cell;
	}

	public String getRcpt_add() {
		return rcpt_add;
	}

	public void setRcpt_add(String rcpt_add) {
		this.rcpt_add = rcpt_add;
	}

	public ImmedVO() {
		super();
	}

}
