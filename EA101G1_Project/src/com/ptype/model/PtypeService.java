package com.ptype.model;

public class PtypeService {
	
	private PtypeDAO_interface dao;
	
	public PtypeService() {
		dao = new PtypeDAO();
	}
	
	public PtypeVO addPtype(String type) {
		
		PtypeVO ptypeVO = new PtypeVO();
		
		ptypeVO.setType(type);
		dao.insert(ptypeVO);
		
		return ptypeVO;
	}
	
	public PtypeVO updatePtype(Integer ptype_id, String type) {
		
		PtypeVO ptypeVO = new PtypeVO();
		
		ptypeVO.setPtype_id(ptype_id);
		ptypeVO.setType(type);
		dao.update(ptypeVO);
		
		return ptypeVO;
	}
	
	public void deletePtype(Integer ptype_id) {
		dao.delete(ptype_id);
	}
	
	public PtypeVO getOnePtype(Integer ptype_id) {
		return dao.findByPrimaryKey(ptype_id);
	}
	
	public java.util.List<PtypeVO> getAll(){
		return dao.getAll();
	}

}
