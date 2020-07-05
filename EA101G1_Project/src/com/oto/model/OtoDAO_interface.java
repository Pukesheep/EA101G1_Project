package com.oto.model;

import java.util.List;

public interface OtoDAO_interface {
	public void insert(OtoVO otoVO);

	public void update(OtoVO otoVO);

	public void delete(String cr_id);

	public OtoVO findByPrimaryKey(String cr_id);

	public List<OtoVO> getAll();
}
