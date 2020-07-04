package com.comm.model;

import java.sql.*;

public class CommService {
	
	private CommDAO_interface dao;
	
	public CommService() {
		dao = new CommDAO();
	}
	
	public CommVO addComm(String post_id, String mem_id,
			Integer c_status, String c_text, Timestamp last_edit, Timestamp post_time) {
		
		CommVO commVO = new CommVO();
		
		commVO.setPost_id(post_id);
		commVO.setMem_id(mem_id);
		commVO.setC_status(c_status);
		commVO.setC_text(c_text);
		commVO.setLast_edit(last_edit);
		commVO.setPost_time(post_time);
		String generatedKey = dao.insert(commVO);
		commVO.setComm_id(generatedKey);
		
		return commVO;
	}
	
	public CommVO updateComm(String comm_id, String post_id,
			String mem_id, Integer c_status, String c_text,
			Timestamp last_edit, Timestamp post_time) {
		
		CommVO commVO = new CommVO();
		
		commVO.setComm_id(comm_id);
		commVO.setPost_id(post_id);
		commVO.setMem_id(mem_id);
		commVO.setC_status(c_status);
		commVO.setC_text(c_text);
		commVO.setLast_edit(last_edit);
		commVO.setPost_time(post_time);
		dao.update(commVO);
		
		return commVO;
	}
	
	public void deleteComm(String comm_id) {
		dao.delete(comm_id);
	}
	
	public CommVO getOneComm(String comm_id) {
		return dao.findByPrimaryKey(comm_id);
	}
	
	public java.util.List<CommVO> getAll(){
		return dao.getAll();
	}
	
	public CommVO findComm(String post_id){
		return dao.findComm(post_id);
	}

}
