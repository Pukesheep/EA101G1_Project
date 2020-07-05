package com.rebate.controller;

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

import com.rebate.model.RebateService;
import com.rebate.model.RebateVO;

public class RebateServlet extends HttpServlet {

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
				String str = req.getParameter("reb_No").trim();
				if (str == null || str.trim().length() == 0) {
					errorMsgs.add("欄位請勿空白");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/rebate/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				String reb_No = null;
				try {
					reb_No = new String(str);
				} catch (Exception e) {
					errorMsgs.add("會員編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/rebate/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 2.開始查詢資料 *****************************************/
				RebateService rebSvc = new RebateService();
				RebateVO rebVO = rebSvc.getOneRebate(reb_No);
				if (rebVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/rebate/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("rebVO", rebVO); // 資料庫取出的memVO物件,存入req
				String url = "/back-end/rebate/listOneReb.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOnemem.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/rebate/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				String reb_No = new String(req.getParameter("reb_No"));
			
				/*************************** 2.開始查詢資料 ****************************************/
				RebateService rebSvc = new RebateService();			
				RebateVO rebVO = rebSvc.getOneRebate(reb_No);
								
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("rebVO", rebVO); // 資料庫取出的empVO物件,存入req
				String url = "/back-end/rebate/update_reb_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				System.out.println("5");
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/rebate/update_reb_input.jsp");
				failureView.forward(req, res);
			}
		}
		if ("update".equals(action)) { // 來自update_reb_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				String reb_No = new String(req.getParameter("reb_No").trim());

				Integer discount = null;
				try {
					discount = new Integer(req.getParameter("discount").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("折扣方案： 請輸入正確的格式");
				}

				String people = req.getParameter("people").trim();
				if (people == null || people.trim().length() == 0) {
					errorMsgs.add("人數請勿空白");
				} else if (!people.trim().matches(people)) {
					errorMsgs.add("人數且長度必需在10位數");
				}

				RebateVO rebVO = new RebateVO();
				rebVO.setReb_No(reb_No);
				rebVO.setDiscount(discount);
				rebVO.setPeople(people);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("rebVO", rebVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/rebate/update_reb_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				RebateService rebSvc = new RebateService();
				rebVO = rebSvc.updateRebate(reb_No, discount, people);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("rebVO", rebVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back-end/rebate/listOneReb.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/rebate/update_reb_input.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

				Integer discount = null;
				try {
					discount = new Integer(req.getParameter("discount").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("折扣方案： 請輸入正確的格式");
				}

				String people = req.getParameter("people").trim();
				if (people == null || people.trim().length() == 0) {
					errorMsgs.add("人數請勿空白");
				} else if (!people.trim().matches(people)) {
					errorMsgs.add("人數且長度必需在10位數");
				}

				RebateVO rebVO = new RebateVO();
				rebVO.setDiscount(discount);
				rebVO.setPeople(people);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("rebVO", rebVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/rebate/addReb.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				RebateService rebSvc = new RebateService();
				rebVO = rebSvc.addRebate(discount, people);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("rebVO", rebVO);
				String url = "/back-end/rebate/listAllReb.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/rebate/addReb.jsp");
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
				String reb_No = new String(req.getParameter("reb_No"));

				/*************************** 2.開始刪除資料 ***************************************/
				RebateService rebSvc = new RebateService();
				rebSvc.deleteRebate(reb_No);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/back-end/rebate/listAllReb.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/rebate/listAllReb.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
