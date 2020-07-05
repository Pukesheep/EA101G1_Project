package com.adm.logincontroller;
import com.adm.model.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginhandler")
public class LoginHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

   //�i�ˬd��J���b���B�K�X�O�_���ġj
  protected boolean allowUser(String adm_acco, String adm_pass) {
	  
	  AdmService admSvc = new AdmService();
	  AdmVO admVo = admSvc.loginByAcco(adm_acco);
	  String account = admVo.getAdm_acco();
	  String password = admVo.getAdm_pass();
	  if(!adm_pass.matches(password)) {
		  return false;
	  }
	  else {return true;}
  }
  
  public void doPost(HttpServletRequest req, HttpServletResponse res)
                                throws ServletException, IOException {
    req.setCharacterEncoding("Big5");
    res.setContentType("text/html; charset=Big5");
    PrintWriter out = res.getWriter();

    // �i���o�b���B �K�X�j
    String adm_acco = req.getParameter("adm_acco");
    String adm_pass = req.getParameter("adm_pass");

    // �i�ˬd�b�� , �K�X�O�_���ġj
    if (!allowUser(adm_acco, adm_pass)) {//�b�� , �K�X�L��
      out.println("<HTML><HEAD><TITLE>Access Denied</TITLE></HEAD>");
      out.println("<BODY>�A���b�� , �K�X�L��!<BR>");
      out.println("�Ы������s�n�J <A HREF="+req.getContextPath()+"/login.html>���s�n�J</A>");
      out.println("</BODY></HTML>");
    }else {                                       
      HttpSession session = req.getSession();
      session.setAttribute("adm_acco", adm_acco);   //�bsession�����w�g�n�J�L������
      
       try {                                                        
         String location = (String) session.getAttribute("location");
         if (location != null) {
           session.removeAttribute("location");   
           res.sendRedirect(location);            
           return;
         }
       }catch (Exception ignored) { }

      res.sendRedirect(req.getContextPath()+"/front-end/login/login.jsp");  //*�p�L�ӷ�����:�h���ɦ�login.jsp)
    }
  }
}