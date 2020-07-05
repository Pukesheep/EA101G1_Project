package com.psac.controller;

import java.io.*;
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


public class PsacServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("select_One_Psac".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("psac_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入文章檢舉案編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/psac/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				String psac_no = null;
				try {
					psac_no = str;
				} catch (Exception e) {
					errorMsgs.add("文章檢舉案編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/psac/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				PsacService psacSv = new PsacService();
				PsacVO psacVO = psacSv.getOnePsac(psac_no);
				if (psacVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/psac/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("psacVO", psacVO); // 資料庫取出的PsacVO物件,存入req
				String url = "/back-end/psac/listOnePsac.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOnePsac.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/psac/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String psac_no = req.getParameter("psac_no");
				
				/***************************2.開始查詢資料****************************************/
				PsacService psacSvc = new PsacService();
				PsacVO psacVO = psacSvc.getOnePsac(psac_no);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("psacVO", psacVO);         // 資料庫取出的psacVO物件,存入req
				String url = "/back-end/psac/update_psac_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_psac_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/psac/listAllPsac.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { 
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String psac_no = req.getParameter("psac_no").trim();
				
				String mem_id = req.getParameter("mem_id").trim();
				if (mem_id == null || mem_id.trim().length() == 0) {
					errorMsgs.add("會員編號請勿空白");
				}	
				
				String post_id = req.getParameter("post_id").trim();
				if (post_id == null || post_id.trim().length() == 0) {
					errorMsgs.add("文章編號請勿空白");
				}	
				
				String adm_no = req.getParameter("adm_no").trim();
				if (adm_no == null || adm_no.trim().length() == 0) {
					errorMsgs.add("員工編號請勿空白");
				}	

				String psac_content = req.getParameter("psac_content").trim();
				if (psac_content == null || psac_content.trim().length() == 0) {
					errorMsgs.add("檢舉內容請勿空白");
				}	

				Integer psac_state = null;
				try{
					psac_state = new Integer(req.getParameter("psac_state").trim());
				}catch(NumberFormatException e) {
				    psac_state= 0;
					errorMsgs.add("檢舉狀態請填數字");
				}	
				
				PsacVO psacVO = new PsacVO();
				psacVO.setPsac_no(psac_no);
				psacVO.setMem_id(mem_id);
				psacVO.setPost_id(post_id);
				psacVO.setAdm_no(adm_no);
				psacVO.setPsac_content(psac_content);
				psacVO.setPsac_state(psac_state);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("psacVO", psacVO); 
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/psac/update_psac_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				PsacService psacSvc = new PsacService();
				psacVO = psacSvc.updatePsac(psac_no, mem_id,post_id,
						adm_no,psac_content,psac_state);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("psacVO", psacVO); // 資料庫update成功後,正確的的psacVO物件,存入 req
				String url = "/back-end/psac/listOnePsac.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOnePsac.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/psac/update_psac_input.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) {   
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String mem_id = req.getParameter("mem_id");
	
				if (mem_id == null || mem_id.trim().length() == 0) {
					errorMsgs.add("會員姓名請勿空白");
				}
				
				
				String post_id = req.getParameter("post_id").trim();
				if (post_id == null || post_id.trim().length() == 0) {
					errorMsgs.add("文章編號請勿空白");
				}
				
				String adm_no = req.getParameter("adm_no").trim();
				if (adm_no == null || adm_no.trim().length() == 0) {
					errorMsgs.add("管理員編號請勿空白");
				}
				
				String psac_content = req.getParameter("psac_content").trim();
				if (psac_content == null || psac_content.trim().length() == 0) {
					errorMsgs.add("檢舉內容請勿空白");
				}
				
				Integer psac_state = null;
				try{
					psac_state = new Integer(req.getParameter("psac_state").trim());
				}catch(NumberFormatException e) {
				    psac_state= 0;
					errorMsgs.add("檢舉狀態請填數字");
				}	
				
				PsacVO psacVO = new PsacVO();
				psacVO.setMem_id(mem_id);
				psacVO.setPost_id(post_id);
				psacVO.setAdm_no(adm_no);
				psacVO.setPsac_content(psac_content);
				psacVO.setPsac_state(psac_state);
				
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("psacVO", psacVO); // 含有輸入格式錯誤的psacVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/psac/addPsac.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				PsacService psacSvc = new PsacService();
				psacVO = psacSvc.addPsac(mem_id, post_id, adm_no, psac_content, psac_state);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/back-end/psac/listAllPsac.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllPsac.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
				}catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/psac/addPsac.jsp");
					failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				String psac_no = req.getParameter("psac_no");
				
				/***************************2.開始刪除資料***************************************/
				PsacService psacSvc = new PsacService();
				psacSvc.deletePsac(psac_no);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/back-end/psac/listAllPsac.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/psac/listAllPsac.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
	
	

