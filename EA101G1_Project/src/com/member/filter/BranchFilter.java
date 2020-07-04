package com.member.filter;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebFilter;
import com.member.model.*;
import com.adm.model.*;

//@WebFilter("/BranchFilter")
public class BranchFilter implements Filter {
	
	private FilterConfig config;
	
	public void init(FilterConfig config) {
		this.config = config;
	}

	public void destroy() {
		config = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//		try {
//			// 嘗試尋找來源網頁
//			String location = (String) session.getAttribute("location");
//			if (location != null) {
//				// 當有來源網頁時, 因為已經取得來源網頁的位置作為區域變數
//				// 所以先把sessionScope 裡面的來源網頁 (location) 移除, 
//				// 再重導到來源網頁
//				session.removeAttribute("location");
//				res.sendRedirect(location);
//				return;
//			}
//			
//		} catch (Exception ignored) {
//			System.out.println(ignored.getMessage());
//		}
//		
//		RequestDispatcher successView = req.getRequestDispatcher(index);
//		successView.forward(req, res);
//	}
		
		
		javax.servlet.http.HttpServletRequest req = (HttpServletRequest) request;
		javax.servlet.http.HttpServletResponse res = (HttpServletResponse) response;
		
		String indexFront = "/front-end/index.jsp";
		String indexBack = 	"/back-end/index.jsp";
		
		// 取得 session
		javax.servlet.http.HttpSession session = req.getSession();
		
		// 前一個濾器 (LoginFilter) 已經判斷是否登入過, 這裡進行分流
		// 會員往前台送, 管理員往後台送
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		AdmVO admVO = (AdmVO) session.getAttribute("admVO");
		
		if (admVO != null && memberVO == null) {
			
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
			
			res.sendRedirect(req.getContextPath() + indexBack);
//			RequestDispatcher successView = req.getRequestDispatcher(indexBack);
//			successView.forward(req, res);
			return;
			
		} else if (admVO == null && memberVO != null) {
			
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
			
			res.sendRedirect(req.getContextPath() + indexFront);
//			RequestDispatcher successView = req.getRequestDispatcher(indexFront);
//			successView.forward(req, res);
			return;
		} else {
			chain.doFilter(request, response);
		}
		
	}
}
