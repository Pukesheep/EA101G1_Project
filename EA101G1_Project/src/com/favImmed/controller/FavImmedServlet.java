package com.favImmed.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.favImmed.model.FavImmedService;
import com.favImmed.model.FavImmedVO;

@MultipartConfig
public class FavImmedServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		String listAllFavImmed = "/front-end/protected/immed/listAllFavImmed.jsp";
		
		if("delete".equals(action)||"delete2".equals(action)) {
			try {
				String immed_id = req.getParameter("immed_id");
				String mem_id = req.getParameter("mem_id");
				
				FavImmedService favImmedSvc = new FavImmedService();
				favImmedSvc.deleteFavImmed(immed_id, mem_id);
//				favImmedSvc.
				String url = "/front-end/immed/immed_index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch(Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher(listAllFavImmed);
				failureView.forward(req, res);
			}
		}
		
		
		if("insert".equals(action)||"insert2".equals(action)) {
			try {
				String immed_id = req.getParameter("immed_id");
				String mem_id = req.getParameter("mem_id");
//				System.out.println(immed_id);
//				System.out.println(mem_id);
				if("guest".equals(mem_id)) {
					String url= "/front-end/member/login.jsp";
					RequestDispatcher failureView = req.getRequestDispatcher(url);
					failureView.forward(req,res);
				}else {
					FavImmedVO favImmedVO = new FavImmedVO();
					favImmedVO.setImmed_id(immed_id);
					favImmedVO.setMem_id(mem_id);
					
					FavImmedService favImmedSvc = new FavImmedService();
					favImmedSvc.addFavImmed(favImmedVO);
					
					String url;
					if("insert".equals(action)) {
					url = "/front-end/immed/immed_index.jsp";
					RequestDispatcher failureView = req.getRequestDispatcher(url);
					failureView.forward(req, res);
					}
				}
			}catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/immed/immed_index.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
