package com.groupBuy.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.groupBuy.model.GroupBuyService;
import com.groupBuy.model.GroupBuyVO;

public class GroupBuyServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("gro_Id").trim();
				if (str == null || str.trim().length() == 0) {
					errorMsgs.add("欄位請勿空白");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/groupbuy/select_page.jsp");
					failureView.forward(req, res);							
					return;// 程式中斷
				}

				String gro_Id = null;
				try {
					gro_Id = new String(str);
				} catch (Exception e) {
					errorMsgs.add("會員編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/groupbuy/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 2.開始查詢資料 *****************************************/
				GroupBuyService groSvc = new GroupBuyService();
				GroupBuyVO groVO = groSvc.getOneGroupBuy(gro_Id);
				if (groVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/groupbuy/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("groVO", groVO); // 資料庫取出的memVO物件,存入req
				String url = "/back-end/groupbuy/listOneGro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOnemem.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/groupbuy/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

//			try {
				/*************************** 1.接收請求參數 ****************************************/
				String gro_Id = new String(req.getParameter("gro_Id"));

				/*************************** 2.開始查詢資料 ****************************************/
				GroupBuyService groSvc = new GroupBuyService();
				GroupBuyVO groVO = groSvc.getOneGroupBuy(gro_Id);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("groVO", groVO); // 資料庫取出的empVO物件,存入req
				String url = "/back-end/groupbuy/update_gro_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/groupbuy/listAllGro.jsp");
//				failureView.forward(req, res);
//			}
		}
		if ("update".equals(action)) { // 來自update_Gromem_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

//			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				String gro_Id = new String(req.getParameter("gro_Id").trim());

				String p_Id = req.getParameter("p_Id");
				String p_IdReg = "[(a-zA-Z0-9)]{1,10}";
				if (p_IdReg == null || p_IdReg.trim().length() == 0) {
					errorMsgs.add("商品編號:");
				}
				
				
          		String reb1_No = req.getParameter("reb1_No").trim();
				if (reb1_No == null || reb1_No.trim().length() == 0) {
					errorMsgs.add("折扣請勿空白");
				}

				String reb2_No = req.getParameter("reb2_No").trim();
				if (reb2_No == null || reb2_No.trim().length() == 0) {
					errorMsgs.add("折扣請勿空白");
				}

				String reb3_No = req.getParameter("reb3_No").trim();
				if (reb3_No == null || reb3_No.trim().length() == 0) {
					errorMsgs.add("折扣請勿空白");
				}

				java.sql.Timestamp start_Date = null;
				try {
					start_Date = java.sql.Timestamp.valueOf(req.getParameter("start_Date").trim());
				} catch (IllegalArgumentException e) {
					start_Date = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				java.sql.Timestamp end_Date = null;
				try {
					end_Date = java.sql.Timestamp.valueOf(req.getParameter("end_Date").trim());
				} catch (IllegalArgumentException e) {
					end_Date = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				Integer grotime_Date = null;
//						new Integer(req.getParameter("grotime_Date").trim());
				try {
					grotime_Date = new Integer(req.getParameter("grotime_Date").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("團購狀態： 請輸入正確的格式");
				}
				
				
				Integer status = new Integer(req.getParameter("status").trim());

				String people = req.getParameter("people").trim();
				if (people == null || people.trim().length() == 0) {
					errorMsgs.add("人數請勿空白");
				} else if (!people.trim().matches(people)) {
					errorMsgs.add("人數且長度必需在10位數");
				}

				Integer money = null;
//						new Integer(req.getParameter("money").trim());
				try {
					money = new Integer(req.getParameter("money").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("金額： 請輸入正確格式");
				}
				
				
				GroupBuyVO groVO = new GroupBuyVO();
				groVO.setGro_Id(gro_Id);
				groVO.setP_Id(p_Id);
				groVO.setReb1_No(reb1_No);
				groVO.setReb2_No(reb2_No);
				groVO.setReb3_No(reb3_No);
				groVO.setStart_Date(start_Date);
				groVO.setEnd_Date(end_Date);
				groVO.setGrotime_Date(grotime_Date);
				groVO.setStatus(status);
				groVO.setPeople(people);
				groVO.setMoney(money);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("groVO", groVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/groupbuy/update_gro_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				GroupBuyService groSvc = new GroupBuyService();
				groVO = groSvc.updateGroupBuy(gro_Id, p_Id, reb1_No, reb2_No, reb3_No, start_Date, end_Date,
						grotime_Date, status, people, money);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("groVO", groVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back-end/groupbuy/listOneGro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
//			} catch (Exception e) {
//				errorMsgs.add("修改資料失敗:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/groupbuy/update_gro_input.jsp");
//				failureView.forward(req, res);
//			}
		}

		if ("insert".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

				String p_Id = req.getParameter("p_Id");
				String p_IdReg = "[(a-zA-Z0-9)]{1,10}";
				if (p_IdReg == null || p_IdReg.trim().length() == 0) {
					errorMsgs.add("商品編號:");
				} 
//				else if (!p_IdReg.trim().matches(p_IdReg)) { // 以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("商品編號: 只能是英文字母、數字和_ , 且長度必需在1到10之間");
//				}

				String reb1_No = req.getParameter("reb1_No").trim();
				if (reb1_No == null || reb1_No.trim().length() == 0) {
					errorMsgs.add("折扣請勿空白");
				}

				String reb2_No = req.getParameter("reb2_No").trim();
				if (reb2_No == null || reb2_No.trim().length() == 0) {
					errorMsgs.add("折扣請勿空白");
				}

				String reb3_No = req.getParameter("reb3_No").trim();
				if (reb3_No == null || reb3_No.trim().length() == 0) {
					errorMsgs.add("折扣請勿空白");
				}

				java.sql.Timestamp start_Date = null;
				try {
					start_Date = java.sql.Timestamp.valueOf(req.getParameter("start_Date").trim());
				} catch (IllegalArgumentException e) {
					start_Date = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				java.sql.Timestamp end_Date = null;
				try {
					end_Date = java.sql.Timestamp.valueOf(req.getParameter("end_Date").trim());
				} catch (IllegalArgumentException e) {
					end_Date = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				Integer grotime_Date = null;
//						new Integer(req.getParameter("grotime_Date").trim());
				try {
					grotime_Date = new Integer(req.getParameter("grotime_Date").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("團購狀態： 請輸入正確的格式");
				}
				
				
				Integer status = new Integer(req.getParameter("status").trim());

				String people = req.getParameter("people").trim();
				if (people == null || people.trim().length() == 0) {
					errorMsgs.add("人數請勿空白");
				} else if (!people.trim().matches(people)) {
					errorMsgs.add("人數且長度必需在10位數");
				}

				Integer money = null;
//						new Integer(req.getParameter("money").trim());
				try {
					money = new Integer(req.getParameter("money").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("金額： 請輸入正確格式");
				}
				

				GroupBuyVO groVO = new GroupBuyVO();
				groVO.setP_Id(p_Id);
				groVO.setReb1_No(reb1_No);
				groVO.setReb2_No(reb2_No);
				groVO.setReb3_No(reb3_No);
				groVO.setStart_Date(start_Date);
				groVO.setEnd_Date(end_Date);
				groVO.setGrotime_Date(grotime_Date);
				groVO.setStatus(status);
				groVO.setPeople(people);
				groVO.setMoney(money);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("groVO", groVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/groupbuy/addGro.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				GroupBuyService groSvc = new GroupBuyService();
				groVO = groSvc.addGroupBuy(p_Id, reb1_No, reb2_No, reb3_No, start_Date, end_Date, grotime_Date, status,
						people, money);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("groupBuyVO", groVO);
				String url = "/back-end/groupbuy/listAllGro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/groupbuy/addGro.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				String gro_id = new String(req.getParameter("gro_Id"));

				/*************************** 2.開始刪除資料 ***************************************/
				GroupBuyService groSvc = new GroupBuyService();
				groSvc.deleteGroupBuy(gro_id);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/back-end/groupbuy/listAllGro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/groupbuy/listAllGro.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
