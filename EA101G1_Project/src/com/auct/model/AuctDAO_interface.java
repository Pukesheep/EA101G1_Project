package com.auct.model;

import java.util.List;
import java.util.Set;

import com.bid.model.BidVO;

public interface AuctDAO_interface {
	// 新增/修改/查詢---競標商品
	public void insert_auct(AuctVO auctVO);
	public void update_auct(AuctVO auctVO);
	public AuctVO listOneAuct(String auct_id);
	public List<AuctVO> getAll(); //只有取出表格前半部
	
	//賣家查詢自己上架的商品
	public List<AuctVO> getAllByMem(String sale_id);
	
	//查詢該商品，對應的出價
	public Set<BidVO> getBidsBy_auctId(String auct_id);
	
	//修改上下架狀態
	public void update_auct_down(AuctVO auctVO);
	
	//修改售出狀態
	public void update_auct_sold(AuctVO auctVO);
		
	//更新得標者
	public void update_winner(AuctVO auctVO);
	//更新訂單狀態
	public void update_ordstat_id(AuctVO auctVO);  //join
	//查詢得標訂單狀況
	public AuctVO listOneWinStat(String auct_id);
	
	
	//更新訂單資訊
	public void update_ord(AuctVO auctVO);
	//查詢訂單資訊
	public AuctVO listOneOrd(String auct_id);
	
	//前台上架（陳列）
	public List<AuctVO> getAllFront();
	//前台結標（陳列）
	public List<AuctVO> getAllResult();
	//列出所有訂單getAll()整個表格
	public List<AuctVO> getAll_all();
}
