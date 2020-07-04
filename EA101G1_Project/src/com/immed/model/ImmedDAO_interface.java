package com.immed.model;

import java.util.*;

public interface ImmedDAO_interface {
	public void insert(ImmedVO immedVO);
	public void update(ImmedVO immedVO);
	public void delete(String immed_id);
	public ImmedVO findByPrimaryKey(String immed_id);
	public List<ImmedVO> getAll();
	public List<ImmedVO> findByImmedName(String search_str);
}
