package com.BounsOrder.model;

import java.util.List;

public class BOService {
	
	private BODAO_interface dao;
	
	public BOService() {
		dao = new BODAO();
	}
	
	public BOVO addBO ( String mem_id, String bon_id ) {
		BOVO boVO = new BOVO();
		
		boVO.setMem_id(mem_id);
		boVO.setBon_id(bon_id);
		dao.insert(boVO);

		return boVO;
	}
	
	public BOVO updateBO ( String ord_id, String mem_id, String bon_id, java.sql.Date ord_Date,
			String bs_id ) {
		BOVO boVO = new BOVO();
		
		boVO.setOrd_id(ord_id);
		boVO.setMem_id(mem_id);
		boVO.setBon_id(bon_id);
		boVO.setOrd_Date(ord_Date);
		boVO.setBs_id(bs_id);
		dao.update(boVO);
		
		return boVO;
	}
	
	public BOVO cancelBO ( String ord_id, String bs_id ) {
		BOVO boVO = new BOVO();
		
		boVO.setOrd_id(ord_id);
		boVO.setBs_id(bs_id);
		dao.cancel(ord_id, bs_id);
		
		return boVO;
	}
	
	public void deleteBO ( String ord_id ) {
		dao.delete(ord_id);
	}
	
	public BOVO getByPK ( String ord_id ) {
		return dao.findByPrimaryKey(ord_id);
	}
	
	public List<BOVO> getAll() {
		return dao.getAll();
	}
	
	public List<BOVO> getByMem ( String mem_id ) {
		return dao.getByMem(mem_id);
	}
	
	public List<BOVO> getByBon ( String bon_id ) {
		return dao.getByBon(bon_id);
	}
	
	public List<BOVO> getByBs ( String bs_id ) {
		return dao.getByBs(bs_id);
	}
}
