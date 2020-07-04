package com.ptype.model;

import java.util.*;

public interface PtypeDAO_interface {

	public void insert(PtypeVO ptypeVO);
	public void update(PtypeVO ptypeVO);
	public void delete(Integer ptype_id);
	public PtypeVO findByPrimaryKey(Integer ptype_id);
	public java.util.List<PtypeVO> getAll();
//	public java.util.List<PtypeVO> getAll(Map<String, String[]> map);
}
