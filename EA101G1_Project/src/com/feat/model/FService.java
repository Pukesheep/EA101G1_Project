package com.feat.model;

import java.util.List;

public class FService {

	private FDAO_interface dao;

	public FService() {
		dao = new FDAO();
	}

	public FVO addF(String f_type) {

		FVO fVO = new FVO();

		fVO.setF_type(f_type);
		dao.insert(fVO);

		return fVO;
	}

	public FVO updateF(String f_no, String f_type) {

		FVO fVO = new FVO();

		fVO.setF_no(f_no);
		fVO.setF_type(f_type);
		dao.update(fVO);

		return fVO;
	}

	public void deleteF(String f_no) {
		dao.delete(f_no);
	}

	public FVO getOneF(String f_no) {
		return dao.findByPrimaryKey(f_no);
	}

	public List<FVO> getAll() {
		return dao.getAll();
	}
}
