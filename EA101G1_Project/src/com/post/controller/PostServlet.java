package com.post.controller;

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import com.post.model.*;

//@WebServlet("/PostServlet")
@MultipartConfig
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		// 來自 select_page.jsp 的請求
		if ("getOne_For_Display".equals(action)) {
			// Store this set in the request scope, in case we need
			// send the ErrorPage view.
			java.util.List<String> errorMsgs = new java.util.LinkedList<String>();
			
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("post_id");
				String strReg = "^POST[(0-9)]{6}$";
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入文章編號");
				} else if (!str.matches(strReg)) {
					errorMsgs.add("文章編號： 請輸入正確格式");
				}
				
				String post_id = null;
				try {
					post_id = new String(str.toString());
				} catch (Exception e) {
					errorMsgs.add("文章編號格式不正確");
				}
				// Send the user back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/post/select_page.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				PostService postSvc = new PostService();
				PostVO postVO = postSvc.getOnePost(post_id);
				if (postVO.getPost_id() == null) {
					errorMsgs.add("查無資料");
				}
				// Send the user back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/post/select_page.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("postVO", postVO); // 資料庫取出的 postVO 物件, 存入 req
				String url = "/front-end/post/listOnePost.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料： " + e.getMessage());
				javax.servlet.RequestDispatcher failureView = req.getRequestDispatcher("/front-end/post/select_page.jsp");
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
				String post_id = req.getParameter("post_id").trim();
				String mem_id = req.getParameter("mem_id").trim();
//				String mem_idReg = "^[(a-zA-Z0-9)]{2,30}$";
//				if (mem_id == null || mem_id.trim().length() == 0) {
//					errorMsgs.add("會員編號： 請勿空白");
//				} else if (!mem_id.trim().matches(mem_idReg)) {
//					errorMsgs.add("會員編號： 只能是英文字母(含大小寫)、數字 , 且長度必須在2到30之間");
//				} 
				
				Integer ptype_id = null;
				try {
					ptype_id = new Integer(req.getParameter("ptype_id").trim());
					
				} catch (NumberFormatException e) {
					// 歸類到閒聊
					ptype_id = 3;
					errorMsgs.add("文章類型編號： 請輸入文章類型編號");
				}
				
				Integer p_status = null;
				try {
					p_status = new Integer(req.getParameter("p_status").trim());
					
				} catch (NumberFormatException e) {
					// 狀態 0 為隱藏
					p_status = 0;
					errorMsgs.add("文章狀態： 請輸入文章狀態");
				}
				
				String p_title = req.getParameter("p_title").trim();
//				String p_titleReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9)]{2,50}$";
				if (p_title == null || p_title.trim().length() == 0) {
					errorMsgs.add("文章標題： 請勿空白");
				} 
//				else if (!p_title.trim().matches(p_titleReg)) {
//					errorMsgs.add("文章標題： 只能是中、英文字母(含大小寫)、數字和_ , 且長度在2到30之間");
//				}
				
				String text = req.getParameter("text").trim();
				if (text == null || text.trim().isEmpty()) {
					errorMsgs.add("文章內容： 請勿空白");
				} 
				
				byte[] image = getPartByteArray(req);
				if (image.length == 0) {
					// 上傳圖片的大小為 0 , 則取出資料庫該筆資料的圖片取代成要修改的圖片
					PostService psv = new PostService();
					PostVO postVODB = psv.getOnePost(post_id);
					byte[] imageDB = postVODB.getImage();
					image = imageDB;
				}
				
				
				
				java.sql.Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
//				long nowLong = now.getTime();
//				java.sql.Timestamp last_edit = null;
//				try {
//					last_edit = java.sql.Timestamp.valueOf(req.getParameter("last_edit").trim());
//					long inputLong = last_edit.getTime();
//					if (inputLong - nowLong >= 0) {
//						// 輸入的日期是現在之後(未來)
////						last_edit = now;
//						last_edit = new java.sql.Timestamp(System.currentTimeMillis());
//						errorMsgs.add("最後修改時間： 請輸入正確的時間");
//					}
//					
//				} catch (IllegalArgumentException e) {
////					last_edit = now;
//					last_edit = new java.sql.Timestamp(System.currentTimeMillis());
//					errorMsgs.add("最後修改時間： 請輸入時間");
//				}
////				
//				java.sql.Timestamp post_time = null;
//				try {
//					post_time = java.sql.Timestamp.valueOf(req.getParameter("post_time").trim());
//					long inputLong = post_time.getTime();
//					if (inputLong - nowLong >= 0) {
//						// 輸入的日期是現在之後(未來)
//						post_time = now;
//						post_time = new java.sql.Timestamp(System.currentTimeMillis());
//						errorMsgs.add("發文時間： 請輸入正確的時間");
//					}
//				} catch (IllegalArgumentException e) {
////					post_time = now;
//					post_time = new java.sql.Timestamp(System.currentTimeMillis());
//					errorMsgs.add("發文時間： 請輸入發文時間");
//				}
				
				PostVO postVO = new PostVO();
				postVO.setPost_id(post_id);
				postVO.setMem_id(mem_id);
				postVO.setPtype_id(ptype_id);
				postVO.setP_status(p_status);
				postVO.setP_title(p_title);
				postVO.setText(text);
				postVO.setImage(image);
//				postVO.setLast_edit(last_edit);
//				postVO.setPost_time(post_time);
				
				// Send the user back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("postVO", postVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/post/listAllPost.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}
				
				/***************************2.開始修改資料***************************************/
				PostService postSvc = new PostService();
				postVO = postSvc.updatePost(post_id, mem_id, 
						ptype_id, p_status, p_title, text, image, now, now);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
//				postVO = postSvc.getOnePost(post_id);
				req.setAttribute("postVO", postVO);
				String url = "/front-end/post/listAllPost.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗： " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/post/listAllPost.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllPost.jsp 的請求
			java.util.List<String> errorMsgs = new java.util.LinkedList<String>();
			// Store this set in the request scope, in case we need to 
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String post_id = req.getParameter("post_id");
				
				/***************************2.開始查詢資料****************************************/
				PostService postSvc = new PostService();
				PostVO postVO = postSvc.getOnePost(post_id);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				
				req.setAttribute("postVO", postVO); // 資料庫取出的 postVO 物件, 存入 req
				String url = "/front-end/post/update_post_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 update_post_input.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料： " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/post/listOnePost.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		
		
		
		
		if ("insert".equals(action)) { // 來自 addPost.jsp 的請求
			
			java.util.List<String> errorMsgs = new java.util.LinkedList<String>();
			// Store this set in the request scope, in case we need
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			PostVO postVO = null;
			
			try {
				/***************************1.接收請求參數****************************************/
				String mem_id = req.getParameter("mem_id").trim();
				
				Integer ptype_id = null;
				try {
					ptype_id = new Integer(req.getParameter("ptype_id").trim());
					
				} catch (NumberFormatException e) {
					// 歸類到閒聊
					ptype_id = 3;
					errorMsgs.add("請輸入文章類型編號");
				}
				
				Integer p_status = null;
				try {
					p_status = new Integer(req.getParameter("p_status").trim());
					
				} catch (NumberFormatException e) {
					// 狀態 0 為隱藏
					p_status = 0;
					errorMsgs.add("請輸入文章狀態");
				}
				
				String p_title = req.getParameter("p_title").trim();
				if (p_title == null || p_title.trim().length() == 0) {
					errorMsgs.add("文章標題： 請勿空白");
				} 
				
				String text = req.getParameter("text").trim();
//				String textReg = "[(\u4e00-\u9fa5)(a-zA-Z0-9)]";
				if (text == null || text.trim().isEmpty()) {
					errorMsgs.add("文章內容： 請勿空白");
				} 
				
				byte[] image = getPartByteArray(req);
				
				java.sql.Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
//				long nowLong = now.getTime();
//				java.sql.Timestamp last_edit = null;
//				try {
//					last_edit = java.sql.Timestamp.valueOf(req.getParameter("last_edit").trim());
//					long inputLong = last_edit.getTime();
//					if (inputLong - nowLong >= 0) {
//						// 輸入的日期是現在之後(未來)
////						last_edit = now;
//						last_edit = new java.sql.Timestamp(System.currentTimeMillis());
//						errorMsgs.add("最後修改時間： 請輸入正確的時間");
//					}
//					
//				} catch (IllegalArgumentException e) {
////					last_edit = now;
//					last_edit = new java.sql.Timestamp(System.currentTimeMillis());
//					errorMsgs.add("最後修改時間： 請輸入時間" + e.getMessage());
//				}
//				
//				java.sql.Timestamp post_time = null;
//				try {
//					post_time = java.sql.Timestamp.valueOf(req.getParameter("post_time").trim());
//					long inputLong = post_time.getTime();
//					if (inputLong - nowLong >= 0) {
//						// 輸入的日期是現在之後(未來)
////						post_time = now;
//						post_time = new java.sql.Timestamp(System.currentTimeMillis());
//						errorMsgs.add("發文時間： 請輸入正確的時間");
//					}
//					
//				} catch (IllegalArgumentException e) {
////					post_time = now;
//					post_time = new java.sql.Timestamp(System.currentTimeMillis());
//					errorMsgs.add("發文時間： 請輸入發文時間");
//				}
				
				
				postVO = new PostVO();
				postVO.setMem_id(mem_id);
				postVO.setPtype_id(ptype_id);
				postVO.setP_status(p_status);
				postVO.setP_title(p_title);
				postVO.setText(text);
				postVO.setImage(image);
				postVO.setLast_edit(now);
				postVO.setPost_time(now);
//				postVO.setLast_edit(last_edit);
//				postVO.setPost_time(post_time);
				
				// Send the user back to the from, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("postVO", postVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/post/listAllPost.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}
				
				/***************************2.開始新增資料***************************************/
				PostService postSvc = new PostService();
				postVO = postSvc.addPost(mem_id, ptype_id,
						p_status, p_title, text, image, now, now);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				
				String url = "/front-end/post/listAllPost.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
				
			} catch (Exception e) {
				req.setAttribute("postVO", postVO);
				errorMsgs.add("新增資料失敗： " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/post/listAllPost.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) {
			
			java.util.List<String> errorMsgs = new java.util.LinkedList<String>();
			// Store this set in the request scope, in case we need
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數***************************************/
				String post_id = req.getParameter("post_id");
				
				/***************************2.開始刪除資料***************************************/
				PostService postSvc = new PostService();
				postSvc.deletePost(post_id);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/front-end/post/listAllPost.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗： " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/post/listAllPost.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("remove".equals(action)) {
			
			try {
				/***************************1.接收請求參數***************************************/
				String post_id = req.getParameter("post_id");
				
				/***************************2.開始移除資料***************************************/
				PostService postSvc = new PostService();
				PostVO postVO = postSvc.getOnePost(post_id);
				postSvc.updatePost(post_id, postVO.getMem_id(), postVO.getPtype_id(), 0, postVO.getP_title(), postVO.getText(), postVO.getImage(), postVO.getLast_edit(), postVO.getPost_time());
				
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
	
	public byte[] getPartByteArray(HttpServletRequest req) throws ServletException, IOException {
		
		Part part = req.getPart("image"); // Servlet3.0 新增了 Part 介面，讓我們方便地進行檔案上傳處理
		
		java.io.InputStream in = part.getInputStream();
		byte[] buf = new byte[in.available()];
		in.read(buf);
		in.close();
		
		return buf;
	}
	
}
