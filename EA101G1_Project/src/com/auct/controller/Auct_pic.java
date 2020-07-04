package com.auct.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.auct.model.AuctService;
import com.auct.model.AuctVO;

public class Auct_pic extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		ServletOutputStream out = res.getOutputStream();
		res.setContentType("image/gif");
		String auct_id = req.getParameter("auct_id");
//		HttpSession session = req.getSession();
		
		if(req.getAttribute(auct_id)==null) {
			AuctService auctSvc = new AuctService();
			AuctVO auctVO = auctSvc.listOneAuct(auct_id);
			req.setAttribute(auct_id,auctVO.getAuct_pic());
		}
		out.write((byte[])req.getAttribute(auct_id));

	}


}
