package com.rebate.model;

import java.sql.Date;
import java.util.List;

public class RebateService {

	private RebateDAO_interface dao;

	public RebateService() {
		dao = new RebateDAO();
	}

	public RebateVO addRebate(Integer discount, String people) {

		RebateVO rebateVO = new RebateVO();
		rebateVO.setDiscount(discount);
		rebateVO.setPeople(people);
		dao.insert(rebateVO);
		return rebateVO;

	}

	public RebateVO updateRebate(String reb_No, Integer discount, String people) {

		RebateVO rebateVO = new RebateVO();
		rebateVO.setReb_No(reb_No);
		rebateVO.setDiscount(discount);
		rebateVO.setPeople(people);

		dao.update(rebateVO);

		return rebateVO;

	}

	public void deleteRebate(String reb_No) {
		dao.delete(reb_No);
	}

	public RebateVO getOneRebate(String reb_No) {
		System.out.println("6 " + reb_No);
		return dao.findByPrimaryKey(reb_No);
	}

	public List<RebateVO> getAll() {
		return dao.getAll();
	}

}
