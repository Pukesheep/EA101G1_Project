package com.psac.model;

import java.util.List;

public class PsacService {
	
	private PsacDAO_interface dao;

	public PsacService() {
		dao = new PsacDAO();
	}

	public PsacVO addPsac(String mem_id, String post_id, String adm_no,
			String psac_content, Integer psac_state) {

		PsacVO psacVO = new PsacVO();

		psacVO.setMem_id(mem_id);
		psacVO.setPost_id(post_id);
		psacVO.setAdm_no(adm_no);
		psacVO.setPsac_content(psac_content);
		psacVO.setPsac_state(psac_state);
		dao.insert(psacVO);

		return psacVO;
	}

	public PsacVO updatePsac(String psac_no, String mem_id, String post_id,
			String adm_no, String psac_content, Integer psac_state) {

		PsacVO psacVO = new PsacVO();

		psacVO.setPsac_no(psac_no);
		psacVO.setMem_id(mem_id);
		psacVO.setPost_id(post_id);
		psacVO.setAdm_no(adm_no);
		psacVO.setPsac_content(psac_content);
		psacVO.setPsac_state(psac_state);
		dao.update(psacVO);

		return psacVO;
	}

	public void deletePsac(String psac_no) {
		dao.delete(psac_no);
	}

	public PsacVO getOnePsac(String psac_no) {
		return dao.findByPrimaryKey(psac_no);
	}

	public List<PsacVO> getAll() {
		return dao.getAll();
	}
	
	public List<PsacVO> getStateEq0() {
		return dao.getStateEq0();
	}
	
}
