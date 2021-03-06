package com.gro_order.model;

import java.sql.*;
import java.util.*;
import java.util.stream.Collectors;
import java.sql.*;

public class Gro_orderService {

	private Gro_orderDAO_interface dao;
	
	public Gro_orderService() {
		dao = new Gro_orderDAO();
	}
	
	public Gro_orderVO addGro_order(String gro_id, String mem_id, String ordstat_id, Double ord_price,
			Timestamp ord_date, String receive_name, String address, String phone) {
		
		Gro_orderVO gro_orderVO = new Gro_orderVO();
		
		gro_orderVO.setGro_id(gro_id);
		gro_orderVO.setMem_id(mem_id);
		gro_orderVO.setOrdstat_id(ordstat_id);
		gro_orderVO.setOrd_date(ord_date);
		gro_orderVO.setOrd_price(ord_price);
		gro_orderVO.setReceive_name(receive_name);
		gro_orderVO.setAddress(address);
		gro_orderVO.setPhone(phone);
		String generatedKey = dao.insert(gro_orderVO);
		gro_orderVO.setOrd_id(generatedKey);
		
		return gro_orderVO;
	}
	
	public Gro_orderVO updateGro_order(String ord_id,String gro_id, String mem_id, String ordstat_id,
			Double ord_price, Timestamp ord_date, String receive_name, String address, String phone) {
		
		Gro_orderVO gro_orderVO = new Gro_orderVO();
		
		gro_orderVO.setOrd_id(ord_id);
		gro_orderVO.setGro_id(gro_id);
		gro_orderVO.setMem_id(mem_id);
		gro_orderVO.setOrd_price(ord_price);
		gro_orderVO.setOrdstat_id(ordstat_id);
		gro_orderVO.setOrd_date(ord_date);
		gro_orderVO.setReceive_name(receive_name);
		gro_orderVO.setAddress(address);
		gro_orderVO.setPhone(phone);
		dao.update(gro_orderVO);
		
		return gro_orderVO;
	}
	
	public void deleteGro_order(String ord_id) {
		dao.delete(ord_id);
	}
	
	public Gro_orderVO getOneGro_order(String ord_id) {
		return dao.findByPrimaryKey(ord_id);
	}
	
	public List<Gro_orderVO> getAll(){
		return dao.getAll();
	}
	
	public List<Gro_orderVO> getAllByMem_id(String mem_id){
		return dao.findByMem_id(mem_id);
	}
	
	public List<Gro_orderVO> getAllByGro_id(String gro_id){
		return dao.findByGro_id(gro_id);
	}
	
	synchronized public List<String> ording(List<Gro_orderVO> list){
		
		List<String> primaryKeyList = new ArrayList<String>();
		String primaryKey = ""; 
		for (Gro_orderVO aGro_order : list) {
			primaryKey = dao.ording(aGro_order);
			primaryKeyList.add(primaryKey);
		}
		return primaryKeyList;
	}
	
	public List<String> getGroup(){
		
		List<Gro_orderVO> gro_orderList = dao.getAll();
		Map<String, List<Gro_orderVO>> groupMap = new HashMap<>();
		List<String> groList = new ArrayList<String>();
		
		groupMap = gro_orderList.stream()
				.collect(Collectors.groupingBy(Gro_orderVO::getGro_id));
		
		groupMap.forEach((k, v) -> {
			groList.add(k);
		});
		
		groList.sort(Comparator.comparing(String::toString));
		
		return groList;
	}
	
}
