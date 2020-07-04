package com.adm.model;

import java.util.List;

public class AdmService {

	private AdmDAO_interface dao;

	public AdmService() {
		dao = new AdmDAO();
	}

	public AdmVO addAdm(String adm_acco, String adm_pass, String adm_name,
			Integer adm_state) {

		AdmVO admVO = new AdmVO();

		admVO.setAdm_acco(adm_acco);
		admVO.setAdm_pass(adm_pass);
		admVO.setAdm_name(adm_name);
		admVO.setAdm_state(adm_state);
		dao.insert(admVO);

		return admVO;
	}

	public AdmVO updateAdm(String adm_no, String adm_acco, String adm_pass,
			String adm_name, Integer adm_state) {

		AdmVO admVO = new AdmVO();

		admVO.setAdm_no(adm_no);
		admVO.setAdm_acco(adm_acco);
		admVO.setAdm_pass(adm_pass);
		admVO.setAdm_name(adm_name);
		admVO.setAdm_state(adm_state);
		dao.update(admVO);

		return admVO;
	}

	public void deleteAdm(String adm_no) {
		dao.delete(adm_no);
	}

	public AdmVO getOneAdm(String adm_no) {
		return dao.findByPrimaryKey(adm_no);
	}

	public List<AdmVO> getAll() {
		return dao.getAll();
	}
	
	public AdmVO loginByAcco(String adm_acco) {
		
		String adm_no = dao.loginByAcco(adm_acco);
		
		return dao.findByPrimaryKey(adm_no);		
	}
}
