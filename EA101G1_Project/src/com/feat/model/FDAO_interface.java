package com.feat.model;

import java.util.List;

public interface FDAO_interface {

	public void insert(FVO fVO);
    public void update(FVO fVO);
    public void delete(String f_no);
    public FVO findByPrimaryKey(String f_no);
    public List<FVO> getAll();

}
