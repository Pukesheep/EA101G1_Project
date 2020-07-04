package com.bid.model;

import java.sql.Timestamp;
import java.util.GregorianCalendar;
import java.util.List;

public class BidService {
	
	private BidDAO_interface dao;
	
	public BidService() {
		dao = new BidDAO();
	}
	
	//新增出價
	public BidVO addBid(String auct_id,String buy_id,Integer bid_prc,Timestamp bid_time,Integer bid_win) {
		BidVO bidVO = new BidVO();
		bidVO.setAuct_id(auct_id);
		bidVO.setBuy_id(buy_id);
		bidVO.setBid_prc(bid_prc);
		
		GregorianCalendar time1 = new GregorianCalendar();
		bidVO.setBid_time(new Timestamp(time1.getTimeInMillis()));
		bidVO.setBid_win(bid_win);
					
		dao.insert(bidVO);
		
		return bidVO;
	}
	
	//查詢1筆出價
	public BidVO getOneBid(String bid_id) {
		return dao.findByPK(bid_id);
	}

	//查詢全部出價
	public List<BidVO> getAll(){
		return dao.getAll();
	}
}
