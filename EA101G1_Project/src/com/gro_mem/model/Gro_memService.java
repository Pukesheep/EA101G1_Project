package com.gro_mem.model;

import java.sql.Date;
import java.util.List;

public class Gro_memService {

	private Gro_memDAO_interface dao;

	public Gro_memService() {
		dao = new Gro_memDAO();
	}

	public Gro_memVO addGro_mem(String gro_Id, String mem_Id) {

		Gro_memVO gro_memVO = new Gro_memVO();
		gro_memVO.setGro_Id(gro_Id);
		gro_memVO.setMem_Id(mem_Id);
		dao.insert(gro_memVO);

		return gro_memVO;
	}

	public Gro_memVO updateGro_mem(String gro_Id, String mem_Id) {

		Gro_memVO gro_memVO = new Gro_memVO();

		gro_memVO.setGro_Id(gro_Id);
		gro_memVO.setMem_Id(mem_Id);

		dao.update(gro_memVO);

		return gro_memVO;
	}

	public void deleteGro_mem(String gro_Id) {
		dao.delete(gro_Id);
	}

	public Gro_memVO getOneGroupBuy(String gro_Id) {
		return dao.findByPrimaryKey(gro_Id);
	}

	public List<Gro_memVO> getAll() {
		return dao.getAll();
	}
}
