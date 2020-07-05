package com.favourite_gro.model;

import java.sql.Date;
import java.util.List;


     public class Favourite_groService {
        	
     private Favourite_groDAO_interface dao;
     
	 public Favourite_groService() {
			dao = new Favourite_groDAO();
		}

public Favourite_groVO addFavourite_gro(String mem_Id,String gro_Id) {

		Favourite_groVO favourite_groVO = new Favourite_groVO();
		favourite_groVO.setMem_Id(mem_Id); 
	    favourite_groVO.setGro_Id(gro_Id);
	    dao.insert(favourite_groVO);

			return favourite_groVO;
		}

		public Favourite_groVO updateFavourite_gro(String mem_Id,String gro_Id) {

			Favourite_groVO favourite_groVO = new Favourite_groVO();
			favourite_groVO.setMem_Id(mem_Id); 
		    favourite_groVO.setGro_Id(gro_Id);
			dao.update(favourite_groVO);

			return favourite_groVO;
		}

	
		public void deleteFavourite_gro(String mem_Id) {
			dao.delete(mem_Id);
		}

		public Favourite_groVO getOneGroupBuy(String mem_Id) {
			return dao.findByPrimaryKey(mem_Id);
		}

		public List<Favourite_groVO> getAll() {
			return dao.getAll();
		}
     }
     
