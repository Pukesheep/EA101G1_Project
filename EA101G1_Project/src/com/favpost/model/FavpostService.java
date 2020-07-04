package com.favpost.model;

import java.util.*;

public class FavpostService {

	private FavpostDAO_interface dao;
	
	public FavpostService() {
		dao = new FavpostDAO();
	}
	
	public FavpostVO addFavpost(String mem_id, String post_id) {
		
		FavpostVO favpostVO = new FavpostVO();
		favpostVO.setMem_id(mem_id);
		favpostVO.setPost_id(post_id);
		dao.insert(favpostVO);
		
		return favpostVO;
	}
	
	public void deleteFavpost(String mem_id, String post_id) {
		dao.delete(mem_id, post_id);
	}
	
	public FavpostVO getOneFavpost(String mem_id, String post_id) {
		return dao.findByPrimaryKey(mem_id, post_id);
	}
	
	public List<FavpostVO> getAllByM(String mem_id) {
		return dao.findByMem_id(mem_id);
	}
	
	public List<FavpostVO> getAllByP(String post_id) {
		return dao.findByPost_id(post_id);
	}
	
	public List<FavpostVO> getAll() {
		return dao.getAll();
	}
	
}
