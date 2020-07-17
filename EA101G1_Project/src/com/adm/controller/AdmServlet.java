package com.adm.controller;

import java.io.*;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adm.model.AdmService;
import com.adm.model.AdmVO;
import com.member.controller.MailService;
import com.post.model.PostService;
import com.post.model.PostVO;
import com.psac.model.*;


public class AdmServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("select_One_Adm".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("adm_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入管理員編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/protected/adm/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				String adm_no = null;
				try {
					adm_no = str;
				} catch (Exception e) {
					errorMsgs.add("員工編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/protected/adm/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				AdmService admSv = new AdmService();
				AdmVO admVO = admSv.getOneAdm(adm_no);
				if (admVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/protected/adm/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("admVO", admVO); // 資料庫取出的AdmVO物件,存入req
				String url = "/back-end/protected/adm/listOneAdm.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneAdm.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/protected/adm/select_page.jsp");
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
				String adm_no = req.getParameter("adm_no");
				
				/***************************2.開始查詢資料****************************************/
				AdmService admSvc = new AdmService();
				AdmVO admVO = admSvc.getOneAdm(adm_no);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("admVO", admVO);         // 資料庫取出的admVO物件,存入req
				String url = "/back-end/adm/update_adm_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_adm_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/protected/adm/listAllAdm.jsp");
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
				String adm_no = req.getParameter("adm_no").trim();
				
				String adm_acco = req.getParameter("adm_acco").trim();
				if (adm_acco == null || adm_acco.trim().length() == 0) {
					errorMsgs.add("員工帳號請勿空白");
				}	
				
				String adm_pass = req.getParameter("adm_pass").trim();
				if (adm_pass == null || adm_pass.trim().length() == 0) {
					errorMsgs.add("員工密碼請勿空白");
				}	
				
				String adm_name = req.getParameter("adm_name").trim();
				if (adm_name == null || adm_name.trim().length() == 0) {
					errorMsgs.add("員工姓名請勿空白");
				}	

				Integer adm_state = null;
				try{
					adm_state = new Integer(req.getParameter("adm_state").trim());
				}catch(NumberFormatException e) {
					adm_state= 0;
					errorMsgs.add("檢舉狀態請填數字");
				}	
				
				AdmVO admVO = new AdmVO();
				admVO.setAdm_no(adm_no);
				admVO.setAdm_acco(adm_acco);
				admVO.setAdm_pass(adm_pass);
				admVO.setAdm_name(adm_name);
				admVO.setAdm_state(adm_state);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("admVO", admVO); 
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/adm/update_adm_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				AdmService admSvc = new AdmService();
				admVO = admSvc.updateAdm(adm_no, adm_acco,adm_pass,
						adm_name,adm_state);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("admVO", admVO); // 資料庫update成功後,正確的的admVO物件,存入 req
				String url = "/back-end/protected/adm/listAllAdm.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listAllAdm.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/adm/update_adm_input.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) {   
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			List<String> successMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("successMsgs", successMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				
				String adm_acco = req.getParameter("adm_acco").trim();
				if (adm_acco == null || adm_acco.trim().length() == 0) {
					errorMsgs.add("員工帳號請勿空白");
				}
				
				String adm_pass = genAuthCode();
				
				String adm_name = req.getParameter("adm_name").trim();
				if (adm_name == null || adm_name.trim().length() == 0) {
					errorMsgs.add("員工姓名請勿空白");
				}
				
				AdmVO admVO = new AdmVO();
				admVO.setAdm_acco(adm_acco);
				admVO.setAdm_pass(adm_pass);
				admVO.setAdm_name(adm_name);
				admVO.setAdm_state(1);
				
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("admVO", admVO); // 含有輸入格式錯誤的admVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/protected/adm/addAdm.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				AdmService admSvc = new AdmService();
				admVO = admSvc.addAdm(adm_acco, adm_pass, adm_name, 1);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/back-end/protected/adm/addAdm.jsp";
				successMsgs.add("新增成功");
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllAdm.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
				}catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/protected/adm/addAdm.jsp");
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
				String adm_no = req.getParameter("adm_no");
				
				/***************************2.開始刪除資料***************************************/
				AdmService admSvc = new AdmService();
				admSvc.deleteAdm(adm_no);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/back-end/protected/adm/listAllAdm.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/protected/adm/listAllAdm.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("register".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			List<String> successMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("successMsgs", successMsgs);
	
			
			try {
				/***************************1.接收請求參數***************************************/
				String adm_name = req.getParameter("adm_name").trim();
				String adm_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9)]{2,30}$";
				if(adm_name == null || adm_name.trim().length() == 0) {
					errorMsgs.add("無輸入名稱");
				}
				else if(!adm_name.trim().matches(adm_nameReg)) {
					errorMsgs.add("請輸入正確名稱格式");
				}
				
				String adm_acco = req.getParameter("adm_acco").trim();
				String adm_accoReg = "[@.(a-zA-Z0-9)]{2,30}";
				if(adm_acco == null || adm_acco.trim().length() == 0) {
					errorMsgs.add("無輸入帳號");
				} 
				else if(!adm_acco.trim().matches(adm_accoReg)) {
					errorMsgs.add("請輸入正確帳號格式");
				}
				
				String adm_pass = genAuthCode();
				Integer adm_state = new Integer(1);
				
				AdmVO admVO = new AdmVO();
				admVO.setAdm_name(adm_name);
				admVO.setAdm_acco(adm_acco);
				admVO.setAdm_pass(adm_pass);
				admVO.setAdm_state(adm_state);
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/adm/addAdministrator.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/************************************************/
				AdmService admSvc = new AdmService();
				admVO = admSvc.register(adm_name, adm_acco, adm_pass, adm_state);
				
				String url = "";
				String to = adm_acco;
				String subject = "密碼確認";
				String messageText = adm_name + "您好，您已註冊為S.F.G員工" + adm_pass;
				
				
				sendMail(to, subject, messageText);
				successMsgs.add("註冊成功");
				RequestDispatcher successView = req
						.getRequestDispatcher("/back-end/index.jsp");
				successView.forward(req, res);
				
				/************************************************/
				
			} catch (Exception e) {
				errorMsgs.add("新增資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/adm/addAdministrator.jsp");
				failureView.forward(req, res);
			}
		}
			
			if ("admConfirm".equals(action)) { 
				
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				
				String listAllAdm = "/back-end/protected/adm/listAllAdm.jsp";
				
				try {
					/***************************接收請求參數****************************************/
					String adm_no = req.getParameter("adm_no");
					String adm_acco = req.getParameter("adm_acco");
					String adm_pass = req.getParameter("adm_pass");
					String adm_name = req.getParameter("adm_name");
					Integer adm_state = new Integer(req.getParameter("adm_state"));
					/***************************修改員工狀態****************************************/
					AdmVO admVO = new AdmVO();
					admVO.setAdm_no(adm_no);
					admVO.setAdm_acco(adm_acco);
					admVO.setAdm_pass(adm_pass);
					admVO.setAdm_name(adm_name);
					admVO.setAdm_state(adm_state); 
					
					AdmService admSv = new AdmService();
					admVO = admSv.updateAdm(adm_no,adm_acco, adm_pass, adm_name, adm_state);
									
					/***************************轉交文章頁面****************************************/  
					RequestDispatcher adm = req.getRequestDispatcher(listAllAdm);
					adm.forward(req, res);
				} catch (Exception e) {
					errorMsgs.add("修改資料失敗： " + e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher(listAllAdm);
					failureView.forward(req, res);
				}
					
		}
			
			
			
	
}
	public static String genAuthCode() {
		char[] codePool = new char[62];
		char alpha = 48;
		String authCode = "";
		for (int i = 0; i <= 9; i++) {
			codePool[i] = alpha;
			alpha++;
		}
		alpha = 65;
		for (int i = 10; i <= 35; i++) {
			codePool[i] = alpha;
			alpha++;
		}
		alpha = 97;
		for (int i = 36; i < codePool.length; i++) {
			codePool[i] = alpha;
			alpha++;
		}
		for (int i = 1; i <= 8; i++) {
			char co = codePool[(int)(Math.random() * 62)];
			authCode += co;
		}
		return authCode;
	}
	
	

public static void sendMail(String to, String subject, String messageText) {
		
		try {
			
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			
			final String myGmail = "ea101g1test@gmail.com";
			final String myGmail_password = "ea101g1g1";
			Session session = Session.getInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(myGmail, myGmail_password);
				}
			});
			
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(myGmail));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			
			
			message.setSubject(subject);
			
			message.setText(messageText);
			
			Transport.send(message);
			
		} catch (MessagingException e) {
			System.out.println("傳送失敗！");
			e.printStackTrace();
		}
	}
}


	
	


	
	

