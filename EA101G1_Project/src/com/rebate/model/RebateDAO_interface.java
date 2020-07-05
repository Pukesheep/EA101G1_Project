package com.rebate.model;

import java.util.List;

public interface RebateDAO_interface {
	public void insert(RebateVO rebateVO);

	public void update(RebateVO rebateVO);

	public void delete(String reb_No);

	public RebateVO findByPrimaryKey(String reb_No);

	public List<RebateVO> getAll();
}
