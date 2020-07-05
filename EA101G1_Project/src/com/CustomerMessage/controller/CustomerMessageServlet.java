package com.CustomerMessage.controller;

import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.CustomerMessage.model.*;
@MultipartConfig

public class CustomerMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

				Timestamp cm_time = new Timestamp(System.currentTimeMillis());
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
				String str = sdf.format(cm_time);
//		        cm_time=Timestamp.valueOf(str);
//		        System.out.println(str);
//				System.out.println(cm_time);

				Integer cm_status = new Integer(req.getParameter("cm_status"));

				Part pic = req.getPart("cm_pic");
				InputStream in = pic.getInputStream();
				byte[] cm_pic = new byte[in.available()];
				in.read(cm_pic);
				in.close();

				String cm_word = req.getParameter("cm_word");
				String cm_customerid = req.getParameter("cm_customerid").trim();

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/CustomerMessage/addCMessage.jsp");
					failureView.forward(req, res);
					return;
				}

//				/***************************2.開始新增資料***************************************/
				CustomerMessageService cumSvc = new CustomerMessageService();
				cumSvc.addCMessage(cm_time, cm_word, cm_pic, cm_status, cm_customerid);

//				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/back-end/CustomerMessage/listALL.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
//				
//				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				System.out.println("insert err");
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/CustomerMessage/addCMessage.jsp");
				failureView.forward(req, res);
			}
		}

		if ("get_One".equals(action)) { 
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				String str = req.getParameter("cm_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("id不得為空");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/CustomerMessage/change_page.jsp");
					failureView.forward(req, res);
					return;
				}
				String cm_id = new String(str);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/CustomerMessage/change_page.jsp");
					failureView.forward(req, res);
					return;
				}
				/***************************
				 * 2.
				 *****************************************/
				CustomerMessageService cumSvc = new CustomerMessageService();
				CustomerMessageVO cumVO = cumSvc.getOneCMessage(cm_id);
				if (cumVO == null) {
					errorMsgs.add("�d�L���");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/CustomerMessage/change_page.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 3 *************/
				req.setAttribute("cumVO", cumVO);
				String url = "/back-end/CustomerMessage/listOneCMessage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/****************************************************************/
			} catch (Exception e) {
				errorMsgs.add("其他" + e.getMessage());
				System.out.println("getOne err");
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/CustomerMessage/change_page.jsp");
				failureView.forward(req, res);
			}
		}


		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/**** 1 ********/
				String cm_id = req.getParameter("cm_id");

				java.sql.Timestamp cm_time=java.sql.Timestamp.valueOf(req.getParameter("cm_time"));
				
				String cm_word = req.getParameter("cm_word");
				
				
				byte[] cm_pic = null;
				Part part = req.getPart("cm_pic");
				InputStream in = part.getInputStream();

				if (in.available() > 0) {
					cm_pic = new byte[in.available()];
					in.read(cm_pic);
					in.close();
				} else {
					CustomerMessageService cumSvc = new CustomerMessageService();
					CustomerMessageVO cumVO = cumSvc.getOneCMessage(cm_id);
					cm_pic = cumVO.getCm_pic();
				}
				
				Integer cm_status = new Integer(req.getParameter("cm_status").trim());
				System.out.println(req.getParameter("cm_customerid"));
				String cm_customerid=new String(req.getParameter("cm_customerid"));
				CustomerMessageVO cumVO = new CustomerMessageVO();
				cumVO.setCm_id(cm_id);
				cumVO.setCm_time(cm_time);
				cumVO.setCm_word(cm_word);
				cumVO.setCm_pic(cm_pic);
				cumVO.setCm_status(cm_status);
				cumVO.setCm_customerid(cm_customerid);
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("cumVO", cumVO); // �t����J�榡���~��proVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/CustomerMessage/update.jsp");
					failureView.forward(req, res);
					return; // �{�����_
				}

				
				/***************************/
				CustomerMessageService cumSvc = new CustomerMessageService();
				cumVO = cumSvc.updateCMessage(cm_word,cm_pic, cm_status, cm_id);
				
				/**********************************/
				req.setAttribute("cumVO", cumVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
				String url = "/back-end/CustomerMessage/listOneCMessage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("其他" + e.getMessage());
				System.out.println("update err");
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/CustomerMessage/update.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllEmp.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				String cm_id = new String(req.getParameter("cm_id"));
				
				/***************************2.�}�l�d�߸��****************************************/
				CustomerMessageService cumSvc = new CustomerMessageService();
				CustomerMessageVO cumVO = cumSvc.getOneCMessage(cm_id);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("cumVO", cumVO);         
				String url = "/back-end/CustomerMessage/update.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_emp_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/CustomerMessage/listALL.jsp");
				failureView.forward(req, res);
			}
		}

	}

}
