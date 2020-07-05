package com.oto.model;

import java.sql.Timestamp;
import java.util.List;

import com.CustomerMessage.model.CustomerMessageVO;
import com.sun.org.apache.bcel.internal.generic.RETURN;

public class OtoService {
	private OtoDAO_interface dao;

	public OtoService() {
		dao = new OtoDAO();
	}

	public OtoVO addoto(Timestamp cr_time,
			String user_one, String user_two,
			String cr_word, byte[] cr_pic,
			Integer cr_status) {
		
		OtoVO otoVO = new OtoVO();
		otoVO.setCr_time(cr_time);
		otoVO.setUser_one(user_one);
		otoVO.setUser_two(user_two);
		otoVO.setCr_word(cr_word);
		otoVO.setCr_pic(cr_pic);
		otoVO.setCr_status(cr_status);
		dao.insert(otoVO);
		return otoVO;
	}
	public OtoVO update(String cr_word,byte[] cr_pic,String user_one,String user_two,Integer cr_status,String cr_id) {
		OtoVO otoVO = new OtoVO();
		otoVO.setCr_word(cr_word);
		otoVO.setCr_pic(cr_pic);
		otoVO.setUser_one(user_one);
		otoVO.setUser_two(user_two);
		otoVO.setCr_status(cr_status);
		otoVO.setCr_id(cr_id);
		dao.update(otoVO);
	return otoVO;	
	}
	public OtoVO getOne_Message(String cr_id) {
		return dao.findByPrimaryKey(cr_id);
	}
	public List<OtoVO> getAll() {
//		List<CustomerMessageVO> a = new ArrayList<CustomerMessageVO>(new HashSet<CustomerMessageVO>(dao.getAll()));
		return dao.getAll();
	} 
	
	
}
