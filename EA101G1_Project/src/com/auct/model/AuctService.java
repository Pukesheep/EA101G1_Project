package com.auct.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import com.bid.model.BidVO;

public class AuctService {
	
	private AuctDAO_interface dao;
	
	public AuctService() {
		dao = new AuctDAO();
	}

	//新增 (拍賣商品)
public AuctVO insert_auct(String sale_id,String pt_id,String auct_name,Timestamp auct_start,Timestamp auct_end,Integer marketPrice,
		Integer initPrice,Integer auct_inc,String auct_desc,byte[] auct_pic,Integer auct_sold,Integer auct_down,Timestamp pay_end) {
	
		AuctVO auctVO = new AuctVO();
		
		auctVO.setSale_id(sale_id);  //賣家編號
		auctVO.setPt_id(pt_id);      //商品分類編號
		auctVO.setAuct_name(auct_name);   //商品名稱
		
		auctVO.setAuct_start(auct_start); //拍賣上架時間（開始時間）		
		auctVO.setAuct_end(auct_end);  
		
		auctVO.setMarketPrice(marketPrice);//市價
		auctVO.setInitPrice(initPrice);  //拍賣出價（一開始為底價）
		auctVO.setAuct_inc(auct_inc);  //出價增額
		auctVO.setAuct_desc(auct_desc);  //商品描述
		auctVO.setAuct_pic(auct_pic);    //商品圖片
		auctVO.setAuct_sold(auct_sold);  //是否售出 （0:在售）
		auctVO.setAuct_down(auct_down);  //是否上架 （0:上架）
		auctVO.setPay_end(pay_end);      //訂單付款截止時間
		
		dao.insert_auct(auctVO);
		
		return auctVO;
	}

//修改商品內容(賣家編號不變)
public AuctVO update_auct(String pt_id,String auct_name,Timestamp auct_start,Timestamp auct_end,Integer marketPrice,
		Integer initPrice,Integer auct_inc,String auct_desc,byte[] auct_pic,Timestamp pay_end,Integer auct_down,String auct_id) {

	AuctVO auctVO = new AuctVO();
	
	auctVO.setPt_id(pt_id);      //商品分類編號
	auctVO.setAuct_name(auct_name);   //商品名稱
	
	auctVO.setAuct_start(auct_start); //拍賣上架時間（開始時間）	
	auctVO.setAuct_end(auct_end);  
	
	auctVO.setMarketPrice(marketPrice);//市價
	auctVO.setInitPrice(initPrice);  //拍賣出價（一開始為底價）
	auctVO.setAuct_inc(auct_inc);  //出價增額
	auctVO.setAuct_desc(auct_desc);  //商品描述
	auctVO.setAuct_pic(auct_pic);    //商品圖片
//	auctVO.setAuct_sold(auct_sold);  //是否售出 （0:在售）
	auctVO.setPay_end(pay_end);      //訂單付款截止時間
	auctVO.setAuct_down(auct_down);  //是否上架 （0:上架）
	auctVO.setAuct_id(auct_id);
	
	dao.update_auct(auctVO);
	
	return auctVO;
}

	
	//查詢單一商品
	public AuctVO listOneAuct(String auct_id) {
		return dao.listOneAuct(auct_id);
	}

	//查詢（全部）商品(前半部)
	public List<AuctVO> getAll(){
		return dao.getAll();
	}
	//查詢（全部）商品(整個表格)
	public List<AuctVO> getAll_all(){
		return dao.getAll_all();
	}
	
	//賣家查詢自己上架的商品
	public List<AuctVO> getAllByMem(String sale_id){
		return dao.getAllByMem(sale_id);
	}
	
	//查詢該商品，對應的出價
	public Set<BidVO> getBidsBy_auctId(String auct_id){
		return dao.getBidsBy_auctId(auct_id);
	}
	
	//修改上下架狀態
	public AuctVO update_auct_down(Integer auct_down,String auct_id) {
		AuctVO auctVO = new AuctVO();
		auctVO.setAuct_down(auct_down);  //是否上架 （0:上架）
		auctVO.setAuct_id(auct_id);
		
		dao.update_auct_down(auctVO);
		
		return auctVO;	
	}
	
	//修改售出狀態
		public AuctVO update_auct_sold(Integer auct_sold,String auct_id) {
			AuctVO auctVO = new AuctVO();
			auctVO.setAuct_sold(auct_sold);  //是否售出 （0:未售出, 1:售出）
			auctVO.setAuct_id(auct_id);
			
			dao.update_auct_down(auctVO);
			
			return auctVO;	
		}
	
	
	//更新得標者
		public AuctVO update_winner(Integer auct_sold,Integer auct_down,String buy_id,Integer maxPrice,Timestamp ord_time,String ordstat_id,String auct_id) {
			AuctVO auctVO = new AuctVO();
			
			auctVO.setAuct_sold(auct_sold);  //已售出
			auctVO.setAuct_down(auct_down);  //已下架
			auctVO.setBuy_id(buy_id);
			auctVO.setMaxPrice(maxPrice);
			auctVO.setOrd_time(ord_time);
			auctVO.setOrdstat_id(ordstat_id);
			auctVO.setAuct_id(auct_id);
			
			dao.update_winner(auctVO);

			return auctVO;
		}
		
	//更新訂單狀態
		public AuctVO update_ordstat_id(String ordstat_id,String auct_id) {
			AuctVO auctVO = new AuctVO();

			auctVO.setOrdstat_id(ordstat_id);
			auctVO.setAuct_id(auct_id);
			
			dao.update_ordstat_id(auctVO);
			
			return auctVO;
			
		}
		
	//查詢得標訂單狀況
		public AuctVO listOneWinStat(String auct_id) {
			return dao.listOneWinStat(auct_id);
		}

		
		
	//更新訂單資訊
		public AuctVO update_ord(String ordstat_id,Timestamp ord_time,String rcpt_name,
								 String rcpt_cel,String rcpt_add,String auct_id) {
			AuctVO auctVO = new AuctVO();

			auctVO.setOrdstat_id(ordstat_id);
			auctVO.setOrd_time(ord_time);
			auctVO.setRcpt_name(rcpt_name);
			auctVO.setRcpt_cel(rcpt_cel);
			auctVO.setRcpt_add(rcpt_add);
			
			auctVO.setAuct_id(auct_id);
			
			dao.update_ord(auctVO);
			
			return auctVO;
			
		}
		
	//查詢訂單資訊
		public AuctVO listOneOrd(String auct_id) {
			return dao.listOneOrd(auct_id);
		}
		
	//前台上架(陳列)
		public List<AuctVO> getAllFront(){
			return dao.getAllFront();
		}

	//前台結標（陳列）
		public List<AuctVO> getAllResult(){
			return dao.getAllResult();
		}
		
//============================================================================================================		
//	JAVA8	
		
	// 商品管理(賣家列出自己賣的, 且 還未售出)	
	    public List<AuctVO> getSaleList(String sale_id){
	    	List<AuctVO> list = dao.getAll().stream()
	    			.filter(auct ->auct.getSale_id().equals(sale_id))
	    			.filter(auct1 ->(auct1.getAuct_sold()==0))
	    			.collect(Collectors.toList());
	    	return list;
	    }
		
	// 訂單管理(賣家列出自己賣的, 且 已售出)	
	    public List<AuctVO> getSaleOrderList(String sale_id){
	    	List<AuctVO> list = dao.getAll_all().stream()
	    			.filter(auct ->auct.getSale_id().equals(sale_id))
	    			.filter(auct1 ->(auct1.getAuct_sold()==1))
	    			.collect(Collectors.toList());
	    	
	    			
	    	return list;
	    }
		
	
	// 戰利品(買家列出自己 標到 的商品)
	    public List<AuctVO> getBuyOrderList(String sale_id){
	    	List<AuctVO> list = dao.getAll_all().stream() 
	    			.filter(auct ->auct.getBuy_id().equals(sale_id)) 
	    			.collect(Collectors.toList());
	    	System.out.println(list);	
	    	return list;
	    }
		
		
		
		
		
}
