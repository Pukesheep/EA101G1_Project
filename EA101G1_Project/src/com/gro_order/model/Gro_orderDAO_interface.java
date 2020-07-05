package com.gro_order.model;

import java.util.List;

public interface Gro_orderDAO_interface {
	public void insert(Gro_orderVO gro_orderVO);

	public void update(Gro_orderVO gro_orderVO);

	public void delete(String ord_Id);

	public Gro_orderVO findByPrimaryKey(String ord_Id);

	public List<Gro_orderVO> getAll();
}
