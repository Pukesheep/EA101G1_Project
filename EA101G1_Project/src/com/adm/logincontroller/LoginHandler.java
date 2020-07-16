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
	
  protected boolean allowUser(String adm_acco, String adm_pass, HttpServletRequest req) {
	  //return true;
	  AdmService admSvc = new AdmService();
	  AdmVO admVO = admSvc.loginByAcco(adm_acco);
	
	  String account = admVO.getAdm_acco();
	  String password = admVO.getAdm_pass();
	  if(!adm_pass.matches(password)) {
		  return false;
	  }
	  else {
		  HttpSession session = req.getSession();
		  req.setAttribute("admVO",admVO);
		  session.setAttribute("admVO",admVO);
		  return true;}
  }
  public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
  public void doPost(HttpServletRequest req, HttpServletResponse res)
                                throws ServletException, IOException {
    req.setCharacterEncoding("Big5");
    res.setContentType("text/html; charset=Big5");
    PrintWriter out = res.getWriter();
    
    List<String> successMsgs = new LinkedList<String>();
	// Store this set in the request scope, in case we need to
	// send the ErrorPage view.
	req.setAttribute("successMsgs", successMsgs);
	

    String adm_acco = req.getParameter("adm_acco");
    String adm_pass = req.getParameter("adm_pass");

    if (!allowUser(adm_acco, adm_pass,req)) {
      
      RequestDispatcher failureView = req
				.getRequestDispatcher("/back-end/login.jsp");
		failureView.forward(req, res);
    }else {                                       
      HttpSession session = req.getSession();
      session.setAttribute("adm_acco", adm_acco);   
      
       try {                                                        
         String location = (String) session.getAttribute("location");
         if (location != null) {
           session.removeAttribute("location");   
           res.sendRedirect(location);            
           return;
         }
       }catch (Exception ignored) { }

      successMsgs.add("登入成功");
      RequestDispatcher successView = req
				.getRequestDispatcher("/back-end/index.jsp");
		successView.forward(req, res);
    }
  }
}