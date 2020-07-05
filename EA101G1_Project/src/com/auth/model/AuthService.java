package com.auth.model;

import java.util.List;

public class AuthService {

	private AuthDAO_interface dao;

	public AuthService() {
		dao = new AuthDAO();
	}

	public AuthVO addAdm(String adm_no, String f_no) {

		AuthVO authVO = new AuthVO();

		authVO.setAdm_no(adm_no);
		authVO.setF_no(f_no);
		dao.insert(authVO);

		return authVO;
	}


	public void deleteAuth(String adm_no) {
		dao.delete(adm_no);
	}

	public AuthVO getOneAuth(String adm_no) {
		return dao.findByPrimaryKey(adm_no);
	}

	public List<AuthVO> getAll() {
		return dao.getAll();
	}
}
