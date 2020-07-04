package com.auct.model;


import java.sql.Timestamp;

//競標區VO
public class AuctVO implements java.io.Serializable{
	private String auct_id;
	private String sale_id;
	private String buy_id;
	private String pt_id;
	private String auct_name;
	private Timestamp auct_start;
	private Timestamp auct_end;
	private Integer marketPrice;
	private Integer initPrice;
	private Integer auct_inc;
	private Integer maxPrice;
	private String auct_desc;
	private byte[] auct_pic;
	private Integer auct_sold;
	private Integer auct_down;
	private String ordstat_id;
	private Timestamp ord_time;
	private Timestamp pay_end;
	private String rcpt_name;
	private String rcpt_cel;
	private String rcpt_add;
	
	
	public String getAuct_id() {
		return auct_id;
	}
	public void setAuct_id(String auct_id) {
		this.auct_id = auct_id;
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
	public String getAuct_name() {
		return auct_name;
	}
	public void setAuct_name(String auct_name) {
		this.auct_name = auct_name;
	}
	public Timestamp getAuct_start() {
		return auct_start;
	}
	public void setAuct_start(Timestamp auct_start) {
		this.auct_start = auct_start;
	}
	public Timestamp getAuct_end() {
		return auct_end;
	}
	public void setAuct_end(Timestamp auct_end) {
		this.auct_end = auct_end;
	}
	public Integer getMarketPrice() {
		return marketPrice;
	}
	public void setMarketPrice(Integer marketPrice) {
		this.marketPrice = marketPrice;
	}
	public Integer getInitPrice() {
		return initPrice;
	}
	public void setInitPrice(Integer initPrice) {
		this.initPrice = initPrice;
	}
	public Integer getAuct_inc() {
		return auct_inc;
	}
	public void setAuct_inc(Integer auct_inc) {
		this.auct_inc = auct_inc;
	}
	public Integer getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(Integer maxPrice) {
		this.maxPrice = maxPrice;
	}
	public String getAuct_desc() {
		return auct_desc;
	}
	public void setAuct_desc(String auct_desc) {
		this.auct_desc = auct_desc;
	}
	public byte[] getAuct_pic() {
		return auct_pic;
	}
	public void setAuct_pic(byte[] auct_pic) {
		this.auct_pic = auct_pic;
	}
	public Integer getAuct_sold() {
		return auct_sold;
	}
	public void setAuct_sold(Integer auct_sold) {
		this.auct_sold = auct_sold;
	}
	public Integer getAuct_down() {
		return auct_down;
	}
	public void setAuct_down(Integer auct_down) {
		this.auct_down = auct_down;
	}
	public String getOrdstat_id() {
		return ordstat_id;
	}
	public void setOrdstat_id(String ordstat_id) {
		this.ordstat_id = ordstat_id;
	}
	public Timestamp getOrd_time() {
		return ord_time;
	}
	public void setOrd_time(Timestamp ord_time) {
		this.ord_time = ord_time;
	}
	public Timestamp getPay_end() {
		return pay_end;
	}
	public void setPay_end(Timestamp pay_end) {
		this.pay_end = pay_end;
	}
	public String getRcpt_name() {
		return rcpt_name;
	}
	public void setRcpt_name(String rcpt_name) {
		this.rcpt_name = rcpt_name;
	}
	public String getRcpt_cel() {
		return rcpt_cel;
	}
	public void setRcpt_cel(String rcpt_cel) {
		this.rcpt_cel = rcpt_cel;
	}
	public String getRcpt_add() {
		return rcpt_add;
	}
	public void setRcpt_add(String rcpt_add) {
		this.rcpt_add = rcpt_add;
	}
	
	

}
