package com.gro_mem.model;

import java.util.List;


public interface Gro_memDAO_interface {
	public void insert(Gro_memVO gro_memVO);

	public void update(Gro_memVO gro_memVO);

	public void delete(String gro_Id);

	public Gro_memVO findByPrimaryKey(String gro_Id);

	public List<Gro_memVO> getAll();
}
