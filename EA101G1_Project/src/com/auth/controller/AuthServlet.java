package com.auth.controller;

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
import com.adm.model.AdmService;
import com.adm.model.AdmVO;
import com.auth.model.AuthService;
import com.auth.model.AuthVO;
import com.psac.model.*;


public class AuthServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("select_One_Auth".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("adm_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入管理員編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/auth/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				String adm_no = null;
				try {
					adm_no = str;
				} catch (Exception e) {
					errorMsgs.add("員工編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/auth/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				AuthService authSv = new AuthService();
				AuthVO authVO = authSv.getOneAuth(adm_no);
				if (authVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/auth/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("authVO", authVO); // 資料庫取出的AuthVO物件,存入req
				String url = "/back-end/auth/listOneAuth.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneAuth.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/auth/select_page.jsp");
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
				String adm_no = req.getParameter("adm_no");
				
				/***************************2.開始查詢資料****************************************/
				AuthService authSvc = new AuthService();
				AuthVO authVO = authSvc.getOneAuth(adm_no);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("authVO", authVO);         // 資料庫取出的authVO物件,存入req
				String url = "/back-end/auth/update_auth_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_adm_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/auth/listAllAuth.jsp");
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
				
				String adm_acco = req.getParameter("adm_acco").trim();
				if (adm_acco == null || adm_acco.trim().length() == 0) {
					errorMsgs.add("員工帳號請勿空白");
				}
				
				String adm_pass = req.getParameter("adm_pass").trim();
				if (adm_pass == null || adm_pass.trim().length() == 0) {
					errorMsgs.add("員工密碼請勿空白");
				}
				
				String adm_name = req.getParameter("adm_name").trim();
				if (adm_name == null || adm_name.trim().length() == 0) {
					errorMsgs.add("員工姓名請勿空白");
				}
				
				Integer adm_state = null;
				try{
					adm_state = new Integer(req.getParameter("adm_state").trim());
				}catch(NumberFormatException e) {
					adm_state= 0;
					errorMsgs.add("員工狀態請填數字");
				}	
				
				AdmVO admVO = new AdmVO();
				admVO.setAdm_acco(adm_acco);
				admVO.setAdm_pass(adm_pass);
				admVO.setAdm_name(adm_name);
				admVO.setAdm_state(adm_state);
				
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("admVO", admVO); // 含有輸入格式錯誤的admVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/adm/addAdm.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				AdmService admSvc = new AdmService();
				admVO = admSvc.addAdm(adm_acco, adm_pass, adm_name, adm_state);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/back-end/adm/listAllAdm.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllAdm.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
				}catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/adm/addAdm.jsp");
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
				String adm_no = req.getParameter("adm_no");
				
				/***************************2.開始刪除資料***************************************/
				AuthService authSvc = new AuthService();
				authSvc.deleteAuth(adm_no);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/back-end/auth/listAllAuth.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/auth/listAllAuth.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
	
	

