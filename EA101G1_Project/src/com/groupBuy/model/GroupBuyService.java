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

//	private String gro_Id;
//	private String p_Id;
//	private String reb1_No;
//	private String reb2_No;
//	private String reb3_No;
//	private Timestamp start_Date;
//	private Timestamp end_Date;
//	private Integer grotime_Date;
//	private Integer status;
//	private String people;
//	private Integer money;
//	
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

//		public GroupBuyVO openGroupBuy(String gro_Id,java.sql.Timestamp start_Date, java.sql.Timestamp end_Date) {
//			
//			GroupBuyVO groupBuyVO = new GroupBuyVO();
//			
//			groupBuyVO.setGro_Id(gro_Id);
//			groupBuyVO.setStart_Date(start_Date);
//			groupBuyVO.setEnd_Date(end_Date);
//			
//			dao.openGroupBuy(gro_Id);
//	}

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

}
