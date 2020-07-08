package com.product.controller;

import java.util.List;

import com.product.model.ProService;
import com.product.model.ProVO;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ProService svc = new ProService();
		
		List<ProVO> list = svc.getAll();
		String keyword = "sw";
		
		List<ProVO> list2 = svc.getByKeyWord(keyword, list);
		
		for(ProVO provo : list2) {
			System.out.println(provo.getP_id());
		}
	}

}
