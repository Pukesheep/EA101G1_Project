package com.psac.controller;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.psac.model.PsacVO;
import com.psac.model.*;


public class PsacFrontServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		String action = req.getParameter("action");// 來自psac.jsp的請求
		String psac_content="";
		if ("report".equals(action)) {
			String[] sa = req.getParameterValues("reason");
			
			for (String reason : sa) {
				//System.out.println(reason);
				psac_content += reason;
			}
		}
		
		String mem_id = req.getParameter("mem_id");
		String post_id = req.getParameter("post_id");
		System.out.println(mem_id);
		System.out.println(post_id);
		
		
		Integer psac_state = 1;
		
		String adm_no = "ad000005";
				
		PsacVO psacVO = new PsacVO();
		psacVO.setMem_id(mem_id);
		psacVO.setPost_id(post_id);
		psacVO.setAdm_no(adm_no);
		psacVO.setPsac_content(psac_content);
		psacVO.setPsac_state(psac_state);
		
		
				/***************************開始送資料到資料庫*****************************************/
				
				PsacService psacSv = new PsacService();
				psacVO = psacSv.addPsac(mem_id, post_id, adm_no, psac_content, psac_state);
			   
	}
}
		
		
		
//String mem_id = (String)request.getAttribute("mem_id");
//String post_id =(String)request.getAttribute("post_id");
//String adm_no =(String)request.getAttribute("adm_no");
//Integer psac_state =(Integer)request.getAttribute("psac_state");
		


	
	

