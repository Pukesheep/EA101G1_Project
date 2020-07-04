package com.comm.model;

import java.util.*;

public interface CommDAO_interface {

	public String insert(CommVO commVO);
	public void update(CommVO commVO);
	public void delete(String comm_id);
	public CommVO findByPrimaryKey(String comm_id);
	public java.util.List<CommVO> getAll();
//	public java.util.List<CommVO> getAll(Map<String, String[]> map);
	public CommVO findComm(String post_id);
}
