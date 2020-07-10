package com.groupBuy.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.omg.CORBA.PUBLIC_MEMBER;

public class GroupBuyService {

	private GroupBuyDAO_interface dao;

	public GroupBuyService() {
		dao = new GroupBuyDAO();
	}

	public GroupBuyVO addGroupBuy(String p_Id, String reb1_No, String reb2_No, String reb3_No,
			java.sql.Timestamp start_Date, java.sql.Timestamp end_Date, Integer grotime_Date, Integer status,
			String people, Integer money) {

		GroupBuyVO groupBuyVO = new GroupBuyVO();

		groupBuyVO.setP_Id(p_Id);
		groupBuyVO.setReb1_No(reb1_No);
		groupBuyVO.setReb2_No(reb2_No);
		groupBuyVO.setReb3_No(reb3_No);
		groupBuyVO.setStart_Date(start_Date);
		groupBuyVO.setEnd_Date(end_Date);
		groupBuyVO.setGrotime_Date(grotime_Date);
		groupBuyVO.setStatus(status);
		groupBuyVO.setPeople(people);
		groupBuyVO.setMoney(money);
		dao.insert(groupBuyVO);

		return groupBuyVO;
	}

	public GroupBuyVO updateGroupBuy(String gro_Id, String p_Id, String reb1_No, String reb2_No, String reb3_No,
			java.sql.Timestamp start_Date, java.sql.Timestamp end_Date, Integer grotime_Date, Integer status,
			String people, Integer money) {

		GroupBuyVO groupBuyVO = new GroupBuyVO();

		groupBuyVO.setGro_Id(gro_Id);
		groupBuyVO.setP_Id(p_Id);
		groupBuyVO.setReb1_No(reb1_No);
		groupBuyVO.setReb2_No(reb2_No);
		groupBuyVO.setReb3_No(reb3_No);
		groupBuyVO.setStart_Date(start_Date);
		groupBuyVO.setEnd_Date(end_Date);
		groupBuyVO.setGrotime_Date(grotime_Date);
		groupBuyVO.setStatus(status);
		groupBuyVO.setPeople(people);
		groupBuyVO.setMoney(money);

		dao.update(groupBuyVO);

		return groupBuyVO;
	}

	public GroupBuyVO gropeo(String gro_Id,String people) {

		GroupBuyVO groupBuyVO = new GroupBuyVO();

		groupBuyVO.setGro_Id(gro_Id);
		groupBuyVO.setPeople(people);

		dao.gropeo(groupBuyVO);

		return groupBuyVO;
	}
	public GroupBuyVO gromon(String gro_Id,Integer money) {

		GroupBuyVO groupBuyVO = new GroupBuyVO();

		groupBuyVO.setGro_Id(gro_Id);
		groupBuyVO.setMoney(money);

		dao.gromon(groupBuyVO);

		return groupBuyVO;
	}

	public List<GroupBuyVO> openGroupBuy() {
		return dao.getAllByOpen();
	}

	public void deleteGroupBuy(String gro_Id) {
		dao.delete(gro_Id);
	}

	public GroupBuyVO getOneGroupBuy(String gro_Id) {
		return dao.findByPrimaryKey(gro_Id);
	}

	public List<GroupBuyVO> getAll() {
		return dao.getAll();
	}

	public void closeGroupBuy(String gro_id, Integer status) {
		dao.closeGroupBuy(gro_id, status);
	}
	public List<GroupBuyVO> getAllByGroId(String gro_id) {
		return dao.getAllByGroId(gro_id);
	}

}
