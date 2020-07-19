package com.favImmed.model;

import java.util.List;

public class FavImmedService {
	
	private FavImmedDAO_interface dao;
	
	public FavImmedService() {
		dao = new FavImmedDAO();
	}
	
	public List<FavImmedVO> getImmedByMem(String mem_id) {
		
		return dao.getFavImmedByMem(mem_id);
	}
	
	public FavImmedVO getOne(String immed_id , String mem_id) {
		
		return dao.getOneFavImmed(immed_id, mem_id);
	}
	
	public void deleteFavImmed(String immed_id,String mem_id) {
		dao.delete(immed_id, mem_id);
	}
	
	public void addFavImmed(FavImmedVO favImmedVO) {
		
		dao.insert(favImmedVO);
	}
	
	
}
