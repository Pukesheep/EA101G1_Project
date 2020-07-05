package com.gro_order.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.apache.naming.java.javaURLContextFactory;

import com.gro_order.model.*;

//@WebServlet("/Gro_OrderServlet")
public class Gro_orderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

//			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				
				
				String mem_Id = req.getParameter("mem_Id");
				Timestamp add_Date = new Timestamp(System.currentTimeMillis());				
				String gro_Id = req.getParameter("gro_Id");
				
				String ordstat_Id=req.getParameter("ordstat_Id");
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/gro_order/addG_order.jsp");
					failureView.forward(req, res);
					return;
				}

//				/***************************2.開始新增資料***************************************/
				Gro_orderService g_orderSvc = new Gro_orderService();
				g_orderSvc.addGro_order(mem_Id, ordstat_Id, gro_Id, add_Date);

//				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/back-end/gro_order/listAll.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
//				
//				/***************************其他可能的錯誤處理**********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				System.out.println("insert err");
//				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/gro_order/addG_order.jsp");
//				failureView.forward(req, res);
//			}
		}
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String ord_Id = new String(req.getParameter("ord_Id"));
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/gro_order/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 2.開始查詢資料 *****************************************/
				Gro_orderService g_orderSvc = new Gro_orderService();
				
				Gro_orderVO g_orderVO=g_orderSvc.getOneGro_Order(ord_Id);
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/gro_order/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("g_orderVO", g_orderVO); // 資料庫取出的memVO物件,存入req
				String url = "/back-end/gro_order/listOneGro_order.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOnemem.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/gro_order/select_page.jsp");
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
				String ord_id = new String(req.getParameter("ord_Id"));
				
				/***************************2.�}�l�d�߸��****************************************/
				Gro_orderService g_orderSvc = new Gro_orderService();
				Gro_orderVO g_orderVO = g_orderSvc.getOneGro_Order(ord_id);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("g_orderVO", g_orderVO);         // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/back-end/gro_order/update_Gro_order_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/gro_order/listAll.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/**** 1 ********/
				String ord_Id = req.getParameter("ord_Id");

				String mem_Id = req.getParameter("mem_Id");
				
				String ordstat_Id = req.getParameter("ordstat_Id");
				
				String gro_Id = req.getParameter("gro_Id");
				
				java.sql.Timestamp add_Date=java.sql.Timestamp.valueOf(req.getParameter("add_Date"));

				Gro_orderVO g_orderVO = new Gro_orderVO();
				
				g_orderVO.setMem_Id(mem_Id);
				g_orderVO.setOrdstat_Id(ordstat_Id);
				g_orderVO.setGro_Id(gro_Id);
				g_orderVO.setAdd_Date(add_Date);
				g_orderVO.setOrd_Id(ord_Id);
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("g_orderVO", g_orderVO); // �t����J�榡���~��proVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/gro_order/update_Gro_order_input.jsp");
					failureView.forward(req, res);
					return; //
				}
				/***************************/
				Gro_orderService g_orderSvc = new Gro_orderService();
				g_orderVO = g_orderSvc.updateGro_order(mem_Id, ordstat_Id, gro_Id, ord_Id, add_Date);
				
				/**********************************/
				req.setAttribute("g_orderVO", g_orderVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
				String url = "/back-end/gro_order/listOneGro_order.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("其他" + e.getMessage());
				System.out.println("update err");
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/gro_order/update_Gro_order_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				String ord_Id = new String(req.getParameter("ord_Id"));
				
				/***************************2.�}�l�R�����***************************************/
				Gro_orderService g_orderSvc = new Gro_orderService();
				g_orderSvc.deleteGro_Order(ord_Id);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/back-end/gro_order/listAll.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/gro_order/listAllEmp.jsp");
				failureView.forward(req, res);
			}
		}
		
		
	
	}

}
