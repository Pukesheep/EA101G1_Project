package com.CustomerMessage.model;

import java.sql.*;
import java.util.*;

public class CustomerMessageService {
	private CustomerMessage_interface dao;
	
	public CustomerMessageService() {
		dao=new CustomerMessageDAO();
	}
	
	public CustomerMessageVO addCMessage(Timestamp cm_time,String cm_word
			,byte[] cm_pic,Integer cm_status,String cm_customerid) {
		
		CustomerMessageVO cumVO=new CustomerMessageVO();
		
		cumVO.setCm_time(cm_time);
		cumVO.setCm_word(cm_word);
		cumVO.setCm_pic(cm_pic);
		cumVO.setCm_status(cm_status);
		cumVO.setCm_customerid(cm_customerid);
		dao.insert(cumVO);
		
		return cumVO;

	}
	
	public CustomerMessageVO updateCMessage(String cm_word,byte[] cm_pic,Integer cm_status,String cm_id){
		CustomerMessageVO cumVO=new CustomerMessageVO();
		cumVO.setCm_word(cm_word);
		cumVO.setCm_pic(cm_pic);
		cumVO.setCm_status(cm_status);
		cumVO.setCm_id(cm_id);
		dao.update(cumVO);
		return cumVO;
	}
	public void deleteCMessage(String cm_id) {
		dao.delete(cm_id);
	}	
	public CustomerMessageVO getOneCMessage(String cm_id) {
		return dao.findByPrimaryKey(cm_id);
	}
	public List<CustomerMessageVO> getAll() {
//		List<CustomerMessageVO> a = new ArrayList<CustomerMessageVO>(new HashSet<CustomerMessageVO>(dao.getAll()));
		return dao.getAll();
	}

}
