package com.immed.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.immed.model.*;

@MultipartConfig
public class ImmedServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if (req.getParameter("immedID") != null) {								// 圖片.標題超連結至單一商品資訊頁面
			String immed_id = req.getParameter("immedID");
			ImmedService immedSvc = new ImmedService();
			ImmedVO immedVO = immedSvc.getOneImmed(immed_id);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
			req.setAttribute("immedVO", immedVO); // 資料庫取出的immedVO物件,存入req
			String url = "listOneImmed.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneImmed.jsp
			successView.forward(req, res);
		}
		
//		if ("find_By_Immed_Name".equals(action)) { // 來自select_page.jsp的請求
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			try {
//				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
//				String str = req.getParameter("immed_search");
//				
//				if (str == null || (str.trim()).length() == 0) {
//					errorMsgs.add("請輸入直購商品關鍵字");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("select_page.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}
//
////				String immed_name = null;
////				try {
////					immed_name = new String(str);
////				} catch (Exception e) {
////					errorMsgs.add("直購商品編號格式不正確");
////				}
//				// Send the use back to the form, if there were errors
////				if (!errorMsgs.isEmpty()) {
////					RequestDispatcher failureView = req.getRequestDispatcher("select_page.jsp");
////					failureView.forward(req, res);
////					return;// 程式中斷
////				}
//
//				/*************************** 2.開始查詢資料 *****************************************/
//				ImmedService immedSvc = new ImmedService();
//				List<ImmedVO> list = immedSvc.findByImmedName(str);
//				if (list == null) {
//					errorMsgs.add("查無資料");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("select_page.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}
//
//				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
//				req.setAttribute("list", list); // 資料庫取出的immedVO物件,存入req
//				String url = "findByImmedName.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 findByImmedName.jsp
//				successView.forward(req, res);
//
//				/*************************** 其他可能的錯誤處理 *************************************/
//			} catch (Exception e) {
//				errorMsgs.add("無法取得資料:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("select_page.jsp");
//				failureView.forward(req, res);
//			}
//		}

		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String select_page = "/front-end/immed/select_page.jsp";
			String listOneImmed = "/front-end/immed/listOneImmed.jsp";
			

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("immed_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入直購商品編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("select_page.jsp");
					RequestDispatcher failureView = req.getRequestDispatcher(select_page);
					failureView.forward(req, res);
					return;// 程式中斷
				}

				String immed_id = null;
				try {
					immed_id = new String(str);
				} catch (Exception e) {
					errorMsgs.add("直購商品編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("select_page.jsp");
					RequestDispatcher failureView = req.getRequestDispatcher(select_page);
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				ImmedService immedSvc = new ImmedService();
				ImmedVO immedVO = immedSvc.getOneImmed(immed_id);
				if (immedVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("select_page.jsp");
					RequestDispatcher failureView = req.getRequestDispatcher(select_page);
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("immedVO", immedVO); // 資料庫取出的immedVO物件,存入req
				String url = "listOneImmed.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneImmed.jsp
				RequestDispatcher successView = req.getRequestDispatcher(listOneImmed); // 成功轉交 listOneImmed.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("select_page.jsp");
				RequestDispatcher failureView = req.getRequestDispatcher(select_page);
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllImmed.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String select_page = "";
			String update_immed_input = "";
			String listAllImmed = "";
			
			String from = req.getParameter("from");
			if ("back-end".equals(from)) {
				select_page = 			"/back-end/immed/select_page.jsp";
				update_immed_input = 	"/back-end/immed/update_immed_input.jsp";
				listAllImmed = 			"/back-end/immed/listAllImmed.jsp";
			} else if ("front-end".equals(from)) {
				select_page = 			"/front-end/immed/select_page.jsp";
				update_immed_input = 	"/front-end/immed/update_immed_input.jsp";
				listAllImmed = 			"/front-end/immed/listAllImmed.jsp";
			}

			try {
				/*************************** 1.接收請求參數 ****************************************/
				String immed_id = new String(req.getParameter("immed_id"));

				/*************************** 2.開始查詢資料 ****************************************/
				ImmedService immedSvc = new ImmedService();
				ImmedVO immedVO = immedSvc.getOneImmed(immed_id);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("immedVO", immedVO); // 資料庫取出的immedVO物件,存入req
				String url = "update_immed_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(update_immed_input);// 成功轉交 update_immed_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(listAllImmed);
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String select_page = "";
			String update_immed_input = "";
			String listAllImmed = "";
			
			String from = req.getParameter("from");
			if ("back-end".equals(from)) {
				select_page = 			"/back-end/immed/select_page.jsp";
				update_immed_input = 	"/back-end/immed/update_immed_input.jsp";
				listAllImmed = 			"/back-end/immed/listAllImmed.jsp";
			} else if ("front-end".equals(from)) {
				select_page = 			"/front-end/immed/select_page.jsp";
				update_immed_input = 	"/front-end/immed/update_immed_input.jsp";
				listAllImmed = 			"/front-end/immed/listAllImmed.jsp";
			}

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String immed_id = req.getParameter("immed_id");
//				System.out.println(immed_id);
				String sale_id = req.getParameter("sale_id");
//				System.out.println(sale_id);
				String buy_id = req.getParameter("buy_id");
//				System.out.println(buy_id);
				String pt_id = req.getParameter("pt_id");
//				System.out.println(pt_id);
				String immed_name = req.getParameter("immed_name");
//				System.out.println(immed_name);
				Integer immed_prc = new Integer(req.getParameter("immed_prc"));
//				System.out.println(immed_prc);

				byte[] immed_pic = null;
				Part immedpicPart = req.getPart("immed_pic");
				java.io.InputStream in = immedpicPart.getInputStream();
//				System.out.println(in.available()); //測試InputStream用
				if (in.available() > 0) {
					immed_pic = new byte[in.available()];
					in.read(immed_pic);
					in.close();
				} else {
					ImmedService immedSvc = new ImmedService();
					ImmedVO immedVO = immedSvc.getOneImmed(immed_id);
					immed_pic = immedVO.getImmed_pic();
				}

//				System.out.println(immed_pic);
				String immed_desc = req.getParameter("immed_desc");
//				System.out.println(immed_desc);
				Integer immed_sold = new Integer(req.getParameter("immed_sold"));
//				System.out.println(immed_sold);
				Integer immed_down = new Integer(req.getParameter("immed_down"));
//				System.out.println(immed_down);
				Timestamp ord_time = null;
				try {
					if (req.getParameter("ord_time") == null || req.getParameter("ord_time").trim().length() == 0)
						ord_time = null;
					else
						ord_time = java.sql.Timestamp.valueOf(req.getParameter("ord_time"));
				} catch (IllegalArgumentException e) {
					ord_time = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入訂單時間!");
				}
//				System.out.println(ord_time);
				String ordstat_id = req.getParameter("ordstat_id");
//				System.out.println(ordstat_id);

				String rcpt_name = req.getParameter("rcpt_name");
//				System.out.println(rcpt_name);
//				String rcptNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
//				if (rcpt_name == null || rcpt_name.trim().length() == 0) {
//					errorMsgs.add("收件人姓名請勿空白");
//				} 
//				else if (!rcpt_name.trim().matches(rcptNameReg)) { // 以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("收件人姓名只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
//				}

				String rcpt_cell = req.getParameter("rcpt_cell");
//				System.out.println(rcpt_cell);
				String rcpt_add = req.getParameter("rcpt_add");
//				System.out.println(rcpt_add);
//				String addReg = "(?<zipcode>(^\\d{5}|^\\d{3})?)(?<city>\\D+?[縣市])(?<region>\\D+?(市區|鎮區|鎮市|[鄉鎮市區]))?(?<village>\\D+?[村裡])?(?<neighbor>\\d+[鄰])?(?<road>\\D+?(村路|[路街道段]))?(?<section>\\D?段)?(?<lane>\\d+巷)?(?<alley>\\d+弄)?(?<no>\\d+號?)?(?<seq>-\\d+?(號))?(?<floor>\\d+樓)?(?<others>.+)?";
//				if (rcpt_add == null || rcpt_add.trim().length() == 0) {
//					errorMsgs.add("收件人地址請勿空白");
//				} else if (!rcpt_name.trim().matches(addReg)) { // 以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("收件人地址不正確");
//				}
//
//				String job = req.getParameter("job").trim();
//				if (job == null || job.trim().length() == 0) {
//					errorMsgs.add("職位請勿空白");
//				}
//
//				Double sal = null;
//				try {
//					sal = new Double(req.getParameter("sal").trim());
//				} catch (NumberFormatException e) {
//					sal = 0.0;
//					errorMsgs.add("薪水請填數字.");
//				}
//
//				Double comm = null;
//				try {
//					comm = new Double(req.getParameter("comm").trim());
//				} catch (NumberFormatException e) {
//					comm = 0.0;
//					errorMsgs.add("獎金請填數字.");
//				}

//				Integer deptno = new Integer(req.getParameter("deptno").trim());

				ImmedVO immedVO = new ImmedVO();
//				immedVO.setSale_id(sale_id);
				immedVO.setBuy_id(buy_id);
				immedVO.setPt_id(pt_id);
				immedVO.setImmed_name(immed_name);
				immedVO.setImmed_prc(immed_prc);
				immedVO.setImmed_pic(immed_pic);
				immedVO.setImmed_desc(immed_desc);
				immedVO.setImmed_sold(immed_sold);
				immedVO.setImmed_down(immed_down);
				immedVO.setOrd_time(ord_time);
				immedVO.setOrdstat_id(ordstat_id);
				immedVO.setRcpt_name(rcpt_name);
				immedVO.setRcpt_cell(rcpt_cell);
				immedVO.setRcpt_add(rcpt_add);
				immedVO.setImmed_id(immed_id);
//				immedVO.setJob(job);
//				immedVO.setHiredate(hiredate);
//				immedVO.setSal(sal);
//				immedVO.setComm(comm);
//				immedVO.setDeptno(deptno);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("immedVO", immedVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher(update_immed_input);
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ImmedService immedSvc = new ImmedService();
				immedVO = immedSvc.updateImmed(buy_id, pt_id, immed_name, immed_prc, immed_pic, immed_desc, immed_sold,
						immed_down, ord_time, ordstat_id, rcpt_name, rcpt_cell, rcpt_add, immed_id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("immedVO", immedVO); // 資料庫update成功後,正確的的immedVO物件,存入req
				String url = "listAllImmed.jsp"; // listOneImmed.jsp
				RequestDispatcher successView = req.getRequestDispatcher(listAllImmed); // 修改成功後,轉交listOneImmed.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(listAllImmed); // update_immed_input.jsp
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { // 來自addImmed.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String select_page = "";
			String update_immed_input = "";
			String listAllImmed = "";
			String addImmed = "";
			
			String from = req.getParameter("from");
			if ("back-end".equals(from)) {
				select_page = 			"/back-end/immed/select_page.jsp";
				update_immed_input = 	"/back-end/immed/update_immed_input.jsp";
				listAllImmed = 			"/back-end/immed/listAllImmed.jsp";
				addImmed = 				"/back-end/immed/addImmed.jsp";
			} else if ("front-end".equals(from)) {
				select_page = 			"/front-end/immed/select_page.jsp";
				update_immed_input = 	"/front-end/immed/update_immed_input.jsp";
				listAllImmed = 			"/front-end/immed/listAllImmed.jsp";
				addImmed = 				"/front-end/immed/addImmed.jsp";
			}			

//			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String sale_id = req.getParameter("sale_id");
				if (sale_id == null || sale_id.trim().length() == 0) {
					errorMsgs.add("賣家編號請勿空白");
				}

				String pt_id = req.getParameter("pt_id");

				String immed_name = req.getParameter("immed_name");
				if (immed_name == null || immed_name.trim().length() == 0) {
					errorMsgs.add("商品名稱請勿空白");
				}

				Integer immed_prc = null;
				try {
					immed_prc = new Integer(req.getParameter("immed_prc").trim());
					if (immed_prc <= 0) {
						immed_prc = 0;
						errorMsgs.add("商品價錢要大於零");
					}
				} catch (NumberFormatException e) {
					immed_prc = 0;
					errorMsgs.add("商品價錢請輸入數字");
				}

				byte[] immed_pic = null;
				Part immed_picPart = req.getPart("immed_pic");
				java.io.InputStream in = immed_picPart.getInputStream();
//				System.out.println(in.available()); //測試InputStream用
				if (in.available() > 0) {
					immed_pic = new byte[in.available()];
					in.read(immed_pic);
					in.close();
				}

				String immed_desc = req.getParameter("immed_desc");
				if (immed_desc == null || immed_desc.trim().length() == 0) {
					errorMsgs.add("商品描述請勿空白");
				}

//				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
//				if (ename == null || ename.trim().length() == 0) {
//					errorMsgs.add("員工姓名: 請勿空白");
//				} else if (!ename.trim().matches(enameReg)) { // 以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
//				}
//
//				String job = req.getParameter("job").trim();
//				if (job == null || job.trim().length() == 0) {
//					errorMsgs.add("職位請勿空白");
//				}
//
//				java.sql.Date hiredate = null;
//				try {
//					hiredate = java.sql.Date.valueOf(req.getParameter("hiredate").trim());
//				} catch (IllegalArgumentException e) {
//					hiredate = new java.sql.Date(System.currentTimeMillis());
//					errorMsgs.add("請輸入日期!");
//				}
//
//				Double sal = null;
//				try {
//					sal = new Double(req.getParameter("sal").trim());
//				} catch (NumberFormatException e) {
//					sal = 0.0;
//					errorMsgs.add("薪水請填數字.");
//				}
//
//				Double comm = null;
//				try {
//					comm = new Double(req.getParameter("comm").trim());
//				} catch (NumberFormatException e) {
//					comm = 0.0;
//					errorMsgs.add("獎金請填數字.");
//				}

//				Integer deptno = new Integer(req.getParameter("deptno").trim());
//
				ImmedVO immedVO = new ImmedVO();
				immedVO.setSale_id(sale_id);
				immedVO.setPt_id(pt_id);
				immedVO.setImmed_name(immed_name);
				immedVO.setImmed_prc(immed_prc);
				immedVO.setImmed_pic(immed_pic);
				immedVO.setImmed_desc(immed_desc);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("immedVO", immedVO); // 含有輸入格式錯誤的immedVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher(addImmed);
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				ImmedService immedSvc = new ImmedService();
				immedVO = immedSvc.addImmed(sale_id, pt_id, immed_name, immed_prc, immed_pic, immed_desc);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "listAllImmed.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(listAllImmed); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher(addImmed);
//				failureView.forward(req, res);
//			}
		}
//
		if ("delete".equals(action)) { // 來自listAllImmed.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			String select_page = "";
			String update_immed_input = "";
			String listAllImmed = "";
			String addImmed = "";
			
			String from = req.getParameter("from");
			if ("back-end".equals(from)) {
				select_page = 			"/back-end/immed/select_page.jsp";
				update_immed_input = 	"/back-end/immed/update_immed_input.jsp";
				listAllImmed = 			"/back-end/immed/listAllImmed.jsp";
				addImmed = 				"/back-end/immed/addImmed.jsp";
			} else if ("front-end".equals(from)) {
				select_page = 			"/front-end/immed/select_page.jsp";
				update_immed_input = 	"/front-end/immed/update_immed_input.jsp";
				listAllImmed = 			"/front-end/immed/listAllImmed.jsp";
				addImmed = 				"/front-end/immed/addImmed.jsp";
			}						
			
			try {
				/*************************** 1.接收請求參數 ***************************************/
				String immed_id = new String(req.getParameter("immed_id"));

				/*************************** 2.開始刪除資料 ***************************************/
				ImmedService immedSvc = new ImmedService();
				immedSvc.deleteImmed(immed_id);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "listAllImmed.jsp"; // select_page.jsp
				RequestDispatcher successView = req.getRequestDispatcher(listAllImmed);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(listAllImmed);
				failureView.forward(req, res);
			}
		}
	}
}
