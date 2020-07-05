package com.auth.model;

import java.util.List;

public interface AuthDAO_interface {

	public void insert(AuthVO authVO);
    public void delete(String adm_no);
    public AuthVO findByPrimaryKey(String adm_no);
    public List<AuthVO> getAll();
}
