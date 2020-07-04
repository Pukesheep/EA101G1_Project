package com.bid.model;

import java.sql.Timestamp;

public class BidVO implements java.io.Serializable{
	private String bid_id;
	private String auct_id;
	private String buy_id;
	private Integer bid_prc;
	private Timestamp bid_time;
	private Integer bid_win;
	
	
	public String getBid_id() {
		return bid_id;
	}
	public void setBid_id(String bid_id) {
		this.bid_id = bid_id;
	}
	public String getAuct_id() {
		return auct_id;
	}
	public void setAuct_id(String auct_id) {
		this.auct_id = auct_id;
	}
	public String getBuy_id() {
		return buy_id;
	}
	public void setBuy_id(String buy_id) {
		this.buy_id = buy_id;
	}
	public Integer getBid_prc() {
		return bid_prc;
	}
	public void setBid_prc(Integer bid_prc) {
		this.bid_prc = bid_prc;
	}
	public Timestamp getBid_time() {
		return bid_time;
	}
	public void setBid_time(Timestamp bid_time) {
		this.bid_time = bid_time;
	}
	public Integer getBid_win() {
		return bid_win;
	}
	public void setBid_win(Integer bid_win) {
		this.bid_win = bid_win;
	}
	
	
}
