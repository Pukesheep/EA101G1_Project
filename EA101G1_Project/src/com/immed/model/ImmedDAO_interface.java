package com.immed.model;

import java.util.*;

public interface ImmedDAO_interface {
	public void insert(ImmedVO immedVO);
	public void update(ImmedVO immedVO);
	
	public void update_oneImmed(ImmedVO immedVO);
	public void update_up(ImmedVO immedVO);
	public void update_down(ImmedVO immedVO);
	public void update_end(ImmedVO immedVO);
	public void update_one_buy(ImmedVO immedVO);
	public void update_shipping(ImmedVO immedVO);
	public void update_disable(ImmedVO immedVO);
	
	public void delete(String immed_id);
	
	public ImmedVO findByPrimaryKey(String immed_id);
	
	public List<ImmedVO> getAll();
	public List<ImmedVO> getAllOnSale();
	
	public List<ImmedVO> getAllBuyerImmed(String buy_id);
	public List<ImmedVO> getAllSalerImmed(String sale_id);
	public List<ImmedVO> getAllSaled(String sale_id);
	public List<ImmedVO> getAllSaleIng(String sale_id);

	public List<ImmedVO> findByImmedName(String search_str);
	public List<ImmedVO> findByImmedType(String pt_id);
}