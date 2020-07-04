package com.comm.controller;

import java.io.*;
import java.sql.*;
import java.sql.Date;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.comm.model.*;

//@WebServlet("/CommServlet")
public class CommServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String select_page =			"/front-end/comm/select_page.jsp";
		String listOneComm = 			"/front-end/comm/listOneComm.jsp";
		String listAllComm = 			"/front-end/comm/listAllComm.jsp";
		String update_comm_input = 		"/front-end/comm/update_comm_input.jsp";
		String update_comm_inputP = 	"/front-end/protected/update_comm_input.jsp";
		String addComm = 				"/front-end/comm/addComm.jsp";
		String addCommP = 				"/front-end/protected/addComm.jsp";
		
		if ("getOne_For_Display".equals(action)) {
			// 來自 select_page.jsp 的請求
			
			// Store this set in the request scope, in case we need
			// send the ErrorPage view.
			java.util.List<String> errorMsgs = new java.util.LinkedList<String>();
			
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("comm_id");
				String strReg = "^COMM[(0-9)]{6}$";
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入留言編號");
				} else if (!str.matches(strReg)) {
					errorMsgs.add("留言編號： 請輸入正確格式");
				}
				
				String comm_id = null;
				try {
					comm_id = new String(str.toString());
				} catch (Exception e) {
					errorMsgs.add("留言編號格式不正確");
				}
				
				// Send the user back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher(select_page);
					failureView.forward(req, res);
					return; // 程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				CommService commSvc = new CommService();
				CommVO commVO = commSvc.getOneComm(comm_id);
				if (commVO.getComm_id() == null) {
					errorMsgs.add("查無資料");
				}
				
				// Send the user back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher(select_page);
					failureView.forward(req, res);
					return; // 程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("commVO", commVO); // 資料庫取出的 commVO 物件, 存入 req
				RequestDispatcher successView = req.getRequestDispatcher(listOneComm);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理*************************************/

			} catch (Exception e) {
				errorMsgs.add("無法取得資料： " + e.getMessage());
				
				javax.servlet.RequestDispatcher failureView = req.getRequestDispatcher(select_page);
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) {
			
			java.util.List<String> errorMsgs = new java.util.LinkedList<String>();
			// Store this set in the request scope, in case we need
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String comm_id = req.getParameter("comm_id").trim();
				String post_id = req.getParameter("post_id").trim();
				String mem_id = req.getParameter("mem_id").trim();
				
				Integer c_status = null;
				try {
					c_status = new Integer(req.getParameter("c_status").trim());
				} catch (NumberFormatException e) {
					c_status = 0;
					errorMsgs.add("留言狀態： 請輸入留言狀態");
				}
				
				String c_text = req.getParameter("c_text");
				if (c_text == null || c_text.trim().isEmpty()) {
					errorMsgs.add("留言內容： 請輸入留言內容");
				}
				
				java.sql.Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
//				long nowLong = now.getTime();
//				java.sql.Timestamp last_edit = null;
//				try {
//					last_edit = java.sql.Timestamp.valueOf(req.getParameter("last_edit").trim());
//					long inputLong = last_edit.getTime();
//					if (inputLong - nowLong >= 0) {
//						// 輸入的日期是現在之後 (未來)
//						last_edit = now;
//						errorMsgs.add("最後修改時間： 請輸入正確的時間");
//					}
//					
//				} catch (IllegalArgumentException e) {
//					last_edit = now;
//					errorMsgs.add("最後修改時間： 請輸入時間");
//				}
//				
//				java.sql.Timestamp post_time = null;
//				try {
//					post_time = java.sql.Timestamp.valueOf(req.getParameter("post_time").trim());
//					long inputLong = post_time.getTime();
//					if (inputLong - nowLong >= 0) {
//						post_time = now;
//						errorMsgs.add("留言時間： 請輸入正確的時間");
//					}
//					
//				} catch (IllegalArgumentException e) {
//					post_time = now;
//					errorMsgs.add("留言時間： 請輸入發文時間");
//				}
				
				CommVO commVO = new CommVO();
				commVO.setComm_id(comm_id);
				commVO.setPost_id(post_id);
				commVO.setMem_id(mem_id);
				commVO.setC_status(c_status);
				commVO.setC_text(c_text);
//				commVO.setLast_edit(last_edit);
//				commVO.setPost_time(post_time);
				
				// Send the user back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("commVO", commVO);
					RequestDispatcher failureView = req.getRequestDispatcher(update_comm_input);
					failureView.forward(req, res);
					return; // 程式中斷
				}
				
				/***************************2.開始新增資料***************************************/
				CommService commSvc = new CommService();
				commVO = commSvc.updateComm(comm_id, post_id, mem_id, c_status, c_text, now, now);
				
				/***************************3.新增完成,準備轉交(Send the Success view)*************/
				req.setAttribute("commVO", commVO);
				RequestDispatcher successView = req.getRequestDispatcher(listOneComm);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
	
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗： " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(update_comm_input);
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) {
			// 來自 listAllComm.jsp 的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String comm_id = req.getParameter("comm_id");
				
				/***************************2.開始查詢資料****************************************/
				CommService commSvc = new CommService();
				CommVO commVO = commSvc.getOneComm(comm_id);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("commVO", commVO);
				RequestDispatcher successView = req.getRequestDispatcher(update_comm_input);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/

			} catch (Exception e) {
				errorMsgs.add("無法取得資料： " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(listOneComm);
				failureView.forward(req, res);
			}
		}
		
		
		if ("insert".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String post_id = req.getParameter("post_id").trim();
				String mem_id = req.getParameter("mem_id").trim();
				
				Integer c_status = null;
				try {
					c_status = new Integer(req.getParameter("c_status").trim());
				} catch (NumberFormatException e) {
					c_status = 0;
					errorMsgs.add("留言狀態： 請輸入留言狀態");
				}
				
				String c_text = req.getParameter("c_text");
				if (c_text == null || c_text.trim().isEmpty()) {
					errorMsgs.add("留言內容： 請輸入留言內容");
				}
				
				java.sql.Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
//				long nowLong = now.getTime();
//				java.sql.Timestamp last_edit = null;
//				
//				try {
//					last_edit = java.sql.Timestamp.valueOf(req.getParameter("last_edit").trim());
//					long inputLong = last_edit.getTime();
//					
//					if (inputLong - nowLong >= 0) {
//						last_edit = now;
//						errorMsgs.add("最後修改時間： 請輸入正確的時間");
//					}
//					
//				} catch (IllegalArgumentException e) {
//					last_edit = now;
//					errorMsgs.add("最後修改時間： 請輸入最後修改時間");
//				}
//				
//				java.sql.Timestamp post_time = null;
//				try {
//					post_time = java.sql.Timestamp.valueOf(req.getParameter("post_time").trim());
//					long inputLong = post_time.getTime();
//					if (inputLong - nowLong >= 0) {
//						post_time = now;
//						errorMsgs.add("留言時間： 請輸入正確的時間");
//					}
//					
//					
//				} catch (IllegalArgumentException e) {
//					post_time = now;
//					errorMsgs.add("留言時間： 請輸入發文時間");
//				}
				
				CommVO commVO = new CommVO();
				commVO.setPost_id(post_id);
				commVO.setMem_id(mem_id);
				commVO.setC_status(c_status);
				commVO.setC_text(c_text);
//				commVO.setLast_edit(last_edit);
//				commVO.setPost_time(post_time);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("commVO", commVO);
					RequestDispatcher failureView = req.getRequestDispatcher(update_comm_inputP);
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				CommService commSvc = new CommService();
				commVO = commSvc.addComm(post_id, mem_id, c_status, c_text, now, now);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				req.setAttribute("commVO", commVO);
				RequestDispatcher successView = req.getRequestDispatcher(listOneComm);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/

			} catch (Exception e) {
				errorMsgs.add("新增資料失敗： " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(addComm);
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數***************************************/
				String comm_id = req.getParameter("comm_id");
				
				/***************************2.開始刪除資料***************************************/
				CommService commSvc = new CommService();
				commSvc.deleteComm(comm_id);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				RequestDispatcher successView = req.getRequestDispatcher(listAllComm);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/

			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗： " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(listAllComm);
				failureView.forward(req, res);
			}
		}
		
		
		if ("remove".equals(action)) {
			
			try {
				/***************************1.接收請求參數***************************************/
				String comm_id = req.getParameter("comm_id");
				
				/***************************2.開始移除資料***************************************/
				CommService commSvc = new CommService();
				CommVO commVO = commSvc.getOneComm(comm_id);
				commSvc.updateComm(comm_id, commVO.getPost_id(), commVO.getMem_id(), 0, commVO.getC_text(), commVO.getLast_edit(), commVO.getPost_time());
				
				/***************************3.移除完成,準備轉交(Send the Success view)***********/								
				String url = "/front-end/post/listAllPost.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
				
			} catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/post/listAllPost.jsp");
				failureView.forward(req, res);
			}
			
		}

		
		
		
		
	}

}
