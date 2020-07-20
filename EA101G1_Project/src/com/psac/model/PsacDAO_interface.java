package com.psac.model;

import java.util.*;

public interface PsacDAO_interface {
    public void insert(PsacVO psacVO);
    public void update(PsacVO psacVO);
    public void delete(String psac_no);
    public PsacVO findByPrimaryKey(String psac_no);
    public List<PsacVO> getAll();
    public List<PsacVO> getStateEq();
	
}
