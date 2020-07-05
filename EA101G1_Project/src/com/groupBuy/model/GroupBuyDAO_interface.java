package com.groupBuy.model;

import java.util.List;

public interface GroupBuyDAO_interface {
	public void insert(GroupBuyVO groupBuyVO);

	public void update(GroupBuyVO groupBuyVO);

	public void delete(String gro_Id);

	public GroupBuyVO findByPrimaryKey(String gro_Id);

	public List<GroupBuyVO> getAll();

	public void closeGroupBuy(String gro_id, Integer status);

	public List<GroupBuyVO> getAllByOpen();
}
