package com.BounsOrder.model;

import java.util.List;

public interface BODAO_interface {
	public void insert(BOVO boVO);
	public void update(BOVO boVO);
	public void delete(String ord_id);
	public BOVO findByPrimaryKey(String ord_id);
	public List<BOVO> getAll();
}