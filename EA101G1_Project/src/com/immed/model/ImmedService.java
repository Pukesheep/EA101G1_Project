package com.immed.model;

import java.sql.Timestamp;
import java.util.List;

public class ImmedService {
	
	private ImmedDAO_interface dao;
	
	public ImmedService() {
		dao = new ImmedDAO();
	}
	
	public ImmedVO addImmed(String sale_id, String pt_id, String immed_name, Integer immed_prc, byte[] immed_pic, String immed_desc) {
		ImmedVO immedVO = new ImmedVO();
		
		immedVO.setSale_id(sale_id);
		immedVO.setPt_id(pt_id);
		immedVO.setImmed_name(immed_name);
		immedVO.setImmed_prc(immed_prc);
		immedVO.setImmed_pic(immed_pic);
		immedVO.setImmed_desc(immed_desc);
		dao.insert(immedVO);
		
		return immedVO;
	}
	
	public ImmedVO updateImmed(String buy_id, String pt_id, String immed_name,Integer immed_prc, byte[] immed_pic, String immed_desc, Integer immed_sold, Integer immed_down, Timestamp ord_time, String ordstat_id, String rcpt_name, String rcpt_cell, String rcpt_add, String immed_id) {
		ImmedVO immedVO = new ImmedVO();
		
		immedVO.setBuy_id(buy_id);
		immedVO.setPt_id(pt_id);
		immedVO.setImmed_name(immed_name);
		immedVO.setImmed_prc(immed_prc);
		immedVO.setImmed_pic(immed_pic);
		immedVO.setImmed_desc(immed_desc);
		immedVO.setImmed_sold(immed_sold);
		immedVO.setImmed_down(immed_down);
		immedVO.setOrd_time(ord_time);
		immedVO.setOrdstat_id(ordstat_id);
		immedVO.setRcpt_name(rcpt_name);
		immedVO.setRcpt_cell(rcpt_cell);
		immedVO.setRcpt_add(rcpt_add);
		immedVO.setImmed_id(immed_id);
		dao.update(immedVO);
		
		return immedVO;
	}
	
	public ImmedVO updateImmedUp(String immed_id) {
		ImmedVO immedVO = new ImmedVO();
		
		immedVO.setImmed_id(immed_id);
		dao.update_up(immedVO);
		
		return immedVO;
	}
	
	public ImmedVO updateImmedDown(String immed_id) {
		ImmedVO immedVO = new ImmedVO();
		
		immedVO.setImmed_id(immed_id);
		dao.update_down(immedVO);
		
		return immedVO;
	}
	
	public ImmedVO updateBuyImmed(String buy_id, String rcpt_name, String rcpt_cell, String rcpt_add, String immed_id) {
		ImmedVO immedVO = new ImmedVO();
		
		immedVO.setBuy_id(buy_id);
		immedVO.setRcpt_name(rcpt_name);
		immedVO.setRcpt_cell(rcpt_cell);
		immedVO.setRcpt_add(rcpt_add);
		immedVO.setImmed_id(immed_id);
		dao.update_one_buy(immedVO);
		
		return immedVO;
	}
	
	public void deleteImmed(String immed_id) {
		dao.delete(immed_id);
	}
	
	public ImmedVO getOneImmed(String immed_id) {
		return dao.findByPrimaryKey(immed_id);
	}
	
	public List<ImmedVO> getAll(){
		return dao.getAll();
	}
	public List<ImmedVO> findByImmedName(String search_str){
		return dao.findByImmedName(search_str);
	}
}
