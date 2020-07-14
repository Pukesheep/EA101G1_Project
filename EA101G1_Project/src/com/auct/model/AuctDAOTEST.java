package com.auct.model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Set;

import com.bid.model.BidVO;

public class AuctDAOTEST {

	public static void main(String[] args) {
		AuctDAO dao = new AuctDAO();
		
		//新增 (拍賣商品)
//		AuctVO auctVO1 = new AuctVO();
//		
//		auctVO1.setSale_id("M000006");  //賣家編號
//		auctVO1.setPt_id("PT004");      //商品分類編號
//		auctVO1.setAuct_name("二手主機 PS4 1207A 500G 主機");   //商品名稱
//		
//		GregorianCalendar time1 = new GregorianCalendar();
//		auctVO1.setAuct_start(new Timestamp(time1.getTimeInMillis())); //拍賣上架時間（開始時間）
//		
//		GregorianCalendar time2 = new GregorianCalendar();  //拍賣截止時間（24小時後停止下單）
//		auctVO1.setAuct_end(new Timestamp(time2.getTimeInMillis()+24*60*60*1000L));  
//		
//		auctVO.setMarketPrice(marketPrice);//市價
//		auctVO1.setInitPrice(300);  //拍賣出價（一開始為底價）
//		auctVO1.setAuct_inc(50);  //出價增額
//		auctVO1.setAuct_desc("二手主機 PS4");  //商品描述
//		auctVO1.setAuct_sold(0);  //是否售出 （0:在售）
//		auctVO1.setAuct_down(0);  //是否上架 （0:上架）
//		
//		dao.insert_product(auctVO1);
//		System.out.println("新增成功");

	
	
	//修改商品內容(賣家編號不變)
//	AuctVO auctVO2 = new AuctVO();
//	
//	auctVO2.setPt_id("PT001");      //商品分類編號
//	auctVO2.setAuct_name(" 主機+++");   //商品名稱
//	
//	GregorianCalendar time1 = new GregorianCalendar();
//	auctVO2.setAuct_start(new Timestamp(time1.getTimeInMillis())); //拍賣上架時間（開始時間）
//	
//	GregorianCalendar time2 = new GregorianCalendar();  //拍賣截止時間（24小時後停止下單）
//	auctVO2.setAuct_end(new Timestamp(time2.getTimeInMillis()+24*60*60*1000L));  
//	
//	auctVO.setMarketPrice(marketPrice);//市價
//	auctVO2.setInitPrice(300);  //拍賣出價（一開始為底價）
//	auctVO2.setAuct_inc(50);  //出價增額
//	auctVO2.setAuct_desc("二手主機 PS4");  //商品描述
//	auctVO2.setAuct_id("AUCT000010");
//	
//	auctVO2.setAuct_down(0); //上架
//	dao.update_auct_down(auctVO2);
//	
//	dao.update_product(auctVO2);
//	System.out.println("修改成功");
	
	
//	//查詢單一商品
//	AuctVO auctVO3 = dao.listOneAuct("AUCT000010");
//	System.out.println(auctVO3.getAuct_id() + ",");
//	System.out.println(auctVO3.getSale_id() + ",");
//	System.out.println(auctVO3.getPt_id() + ",");
//	System.out.println(auctVO3.getAuct_name() + ",");	
//	System.out.println(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(auctVO3.getAuct_start()) + ",");
//	System.out.println(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(auctVO3.getAuct_end()) + ",");
		
//	System.out.println(one_auctVO.getMarketPrice() + ",");
//	System.out.println(auctVO3.getInitPrice() + ",");
//	System.out.println(auctVO3.getAuct_inc() + ",");
//	System.out.println(auctVO3.getAuct_desc() + ",");
//	System.out.println(auctVO3.getAuct_pic() + ",");
//	System.out.println(auctVO3.getAuct_sold() + ",");
//	System.out.println(auctVO3.getAuct_down() + ",");
//	
////	System.out.println(auctVO3.getBuy_id() + ",");
//	System.out.println(auctVO3.getMaxPrice() + ",");
	
//	System.out.println(auctVO3.getOrdstat_id() + ",");
//	System.out.println(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(auctVO3.getOrd_time()) + ",");
//	System.out.println(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(auctVO3.getPay_end()) + ",");
//	System.out.println(auctVO3.getRcpt_name() + ",");
//	System.out.println(auctVO3.getRcpt_cel() + ",");
//	System.out.println(auctVO3.getRcpt_add());
//	System.out.println("查詢結束");
	
	//查詢（全部）商品
//	List<AuctVO> list = new ArrayList<AuctVO>();
//	list = dao.getAll();
//	
//	for(AuctVO one_auctVO : list) {
//		System.out.println(one_auctVO.getAuct_id() + ",");
//		System.out.println(one_auctVO.getSale_id() + ",");
////		System.out.println(one_auctVO.getBuy_id() + ",");
//		System.out.println(one_auctVO.getPt_id() + ","); 
//		System.out.println(one_auctVO.getAuct_name() + ",");
//		
//		System.out.println(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(one_auctVO.getAuct_start()) + ",");
//		System.out.println(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(one_auctVO.getAuct_end()) + ",");
//		System.out.println(one_auctVO.getMarketPrice() + ",");
//		System.out.println(one_auctVO.getInitPrice() + ",");
//		System.out.println(one_auctVO.getAuct_inc() + ",");
////		System.out.println(one_auctVO.getMaxPrice() + ",");
//		System.out.println(one_auctVO.getAuct_desc() + ",");
//		System.out.println(one_auctVO.getAuct_pic() + ",");
//		System.out.println(one_auctVO.getAuct_sold() + ",");
//		System.out.println(one_auctVO.getAuct_down() + ",");
////		System.out.println(one_auctVO.getOrdstat_id() + ",");
////		System.out.println(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(one_auctVO.getOrd_time()) + ",");
//		System.out.println(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(one_auctVO.getPay_end()) + ",");
////		System.out.println(one_auctVO.getRcpt_name() + ",");
////		System.out.println(one_auctVO.getRcpt_cel() + ",");
////		System.out.println(one_auctVO.getRcpt_add());
////		System.out.println("======================================");
//	}
//		
//	System.out.println("查詢結束");
		
	//賣家查詢自己上架的商品
//		List<AuctVO> list = new ArrayList<AuctVO>();
//		list = dao.getAllByMem("M000003");
//		
//		for(AuctVO one_auctVO : list) {
//			System.out.println(one_auctVO.getAuct_id() + ",");
//			System.out.println(one_auctVO.getSale_id() + ",");
//			System.out.println(one_auctVO.getPt_id() + ","); 
//			System.out.println(one_auctVO.getAuct_name() + ",");
//			
//			System.out.println(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(one_auctVO.getAuct_start()) + ",");
//			System.out.println(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(one_auctVO.getAuct_end()) + ",");
//			System.out.println(one_auctVO.getMarketPrice() + ",");
//			System.out.println(one_auctVO.getInitPrice() + ",");
//			System.out.println(one_auctVO.getAuct_inc() + ",");
//			System.out.println(one_auctVO.getAuct_desc() + ",");
//			System.out.println(one_auctVO.getAuct_pic() + ",");
//			System.out.println(one_auctVO.getAuct_sold() + ",");
//			System.out.println(one_auctVO.getAuct_down() + ",");
//			System.out.println("======================================");
//			
//		} System.out.println("查詢結束");
	
	
	//查詢該商品，對應的出價
//	Set<BidVO> set = dao.getBidsBy_auctId("AUCT000004");
//	
//	for(BidVO aBidVO : set) {
//		System.out.println("出價編號" + aBidVO.getBid_id());
//		System.out.println("拍賣商品編號" + aBidVO.getAuct_id());
//		System.out.println("買家編號" + aBidVO.getBuy_id());
//		System.out.println("出價價格" + aBidVO.getBid_prc());
//		System.out.println("出價時間" + (new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(aBidVO.getBid_time())));
//		System.out.println("拍賣是否得標" + aBidVO.getBid_win());
//		System.out.println("==================================");
//	} //for-each迴圈
//		System.out.println("查詢結束");
	
	//更新得標者
//	AuctVO auctVO = new AuctVO();
//	
//	auctVO.setAuct_sold(1);
//	auctVO.setAuct_down(1);
//	auctVO.setBuy_id("M000006");
//	auctVO.setMaxPrice(5000);
//	
//	GregorianCalendar time1 = new GregorianCalendar();
//	auctVO.setOrd_time(new Timestamp(time1.getTimeInMillis())); //拍賣上架時間（開始時間）
//	
//	auctVO.setOrdstat_id("003");
//	auctVO.setAuct_id("AUCT000049");
//	
//	dao.update_winner(auctVO);
//	System.out.println("更新成功");
	
	//更新訂單狀態
//	AuctVO auctVO = new AuctVO();
//
//	auctVO.setOrdstat_id("003");
//	auctVO.setAuct_id("AUCT000007");
//	
//	dao.update_ordstat_id(auctVO);
//	System.out.println("更新成功");
	
	
	//查詢得標狀況
//	AuctVO auctVO3 = dao.listOneWinStat("AUCT000001");
//	
//	System.out.println(auctVO3.getBuy_id());
//	System.out.println(auctVO3.getMaxPrice());
//	System.out.println(auctVO3.getOrdstat_id());
//	System.out.println("查詢結束");	
	
	
	//更新訂單資訊
//		AuctVO auctVO = new AuctVO();
//		
//		auctVO.setOrdstat_id("003");
//		
//		GregorianCalendar time1 = new GregorianCalendar();
//		auctVO.setOrd_time(new Timestamp(time1.getTimeInMillis())); //訂單時間（付款時間）
//		auctVO.setRcpt_name("XXX");
//		auctVO.setRcpt_cel("0916000000");
//		auctVO.setRcpt_add("XXX");
//		
//		auctVO.setAuct_id("AUCT000010");
//			
//		dao.update_ord(auctVO);
//		
//		System.out.println("更新成功");	
		
		
	//查詢訂單資訊
	AuctVO auctVO3 = dao.listOneOrd("AUCT000001");
		
	System.out.println(auctVO3.getBuy_id());
	System.out.println(auctVO3.getMaxPrice());
	System.out.println(auctVO3.getOrdstat_id());
	System.out.println(auctVO3.getAuct_id());
	System.out.println(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(auctVO3.getOrd_time()) + ",");
//	System.out.println(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(one_auctVO.getOrd_time()) + ",");
	System.out.println(auctVO3.getRcpt_name());
	System.out.println(auctVO3.getRcpt_cel());
	System.out.println(auctVO3.getRcpt_add());
	System.out.println("查詢結束");

		
	}
	
}
