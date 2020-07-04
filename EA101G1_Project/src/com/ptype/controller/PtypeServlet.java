package com.ptype.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import com.ptype.model.*;

//@WebServlet("/PtypeServlet")
public class PtypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String listAllPtype = "/front-end/ptype/listAllPtype.jsp";
		
		if ("insert".equals(action)) {
			// 新增文章種類
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			PtypeVO ptypeVO = null;
			
			try {
				/***************************1.接收請求參數****************************************/
				String type = req.getParameter("type");
				
				ptypeVO = new PtypeVO();
				ptypeVO.setType(type);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("ptypeVO", ptypeVO);
					RequestDispatcher failureView = req.getRequestDispatcher(listAllPtype);
					failureView.forward(req, res);
				}
				
				/***************************2.開始新增資料***************************************/
				PtypeService ptypeSvc = new PtypeService();
				ptypeVO = ptypeSvc.addPtype(type);
				
				/***************************3.新增完成,準備轉交(Send the Success view)*************/
				req.setAttribute("ptypeVO", ptypeVO);
				RequestDispatcher successView = req.getRequestDispatcher(listAllPtype);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
				
			} catch (Exception e) {
				req.setAttribute("ptypeVO", ptypeVO);
				errorMsgs.add("新增資料失敗： " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(listAllPtype);
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) {
			// 刪除文章分類
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			PtypeVO ptypeVO = null;
			
			try {
				/***************************1.接收請求參數***************************************/
				Integer ptype_id = null;
				try {
					ptype_id = new Integer(req.getParameter("ptype_id"));
				} catch (NumberFormatException e) {
					errorMsgs.add("文章種類編號： 請輸入正確格式" + e.getMessage());
				}
				ptypeVO.setPtype_id(ptype_id);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("ptypeVO", ptypeVO);
					RequestDispatcher failureView = req.getRequestDispatcher(listAllPtype);
					failureView.forward(req, res);
					
				}
				
				/***************************2.開始刪除資料***************************************/
				PtypeService ptypeSvc = new PtypeService();
				ptypeSvc.deletePtype(ptype_id);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/
				RequestDispatcher successView = req.getRequestDispatcher(listAllPtype);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/

				
			} catch (Exception e) {
				req.setAttribute("ptypeVO", ptypeVO);
				errorMsgs.add("刪除資料失敗： " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(listAllPtype);
				failureView.forward(req, res);
			}
			
			
		}
		
		
		
	}

}
