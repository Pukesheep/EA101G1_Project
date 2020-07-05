package com.feat.controller;

import java.io.*;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.feat.model.FService;
import com.feat.model.FVO;

public class FeatServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("select_One_Feat".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("f_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入功能編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/feat/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				String f_no = null;
				try {
					f_no = str;
				} catch (Exception e) {
					errorMsgs.add("功能編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/feat/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				FService fSv = new FService();
				FVO fVO = fSv.getOneF(f_no);
				if (fVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/feat/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("fVO", fVO); // 資料庫取出的FVO物件,存入req
				String url = "/back-end/feat/listOneFeat.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneFeat.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/feat/select_page.jsp");
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
				String f_no = req.getParameter("f_no");
				
				/***************************2.開始查詢資料****************************************/
				FService fSvc = new FService();
				FVO fVO = fSvc.getOneF(f_no);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("fVO", fVO);         // 資料庫取出的fVO物件,存入req
				String url = "/back-end/feat/update_feat_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_feat_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/feat/listAllFeat.jsp");
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
				String f_no = req.getParameter("f_no").trim();
				
				String f_type = req.getParameter("f_type").trim();
				if (f_type == null || f_type.trim().length() == 0) {
					errorMsgs.add("功能性質請勿空白");
				}	
				
				FVO fVO = new FVO();
				fVO.setF_no(f_no);
				fVO.setF_type(f_type);
		
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("fVO", fVO); 
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/feat/update_feat_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				FService admSvc = new FService();
				fVO = admSvc.updateF(f_no, f_type);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("fVO", fVO); // 資料庫update成功後,正確的的fVO物件,存入 req
				String url = "/back-end/feat/listOneFeat.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneFeat.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/feat/update_feat_input.jsp");
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
				
				String f_type = req.getParameter("f_type").trim();
				if (f_type == null || f_type.trim().length() == 0) {
					errorMsgs.add("功能性質請勿空白");
				}
				
				FVO fVO = new FVO();
				fVO.setF_type(f_type);
				
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("fVO", fVO); // 含有輸入格式錯誤的fVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/feat/addFeat.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				FService fSvc = new FService();
				fVO = fSvc.addF(f_type);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/back-end/feat/listAllFeat.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllFeat.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
				}catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/feat/addFeat.jsp");
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
				String f_no = req.getParameter("f_no");
				
				/***************************2.開始刪除資料***************************************/
				FService fSvc = new FService();
				fSvc.deleteF(f_no);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/back-end/feat/listAllFeat.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/feat/listAllFeat.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
	
	

