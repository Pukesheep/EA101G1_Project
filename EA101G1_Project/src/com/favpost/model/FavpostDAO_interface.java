package com.favpost.model;

import java.util.*;

public interface FavpostDAO_interface {

	// 會員收藏文章
	public void insert(FavpostVO favpostVO);
	
//	public void update(FavpostVO favpostVO);
	
	// 取消收藏文章
	public void delete(String mem_id, String post_id);
//	public void delete(String post_id);
	// 搜尋單筆收藏
	public FavpostVO findByPrimaryKey(String mem_id, String post_id);
	
	// 利用 mem_id 查所有收藏文章
	public java.util.List<FavpostVO> findByMem_id(String mem_id);
	
	// 利用 post_id 查所有收藏此文章的會員
	public java.util.List<FavpostVO> findByPost_id(String post_id);
	
	public java.util.List<FavpostVO> getAll();
//	public java.util.List<FavpostVO> getAll(Map<String, String[]> map);
	
}
