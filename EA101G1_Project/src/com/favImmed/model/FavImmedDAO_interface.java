package com.favImmed.model;

import java.util.List;


public interface FavImmedDAO_interface  {
	
	public void insert(FavImmedVO favImmedVO);
	public void delete(String immed_id , String mem_id);
	public FavImmedVO getOneFavImmed(String immed_id , String mem_id);
	public List<FavImmedVO> getFavImmedByMem(String mem_id);
}
