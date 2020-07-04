package com.favpost.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.util.*;
import com.favpost.model.*;
import com.post.model.*;

//@WebServlet("/FavpostServlet")
public class FavpostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String listOnePost = 		"/front-end/post/listOnePost.jsp";
		String listOwnedFavpost = 	"/front-end/favpost/listOwnedFavpost.jsp";
		String select_pageP = 		"/front-end/post/select_page.jsp";
		
		if ("insert".equals(action)) {
			// 收藏文章
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			FavpostVO favpostVO = null;
			PostVO postVO = null;
			
			try {
				/***************************1.接收請求參數****************************************/
				String mem_id = req.getParameter("mem_id").trim();
				String post_id = req.getParameter("post_id").trim();
				
				favpostVO = new FavpostVO();
				favpostVO.setMem_id(mem_id);
				favpostVO.setPost_id(post_id);
				PostService postSvc = new PostService();
				postVO = postSvc.getOnePost(post_id);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("favpostVO", favpostVO);
					RequestDispatcher failureView = req.getRequestDispatcher(listOnePost);
					failureView.forward(req, res);
				}
				
				/***************************2.開始新增資料***************************************/
				FavpostService favpostSvc = new FavpostService();
				favpostVO = favpostSvc.addFavpost(mem_id, post_id);
				
				/***************************3.新增完成,準備轉交(Send the Success view)*************/
				req.setAttribute("postVO", postVO);
				req.setAttribute("favpostVO", favpostVO);
				RequestDispatcher successView = req.getRequestDispatcher(listOnePost);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/

			} catch (Exception e) {
				req.setAttribute("postVO", postVO);
				req.setAttribute("favpostVO", favpostVO);
				errorMsgs.add("新增資料失敗： " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(listOnePost);
				failureView.forward(req, res);
			}
			
			
		}
		
		
		if ("delete".equals(action)) {
			// 取消收藏文章
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			PostVO postVO = null;
			FavpostVO favpostVO = null;
			
			try {
				/***************************1.接收請求參數***************************************/
				String mem_id = req.getParameter("mem_id");
				String post_id = req.getParameter("post_id");
				favpostVO = new FavpostVO();
				favpostVO.setMem_id(mem_id);
				favpostVO.setPost_id(post_id);
				PostService postSvc = new PostService();
				postVO = postSvc.getOnePost(post_id);
				
				/***************************2.開始刪除資料***************************************/
				// 取消收藏文章
				FavpostService favpostSvc = new FavpostService();
				favpostSvc.deleteFavpost(mem_id, post_id);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/
				req.setAttribute("postVO", postVO);
				RequestDispatcher successView = req.getRequestDispatcher(listOnePost);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/

			
			} catch (Exception e) {
				req.setAttribute("postVO", postVO);
				req.setAttribute("favpostVO", favpostVO);
				errorMsgs.add("刪除資料失敗： " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(listOnePost);
				failureView.forward(req, res);
			}
		}
		
		
		
		
	}

}
