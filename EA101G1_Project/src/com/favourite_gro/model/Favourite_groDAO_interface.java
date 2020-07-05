package com.favourite_gro.model;

import java.util.List;

public interface Favourite_groDAO_interface {
	public void insert(Favourite_groVO favourite_gro);

	public void update(Favourite_groVO favourite_gro);

	public void delete(String mem_Id);

	public Favourite_groVO findByPrimaryKey(String mem_Id);

	public List<Favourite_groVO> getAll();
}
