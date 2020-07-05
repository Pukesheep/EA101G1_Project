package com.CustomerMessage.model;

import java.util.*;


public interface CustomerMessage_interface {
	public void insert(CustomerMessageVO customerMessageVO);
	
	public void update(CustomerMessageVO customerMessageVO);
	
	public void delete(String cm_id);
    public CustomerMessageVO findByPrimaryKey(String cm_id);
    public List<CustomerMessageVO> getAll();

}
