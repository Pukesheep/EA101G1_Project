package com.adm.logincontroller;
import com.adm.model.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginhandler")
public class LoginHandler extends HttpServlet {
	
  
  public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
  public void doPost(HttpServletRequest req, HttpServletResponse res)
                                throws ServletException, IOException {
    req.setCharacterEncoding("Big5");
    res.setContentType("text/html; charset=Big5");
    
    String action = req.getParameter("action");
    if ("login".equals(action)) {
    
    List<String> errorMsgs = new LinkedList<String>();
	req.setAttribute("errorMsgs", errorMsgs);
	
	List<String> successMsgs = new LinkedList<String>();
	req.setAttribute("successMsgs", successMsgs);
    
	try {
	
		String adm_acco = req.getParameter("adm_acco").trim();
		if (adm_acco == null || adm_acco.trim().length() == 0) {
			errorMsgs.add("請輸入員工帳號");
		}
		String adm_pass = req.getParameter("adm_pass");
		if (adm_pass == null || adm_pass.trim().length() == 0) {
			errorMsgs.add("請輸入員工密碼");
		}
		
		if (!errorMsgs.isEmpty()) {
			RequestDispatcher failureView = req.getRequestDispatcher("/back-end/login.jsp");
			failureView.forward(req, res);
			return;
		}
		
		//驗證//
		
		HttpSession session = req.getSession();

		if (!allowUser(adm_acco, adm_pass,session)) {
			
			errorMsgs.add("帳號或密碼無效");
			RequestDispatcher failureView = req.getRequestDispatcher("/back-end/login.jsp");
			failureView.forward(req, res);
		}else {                                       
      
			try {
				String location = (String) session.getAttribute("location");
				if (location != null) {
					session.removeAttribute("location");
					res.sendRedirect(location);
					return;
				} 
				
			} catch (Exception ignored) {
				ignored.printStackTrace(System.err);
			}
			successMsgs.add("登入成功");
			RequestDispatcher successView = req.getRequestDispatcher("/back-end/index.jsp");
			successView.forward(req, res);
			
		}
	} catch (Exception ignored) {
		ignored.printStackTrace(System.err);
	}
    }
    
    if ("logout".equals(action)) {
		
		HttpSession session = req.getSession();
		
		try {
			session.removeAttribute("admVO");
			
		} catch (Exception ignored) {
			ignored.printStackTrace(System.err);
		}
		
		RequestDispatcher back = req.getRequestDispatcher("/back-end/index.jsp");
		back.forward(req, res);
	}
	
  }
  
  
    protected boolean allowUser(String adm_acco, String adm_pass, HttpSession session) {
  	  
  	  AdmService admSvc = new AdmService();
  	  AdmVO admVO = admSvc.loginByAcco(adm_acco);
  	  
  	  if (admVO.getAdm_pass() == null) {
  			return false;
  	  } else if (!adm_pass.matches(admVO.getAdm_pass())) {
  			return false;
  	  }else {
  		  session.setAttribute("admVO",admVO);
  		  return true;
  	  }  
  
  }
}
      
       