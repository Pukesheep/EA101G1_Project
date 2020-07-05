package com.gro_order.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class Gro_orderService {

	private Gro_orderDAO_interface dao;

	public Gro_orderService() {
		dao = new Gro_orderDAO();
	}

	public Gro_orderVO addGro_order(String mem_Id, String ordstat_Id, String gro_Id,Timestamp add_Date) {

		Gro_orderVO g_orderVO = new Gro_orderVO();

		
		g_orderVO.setMem_Id(mem_Id);
		g_orderVO.setOrdstat_Id(ordstat_Id);
		g_orderVO.setGro_Id(gro_Id);
		g_orderVO.setAdd_Date(add_Date);
		dao.insert(g_orderVO);

		return g_orderVO;
	}

	public Gro_orderVO updateGro_order(String mem_Id, String ordstat_Id, String gro_Id,String ord_Id,Timestamp add_Date) {

		Gro_orderVO g_orderVO = new Gro_orderVO();
		
		g_orderVO.setMem_Id(mem_Id);
		g_orderVO.setOrdstat_Id(ordstat_Id);
		g_orderVO.setGro_Id(gro_Id);
		g_orderVO.setAdd_Date(add_Date);
		g_orderVO.setOrd_Id(ord_Id);
		dao.update(g_orderVO);

		return g_orderVO;
	}

//		GroupBuyVO
//		private Integer gro_Id;
//		private Integer p_Id;
//		private Integer reb1_Id;
//		private Integer reb2_Id;
//		private Integer reb3_Id;
//		private Date start_Date;
//		private Date end_Date;
//		private Date grotime_Date;
//		private String status;
//		private String people;
//		private String money;

	public void deleteGro_Order(String ord_Id) {
		dao.delete(ord_Id);
	}

	public Gro_orderVO getOneGro_Order(String ord_Id) {
		return dao.findByPrimaryKey(ord_Id);
	}

	public List<Gro_orderVO> getAll() {
		return dao.getAll();
	}
}
