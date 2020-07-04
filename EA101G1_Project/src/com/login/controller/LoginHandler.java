package com.login.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.member.model.*;
import com.adm.model.*;

//@WebServlet("/LoginHandler")
public class LoginHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("login".equals(action)) {
			String loginDenied = 	"/front-end/member/login_denied.jsp";
			String loginSuccess = 	"/front-end/member/login_success.jsp";
			String login = 			"/front-end/member/login.jsp";
			String select_page = 	"/front-end/member/select_page.jsp";
			String index = 			"/front-end/index.jsp";
			String indexFront = 	"/front-end/index.jsp";
			String indexBack = 		"/back-end/index.jsp";
			
			java.util.List<String> errorMsgs = new java.util.LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數***************************************/
				
//				String mem_email = req.getParameter("mem_email").trim();
//				String mem_emailReg = "[@.(a-zA-Z0-9)]{2,30}";
//				if (mem_email == null || mem_email.trim().length() == 0) {
//					errorMsgs.add("會員信箱： 請勿空白");
//				} else if (!mem_email.trim().matches(mem_emailReg)) { // 以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("會員信箱： 只能是英文字母(含大小寫)、數字和_ , 且長度必須在2到30之間");
//				} else if (!mem_email.trim().contains("@")) {
//					errorMsgs.add("會員信箱： 請輸入正確的電子信箱格式");
//				}
//				
//				String mem_pass = req.getParameter("mem_pass").trim();
//				String mem_passReg = "^[(a-zA-Z0-9)]{2,30}$";
//				if (mem_pass == null || mem_pass.trim().length() == 0) {
//					errorMsgs.add("會員密碼： 請勿空白");
//				} else if (!mem_pass.trim().matches(mem_passReg)) {
//					errorMsgs.add("會員密碼： 只能是英文字母(含大小寫)、數字, 且長度必須在2到30之間");
//				}
//				
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher(login);
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}
				
				String email = req.getParameter("email").trim();
				String emailReg = "[@.(a-zA-Z0-9)]{2,30}";
				if (email == null || email.trim().length() == 0) {
					errorMsgs.add("會員信箱： 請勿空白");
				} else if (!email.trim().matches(emailReg)) {
					errorMsgs.add("會員信箱： 只能是英文字母(含大小寫)、數字和@ , 且長度必須在2到30之間");
				}
				
				String password = req.getParameter("password").trim();
				String passwordReg = "^[(a-zA-Z0-9)]{2,30}$";
				if (password == null || password.trim().length() == 0) {
					errorMsgs.add("會員密碼： 請勿空白");
				} else if (!password.trim().matches(passwordReg)) {
					errorMsgs.add("會員密碼： 只能是英文字母(含大小寫)、數字, 且長度必須在2到30之間");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher(login);
					failureView.forward(req, res);
					return; // 程式中斷
				}
				
				
				/***************************2.開始驗證***************************************/
//				javax.servlet.http.HttpSession session = req.getSession();
//				
//				if (!allowUser(mem_email, mem_pass, session)){
//					// 帳號或密碼無效時進入的區塊
//					RequestDispatcher login_denied = req.getRequestDispatcher(loginDenied);
//					login_denied.forward(req, res);
//				} else {
//						// 帳號及密碼有效時進入的區塊
//						
//						try {
//							// 嘗試尋找來源網頁
//							String location = (String) session.getAttribute("location");
//							if (location != null) {
//								// 當有來源網頁時, 因為已經取得來源網頁的位置作為區域變數
//								// 所以先把 sessionScope 裡面的來源網頁 (location) 移除, 
//								// 再重導到來源網頁
//								session.removeAttribute("location");
//								res.sendRedirect(location);
//								return;
//							}
//						} catch (Exception ignored) {
//							System.out.println(ignored.getMessage());
//						}
//						RequestDispatcher successView = req.getRequestDispatcher(index);
//						successView.forward(req, res);
//				}
				
				javax.servlet.http.HttpSession session = req.getSession();
				
				if (!allowUser(email, password, session)) {
					// 帳號或密碼無效時進入的區塊
					RequestDispatcher failureView = req.getRequestDispatcher(loginDenied);
					failureView.forward(req, res);
				} else {
					// 帳號或密碼有效時進入的區塊
					
					try {
						// 嘗試尋找來源網頁
						String location = (String) session.getAttribute("location");
						if (location != null) {
							// 當有來源網頁時, 因為已經取得來源網頁的位置作為區域變數
							// 所以先把sessionScope 裡面的來源網頁 (location) 移除, 
							// 再重導到來源網頁
							session.removeAttribute("location");
							res.sendRedirect(location);
							return;
						}
						
					} catch (Exception ignored) {
						System.out.println(ignored.getMessage());
					}
					
					RequestDispatcher successView = req.getRequestDispatcher(index);
					successView.forward(req, res);
					
					
				}
				
			} catch (Exception ignored) {
				System.out.println(ignored.getMessage());
			}
		}
		
		
		if ("logout".equals(action)) {
			
			javax.servlet.http.HttpSession session = req.getSession();
			
			String login = "/front-end/member/login.jsp";
			String index = "/front-end/index.jsp";
			
			try {
				session.removeAttribute("memberVO");
//				session.removeAttribute("admVO");
				
			} catch (Exception ignored) {
				System.out.println(ignored.getMessage());
			}
			
			RequestDispatcher toLogin = req.getRequestDispatcher(index);
			toLogin.forward(req, res);
		}
		
		
	}
	
	protected boolean allowUser(String email, String pass, HttpSession session) {
		
		AdmService admSvc = new AdmService();
		MemberService memberSvc = new MemberService();
		MemberVO memberVO = null;
		
		// 先從管理員 model 尋找是否有吻合的資料,
		// 若空值代表無此管理員, 則改由會員的 model 尋找
		AdmVO admVO = admSvc.loginByAcco(email);
		if (admVO == null) {
			// 找不到 admVO, 改成尋找 memberVO
			memberVO = memberSvc.loginByEmail(email);
		} else if (!pass.matches(admVO.getAdm_pass())) {
			// admVO 不等於空值, 開始核對密碼是否吻合, 密碼不吻合進入的區塊
			return false;
		} else {
			// admVO 不等於空值, 且管理員密碼核對成功的區塊
			session.setAttribute("admVO", admVO);
			return true;
		}
		
		// 上面的 if-else 區塊只有一個分支會繼續執行 -> 查詢會員資料
		if (memberVO == null) {
			// 找不到會員資料
			return false;
		} else if (!pass.matches(memberVO.getMem_pass())) {
			// memberVO 不等於空值, 開始核對密碼是否吻合, 密碼不吻合進入的區塊
			return false;
		} else {
			// memberVO 不等於空值, 且會員密碼核對成功的區塊
			session.setAttribute("memberVO", memberVO);
			return true;
		}
		
	}
	
	
}
