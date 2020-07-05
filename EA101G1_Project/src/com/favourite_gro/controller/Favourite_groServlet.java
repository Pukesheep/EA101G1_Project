package com.favourite_gro.controller;

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

import com.favourite_gro.model.Favourite_groService;
import com.favourite_gro.model.Favourite_groVO;

public class Favourite_groServlet extends HttpServlet {

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
				String str = req.getParameter("mem_Id").trim();
				if (str == null || str.trim().length() == 0) {
					errorMsgs.add("欄位請勿空白");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/favourite_gro/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				String mem_Id = null;
				try {
					mem_Id = new String(str);
				} catch (Exception e) {
					errorMsgs.add("會員編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/favourite_gro/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 2.開始查詢資料 *****************************************/
				Favourite_groService fgroSvc = new Favourite_groService();
				Favourite_groVO fgroVO = fgroSvc.getOneGroupBuy(mem_Id);
				if (fgroVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/favourite_gro/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("fgroVO", fgroVO); // 資料庫取出的memVO物件,存入req
				String url = "/back-end/favourite_gro/listOneFgro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOnemem.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/favourite_gro/select_page.jsp");
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
				String mem_Id = new String(req.getParameter("mem_Id"));
				/*************************** 2.開始查詢資料 ****************************************/
				Favourite_groService fgroSvc = new Favourite_groService();
				Favourite_groVO fgroVO = fgroSvc.getOneGroupBuy(mem_Id);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("fgroVO", fgroVO); // 資料庫取出的empVO物件,存入req
				String url = "/back-end/favourite_gro/update_fgro_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/favourite_gro/update_fgro_input.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自update_Gro_input.jsp的請求
			System.out.println("1");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				
				String mem_Id = req.getParameter("mem_Id");
				String mem_IdReg = "[(a-zA-Z0-9)]{1,10}";
				if (mem_IdReg == null || mem_IdReg.trim().length() == 0) {
					errorMsgs.add("會員編號:");
				}
				
				String gro_Id = new String(req.getParameter("gro_Id").trim());


				Favourite_groVO fgroVO = new Favourite_groVO();

				fgroVO.setMem_Id(mem_Id);
				fgroVO.setGro_Id(gro_Id);
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("fgroVO", fgroVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/favourite_gro/update_fgro_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				Favourite_groService fgroSvc = new Favourite_groService();
				fgroVO = fgroSvc.updateFavourite_gro(mem_Id,gro_Id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("fgroVO", fgroVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back-end/favourite_gro/listOneFgro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/favourite_gro/update_fgro_input.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { // 來自addEmp.jsp的請求
			System.out.println("123");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String mem_Id = req.getParameter("mem_Id").trim();
				System.out.println(mem_Id);
				if (mem_Id == null || mem_Id.trim().length() == 0) {
					errorMsgs.add("會員編號請勿空白");
				} else if (!mem_Id.trim().matches(mem_Id)) {
					errorMsgs.add("人數且長度必需在10位數");
				}	
				String gro_Id = req.getParameter("gro_Id").trim();
				System.out.println(gro_Id);
				

				Favourite_groVO fgroVO = new Favourite_groVO();
			
				fgroVO.setMem_Id(mem_Id);
				fgroVO.setGro_Id(gro_Id);
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("fgroVO", fgroVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/favourite_gro/addFgro.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				Favourite_groService fgroSvc = new Favourite_groService();
				System.out.println("1");
				fgroVO = fgroSvc.addFavourite_gro(mem_Id,gro_Id);
				System.out.println("2");

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("fgroVO", fgroVO);
				System.out.println("3");
				String url = "/back-end/favourite_gro/listAllFgro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/favourite_gro/addFgro.jsp");
				failureView.forward(req, res);
			}
		}

		
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
//		// Store this set in the request scope, in case we need to
//		// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				String mem_Id = new String(req.getParameter("mem_Id"));
				/*************************** 2.開始刪除資料 ***************************************/
				Favourite_groService fgroSvc = new Favourite_groService();
				fgroSvc.deleteFavourite_gro(mem_Id);
				
				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/back-end/favourite_gro/listAllFgro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/favourite_gro/listAllFgro.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
