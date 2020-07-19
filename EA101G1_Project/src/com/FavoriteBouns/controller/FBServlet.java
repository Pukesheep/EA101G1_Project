package com.FavoriteBouns.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.BounsMall.model.*;
import com.FavoriteBouns.model.*;

public class FBServlet extends HttpServlet {
	
	public void doGet (HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException {
		doPost(req, res );
	}
	
	public void doPost (HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
//		if ( "getOneForDisplay".equals(action) ) {
//			List<String> errorMsgs = new LinkedList<String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//			String success = "/back-end/FavoriteBouns/ListOne.jsp";
//			String fail = "/back-end/FavoriteBouns/selete_page.jsp";
//			
//			try {
//				String mem_id = req.getParameter("mem_id");
//				if ( mem_id == null || mem_id.trim().length() == 0 ) {
//					errorMsgs.add("請輸入會員資料");
//				}
//				String bon_id = req.getParameter("bon_id");
//				if ( bon_id == null || bon_id.trim().length() == 0 ) {
//					errorMsgs.add("請輸入商品資料");
//				}
//				
//				FBDAO dao = new FBDAO();
//				FBVO fbVO = dao.findByPrimaryKey(mem_id, bon_id);
//				if ( fbVO == null ) {
//					errorMsgs.add("查無資料");
//				}
//				
//				if ( !errorMsgs.isEmpty() ) {
//					RequestDispatcher failureView = req.getRequestDispatcher(fail);
//					failureView.forward(req, res);
//					return ;
//				}
//				
//				req.setAttribute("fbVO", fbVO);
//				RequestDispatcher successView = req.getRequestDispatcher(success);
//				successView.forward(req, res);
//				
//			} catch ( Exception e ) {
//				errorMsgs.add( "無法取得資料" + e.getMessage() );
//				RequestDispatcher failureView = req.getRequestDispatcher(fail);
//				failureView.forward(req, res);
//			}
//		}
		
		if ( "getAllByMember".equals(action) ) {
			List<FBVO> list = new ArrayList<FBVO>();
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String success = "/back-end/FavoriteBouns/ListByMember.jsp";
			String fail = "/back-end/FavoriteBouns/select_page.jsp";
			
			try {
				String mem_id = req.getParameter("mem_id");
				
				FBService fbSvc = new FBService();
				list = fbSvc.getMemFB(mem_id);
				
				req.setAttribute("list", list);
				req.setAttribute("mem_id", mem_id);
				RequestDispatcher successView = req.getRequestDispatcher(success);
				successView.forward(req, res);
				
			} catch ( Exception e ) {
				RequestDispatcher failureView = req.getRequestDispatcher(fail);
				failureView.forward(req, res);
			}
		}
		
		if ( "insert".equals(action) ) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String success = "/back-end/FavoriteBouns/ListAll.jsp";
			String fail = "/back-end/FavoriteBouns/select_page.jsp";
			
			try {
				String mem_id = req.getParameter("mem_id");
				if ( mem_id == null || mem_id.trim().length() == 0 ) {
					errorMsgs.add("請輸入會員資料");
				}
				String bon_id = req.getParameter("bon_id");
				if ( bon_id == null || bon_id.trim().length() == 0 ) {
					errorMsgs.add("請輸入商品資料");
				}
				
				FBVO fbVO = new FBVO();
				
				fbVO.setMem_id(mem_id);
				fbVO.setBon_id(bon_id);
				
				if ( !errorMsgs.isEmpty() ) {
					req.setAttribute("fbVO", fbVO);
					RequestDispatcher failureView = req.getRequestDispatcher(fail);
					failureView.forward(req, res);
					return ;
				}
				
				FBService fbSvc = new FBService();
				fbVO = fbSvc.addFB(mem_id, bon_id);
				RequestDispatcher successView = req.getRequestDispatcher(success);
				successView.forward(req, res);
				
			} catch ( Exception e ) {
				RequestDispatcher failureView = req.getRequestDispatcher(fail);
				failureView.forward(req, res);
			}
		}
		
		if ( "delete".equals(action) ) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String success = "/back-end/FavoriteBouns/ListAll.jsp";
			String fail = "/back-end/FavoriteBouns/ListAll.jsp";

			try {
				String mem_id = req.getParameter("mem_id");
				String bon_id = req.getParameter("bon_id");
				
				FBService fbSvc = new FBService();
				fbSvc.deleteFB(mem_id, bon_id);
				
				RequestDispatcher successView = req.getRequestDispatcher(success);
				successView.forward(req, res);
			} catch ( Exception e ) {
				errorMsgs.add( "資料刪除失敗" + e.getMessage() );
				RequestDispatcher failureView = req.getRequestDispatcher(fail);
				failureView.forward(req, res);
			}
		}
		

		if ( "favorite".equals(action) ) {
			List<FBVO> list = new ArrayList<FBVO>();
			List<String> errorMsgs = new LinkedList<String>();
			List<String> successMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("successMsgs", successMsgs);
			String success = "/front-end/protected/BounsMall/listOneBouns.jsp";
			String login = "/front-end/member/login.jsp";
			String fail = "/front-end/protected/BounsMall/listOneBouns.jsp";
			
			try {
				String mem_id = req.getParameter("mem_id");
				if ( mem_id == null || mem_id.trim().length() == 0 ) {
					errorMsgs.add("請登入會員");
				}
				String bon_id = req.getParameter("bon_id");
				
				if ( !errorMsgs.isEmpty() ) {
					RequestDispatcher loginureView = req.getRequestDispatcher(login);
					loginureView.forward(req, res);
					return;
				}
				
				FBDAO dao = new FBDAO();
				FBVO fbVO = new FBVO();
				FBService fbSvc = new FBService();
				
				fbVO = dao.findByPrimaryKey(mem_id, bon_id);
				if ( fbVO == null ) {
					fbVO = fbSvc.addFB(mem_id, bon_id);
					successMsgs.add( "成功新增" );
				} else {
					fbSvc.deleteFB(mem_id, bon_id);
					successMsgs.add( "取消最愛" );
				}
				
				BMService bmSvc = new BMService();
				BMVO bmVO = bmSvc.getByPK(bon_id);
				
				list = fbSvc.getMemFB(mem_id);
				
				req.setAttribute("list", list);
				req.setAttribute("mem_id", mem_id);
				req.setAttribute("bon_id", bon_id);
				req.setAttribute("bmVO", bmVO);
				
				RequestDispatcher successView = req.getRequestDispatcher(success);
				successView.forward(req, res);
				
			} catch ( Exception e ) {
				RequestDispatcher failureView = req.getRequestDispatcher(fail);
				failureView.forward(req, res);
			}
		}
		
		if ( "cancel".equals(action) ) {
			List<FBVO> list = new ArrayList<FBVO>();
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String success = "/front-end/protected/BounsMall/listFavoriteByMember.jsp";
			String fail = "/front-end/protected/BounsMall/listFavoriteByMember.jsp";

			try {
				String mem_id = req.getParameter("mem_id");
				String bon_id = req.getParameter("bon_id");
				
				FBService fbSvc = new FBService();
				fbSvc.deleteFB(mem_id, bon_id);

				list = fbSvc.getMemFB(mem_id);
				
				req.setAttribute("list", list);
				req.setAttribute("mem_id", mem_id);
				RequestDispatcher successView = req.getRequestDispatcher(success);
				successView.forward(req, res);
				
			} catch ( Exception e ) {
				errorMsgs.add( "資料刪除失敗" + e.getMessage() );
				
				String mem_id = req.getParameter("mem_id");
				
				FBService fbSvc = new FBService();
				
				list = fbSvc.getMemFB(mem_id);
				
				req.setAttribute("list", list);
				req.setAttribute("mem_id", mem_id);
				RequestDispatcher failureView = req.getRequestDispatcher(fail);
				failureView.forward(req, res);
			}
		}
		
		if ( "getAllByMemberFront".equals(action) ) {
			List<FBVO> list = new ArrayList<FBVO>();
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String success = "/front-end/protected/BounsMall/listFavoriteByMember.jsp";
			String fail = "/front-end/protected/BounsMall/listAllBouns.jsp";
			
			try {
				String mem_id = req.getParameter("mem_id");
				
				FBService fbSvc = new FBService();
				list = fbSvc.getMemFB(mem_id);
				
				req.setAttribute("list", list);
				req.setAttribute("mem_id", mem_id);
				RequestDispatcher successView = req.getRequestDispatcher(success);
				successView.forward(req, res);
				
			} catch ( Exception e ) {
				RequestDispatcher failureView = req.getRequestDispatcher(fail);
				failureView.forward(req, res);
			}
		}
	}
}
