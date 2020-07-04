package com.bid.model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.List;

public class BidDAOTEST {

	public static void main(String[] args) {
		BidDAO dao = new BidDAO();
		
		//新增出價
//		BidVO bidVO1 = new BidVO();
//		bidVO1.setAuct_id("AUCT000005");
//		bidVO1.setBuy_id("M000005");
//		bidVO1.setBid_prc(5200);
//		
//		GregorianCalendar time1 = new GregorianCalendar();
//		bidVO1.setBid_time(new Timestamp(time1.getTimeInMillis()));
//		bidVO1.setBid_win(0);
//					
//		dao.insert(bidVO1);
//		System.out.println("新增成功");
		
		//查詢1筆出價
//		BidVO bidVO4 = dao.findByPK("BID000031");
//		System.out.println("出價編號" + bidVO4.getBid_id());
//		System.out.println("拍賣商品編號" + bidVO4.getAuct_id());
//		System.out.println("買家編號" + bidVO4.getBuy_id());
//		System.out.println("出價價格" + bidVO4.getBid_prc());
//		System.out.println("出價時間" + (new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(bidVO4.getBid_time())));
//		System.out.println("拍賣是否得標" + bidVO4.getBid_win());
//		System.out.println("==================================");
//		System.out.println("查詢結束");
		
		
		//查詢全部出價
		List<BidVO> list = new ArrayList<BidVO>();
		list = dao.getAll();
		
		for(BidVO aBidVO : list) {
			System.out.println("出價編號" + aBidVO.getBid_id());
			System.out.println("拍賣商品編號" + aBidVO.getAuct_id());
			System.out.println("買家編號" + aBidVO.getBuy_id());
			System.out.println("出價價格" + aBidVO.getBid_prc());
			System.out.println("出價時間" + (new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(aBidVO.getBid_time())));
			System.out.println("拍賣是否得標" + aBidVO.getBid_win());
			System.out.println("==================================");
		}
		System.out.println("查詢結束");
	}

}
