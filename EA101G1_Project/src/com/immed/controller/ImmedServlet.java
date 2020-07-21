package com.immed.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.Comparator;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.immed.model.*;
import com.member.model.MemberVO;

@MultipartConfig
public class ImmedServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

//		if ("getAllBuyImmed".equals(action)) { // 買家商品管理 action
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			try {
//				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
//				HttpSession session = req.getSession();
//				MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
//				/*************************** 2.開始查詢資料 *****************************************/
//				ImmedService immedSvc = new ImmedService();
//				List<ImmedVO> list = immedSvc.getAllBuyerImmed(memberVO.getMem_id());
//				if (list == null) {
//					errorMsgs.add("查無資料");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/protected/immed/immed_index.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}
//				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
//				session.setAttribute("allBuyerImmed_list", list); // 資料庫取出的immedVO物件,存入req
//				String url = "/front-end/protected/immed/buyerManage.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 findByImmedName.jsp
//				successView.forward(req, res);
//
//				/*************************** 其他可能的錯誤處理 *************************************/
//			} catch (Exception e) {
//				errorMsgs.add("無法取得資料:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/immed/immed_index.jsp");
//				failureView.forward(req, res);
//			}

//				List<ImmedVO> BuyerImmedList = new ArrayList<ImmedVO>();
//				for (ImmedVO aImmed : list) {
//					if (aImmed.getBuy_id().equals("M000012") ) {
//						System.out.println(aImmed.getImmed_id());
//						BuyerImmedList.add(aImmed);
//						
//					}
//					
//				}
//				System.out.println(BuyerImmedList.size());
//				BUYERIMMEDLIST = LIST.STREAM().FILTER(E -> E.GETBUY_ID().EQUALS("M000012"))
//						.COLLECT(COLLECTORS.TOLIST());
//
//				SYSTEM.OUT.PRINTLN(BUYERIMMEDLIST.SIZE());
//
//				BUYERIMMEDLIST.STREAM().FOREACH(IMMEDVO::PRINTSUMMARY);

//				if (list == null) {
//					errorMsgs.add("查無資料");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/immed/immed_index.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}

//			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
//				HttpSession session = req.getSession();
//				session.setAttribute("immed_list", list); // 資料庫取出的immedVO物件,存入req
//				String url = "/front-end/immed/findByImmedName.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 findByImmedName.jsp
//				successView.forward(req, res);

//		}

		if ("find_By_Immed_Name".equals(action)) { // 搜尋商品action

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("immed_name_search");
//				System.out.println(str);
//				if (str == null || (str.trim()).length() == 0) {
//					errorMsgs.add("請輸入直購商品關鍵字");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("select_page.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}

//				String immed_name = null;
//				try {
//					immed_name = new String(str);
//				} catch (Exception e) {
//					errorMsgs.add("直購商品編號格式不正確");
//				}
				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("select_page.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}

				/*************************** 2.開始查詢資料 *****************************************/
				ImmedService immedSvc = new ImmedService();
				List<ImmedVO> list = immedSvc.findByImmedName(str);
				if (list == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/immed/immed_index.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				HttpSession session = req.getSession();
				session.setAttribute("immedNameSearch_list", list); // 資料庫取出的immedVO物件,存入req
				String url = "/front-end/immed/findByImmedName.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 findByImmedName.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/immed/immed_index.jsp");
				failureView.forward(req, res);
			}
		}

		if ("find_By_Immed_Type".equals(action)) { // 商品分類搜尋 link action

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("immed_type_search");
//				System.out.println(str);
//				if (str == null || (str.trim()).length() == 0) {
//					errorMsgs.add("請輸入直購商品關鍵字");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("select_page.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}

//				String immed_name = null;
//				try {
//					immed_name = new String(str);
//				} catch (Exception e) {
//					errorMsgs.add("直購商品編號格式不正確");
//				}
				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("select_page.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}

				/*************************** 2.開始查詢資料 *****************************************/
				ImmedService immedSvc = new ImmedService();
				List<ImmedVO> list = immedSvc.findByImmedType(str);
				if (list == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/immed/immed_index.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				HttpSession session = req.getSession();
				session.setAttribute("immedTypeSearch_list", list); // 資料庫取出的immedVO物件,存入req
				session.setAttribute("immedTypeSearchPt_id", str);
				String url = "/front-end/immed/findByImmedType.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 findByImmedName.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/immed/immed_index.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Display".equals(action)) { // 商品圖片 文字 a action

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
//				String immed_id = req.getParameter("immed_id");
//				if (immed_id == null || (str.trim()).length() == 0) {
//					errorMsgs.add("請輸入直購商品編號");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/immed/select_page.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}

				/*************************** 2.開始查詢資料 *****************************************/
				ImmedService immedSvc = new ImmedService();
				ImmedVO immedVO = immedSvc.getOneImmed(req.getParameter("immed_id"));
//				ImmedVO immedVO = immedSvc.getOneImmed(immed_id);
				if (immedVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/immed/immed_index.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("immedVO", immedVO); // 資料庫取出的immedVO物件,存入req
				String url = "/front-end/immed/listOneImmed.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneImmed.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/immed/immed_index.jsp");
				failureView.forward(req, res);
			}
		}

		if ("backEnd_getOne_For_Display".equals(action)) { // 商品圖片 文字 a action

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
//				String immed_id = req.getParameter("immed_id");
//				if (immed_id == null || (str.trim()).length() == 0) {
//					errorMsgs.add("請輸入直購商品編號");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/immed/select_page.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}

				/*************************** 2.開始查詢資料 *****************************************/
				ImmedService immedSvc = new ImmedService();
				ImmedVO immedVO = immedSvc.getOneImmed(req.getParameter("immed_id"));
//				ImmedVO immedVO = immedSvc.getOneImmed(immed_id);
				if (immedVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/immed/listAllImmed.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("immedVO", immedVO); // 資料庫取出的immedVO物件,存入req
				String url = "/back-end/immed/listOneImmed2.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneImmed.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/immed/listAllImmed.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update_OneBuy".equals(action)) { // 立即購買 action

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				String immed_id = new String(req.getParameter("immed_id"));

				/*************************** 2.開始查詢資料 ****************************************/
				ImmedService immedSvc = new ImmedService();
				ImmedVO immedVO = immedSvc.getOneImmed(immed_id);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				HttpSession session = req.getSession();
				session.setAttribute("immedBuyVO", immedVO); // 資料庫取出的immedVO物件,存入req
				String url = "/front-end/protected/immed/immedPay.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_immed_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/immed/immed_index.jsp");
				failureView.forward(req, res);
			}
		}
		if ("getOne_For_Update".equals(action)) { // 修改商品 action 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				String immed_id = new String(req.getParameter("immed_id"));

				/*************************** 2.開始查詢資料 ****************************************/
				ImmedService immedSvc = new ImmedService();
				ImmedVO immedVO = immedSvc.getOneImmed(immed_id);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("immedVO", immedVO); // 資料庫取出的immedVO物件,存入req
				String url = "/front-end/protected/immed/update_immed_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_immed_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/immed/immed_index.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update_one_buy".equals(action)) { // 商品結帳 送出 action

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String immed_id = req.getParameter("immed_id");
				String buy_id = req.getParameter("buy_id");

				String rcpt_name = req.getParameter("rcpt_name");
				String rcpt_cell = req.getParameter("rcpt_cell");

				String card_no = req.getParameter("card_no");
				String card_name = req.getParameter("card_name");
				String card_ym = req.getParameter("card_ym");
				String card_sec = req.getParameter("card_sec");

				String rcptNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (rcpt_name == null || rcpt_name.trim().length() == 0) {
					errorMsgs.add("收件人姓名請勿空白");
				} 
				
//				else if (!rcpt_name.trim().matches(rcptNameReg)) { // 以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("收件人姓名只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
//				}

				String rcptCellReg = "^[((0-9-)]{10}$";
				if (rcpt_cell == null || rcpt_cell.trim().length() == 0) {
					errorMsgs.add("收件人電話請勿空白");
				} else if (!rcpt_cell.trim().matches(rcptCellReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("收件人電話只能是數字");
				}

//				String rcptAddReg = "^[(\u4e00-\u9fa5)(0-9-)]{3,50}$";

				String city = req.getParameter("city");
				String town = req.getParameter("town");
				String add = req.getParameter("add");
				if (city == null || city.trim().length() == 0) {
					errorMsgs.add("請選擇收件人城市");
				}
				if (town == null || town.trim().length() == 0) {
					errorMsgs.add("請選擇收件人區域");
				}
				if (add == null || add.trim().length() == 0) {
					errorMsgs.add("收件人地址請勿空白");
				}
//				else if (!rcpt_add.trim().matches(rcptAddReg)) { // 以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("收件人地址只能是中文、數字和- ");
//				}
				String rcpt_add = city + town + add;

				String cardNoReg = "^[((0-9)]{16}$";
				if (card_no == null || card_no.trim().length() == 0) {
					errorMsgs.add("信用卡卡號請勿空白");
				} else if (!card_no.trim().matches(cardNoReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("信用卡卡號請輸入16位數字");
				}

				if (card_name == null || card_name.trim().length() == 0) {
					errorMsgs.add("信用卡持卡人請勿空白");
				}

				String cardYmReg = "^[(0-9/)]{5}$";
				if (card_ym == null || card_ym.trim().length() == 0) {
					errorMsgs.add("信用卡到期日期請勿空白");
				}
//				else if (!card_ym.trim().matches(cardYmReg)) { // 以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("信用卡到期日期只能是數字和/");
//				}
				String cardSecReg = "^[(0-9)]{3}$";
				if (card_sec == null || card_sec.trim().length() == 0) {
					errorMsgs.add("信用卡認證碼請勿空白");
				} else if (!card_sec.trim().matches(cardSecReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("信用卡認證碼請輸入三位數字");
				}

				ImmedVO immedVO = new ImmedVO();
				immedVO.setBuy_id(buy_id);
				immedVO.setRcpt_name(rcpt_name);
				immedVO.setRcpt_cell(rcpt_cell);
				immedVO.setRcpt_add(rcpt_add);
				immedVO.setImmed_id(immed_id);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("rcpt_name", rcpt_name);
					req.setAttribute("rcpt_cell", rcpt_cell);
					req.setAttribute("rcpt_add", add);
					req.setAttribute("immedVO", immedVO); // 含有輸入格式錯誤的immedVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/protected/immed/immedPay.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ImmedService immedSvc = new ImmedService();
				immedVO = immedSvc.updateBuyImmed(buy_id, rcpt_name, rcpt_cell, rcpt_add, immed_id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				String successMsg = "結帳成功";
				req.setAttribute("successMsg", successMsg);
				req.setAttribute("immedVO", immedVO); // 資料庫update成功後,正確的的immedVO物件,存入req
				String url = "/front-end/protected/immed/buyerManage.jsp"; // listOneImmed.jsp
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneImmed.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/immed/immed_index.jsp"); // update_immed_input.jsp
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

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
				String rcpt_add = req.getParameter("rcpt_add");
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
					RequestDispatcher failureView = req.getRequestDispatcher("update_immed_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ImmedService immedSvc = new ImmedService();
				immedVO = immedSvc.updateImmed(buy_id, pt_id, immed_name, immed_prc, immed_pic, immed_desc, immed_sold,
						immed_down, ord_time, ordstat_id, rcpt_name, rcpt_cell, rcpt_add, immed_id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("immedVO", immedVO); // 資料庫update成功後,正確的的immedVO物件,存入req
				String url = "/front-end/immed/immed_index.jsp"; // listOneImmed.jsp
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneImmed.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/immed/immed_index.jsp"); // update_immed_input.jsp
				failureView.forward(req, res);
			}
		}

		if ("update_oneImmed".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String immed_id = req.getParameter("immed_id");
//				System.out.println(immed_id);
				String pt_id = req.getParameter("pt_id");
//				System.out.println(pt_id);
				String immed_name = req.getParameter("immed_name");
//				System.out.println(immed_name);
//				Integer immed_prc = new Integer(req.getParameter("immed_prc"));
//				System.out.println(immed_prc);

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

				ImmedVO immedVO = new ImmedVO();

				immedVO.setPt_id(pt_id);
				immedVO.setImmed_name(immed_name);
				immedVO.setImmed_prc(immed_prc);
				immedVO.setImmed_pic(immed_pic);
				immedVO.setImmed_desc(immed_desc);
				immedVO.setImmed_id(immed_id);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("immedVO", immedVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/protected/immed/update_immed_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ImmedService immedSvc = new ImmedService();
				immedVO = immedSvc.update_oneImmed(pt_id, immed_name, immed_prc, immed_pic, immed_desc,immed_id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("immedVO", immedVO); // 資料庫update成功後,正確的的immedVO物件,存入req
				String url = "/front-end/protected/immed/salerAlter.jsp"; // listOneImmed.jsp
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneImmed.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/protected/immed/salerAlter.jsp"); // update_immed_input.jsp
				failureView.forward(req, res);
			}
		}
		
		if ("update_end".equals(action)) { // 前台商品上架

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String immed_id = req.getParameter("immed_id");

				ImmedVO immedVO = new ImmedVO();
				immedVO.setImmed_id(immed_id);

				/*************************** 2.開始修改資料 *****************************************/
				ImmedService immedSvc = new ImmedService();
				immedVO = immedSvc.updateEnd(immed_id);
				/*************************** 3.修改完成,準備轉交(Send the Success view) **************/
				String url = "/front-end/protected/immed/buyerManage.jsp"; // listOneImmed.jsp
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneImmed.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/protected/immed/buyerManage.jsp"); // update_immed_input.jsp
				failureView.forward(req, res);
			}
		}

		
		if ("update_up".equals(action)) { // 前台商品上架

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String immed_id = req.getParameter("immed_id");

				ImmedVO immedVO = new ImmedVO();
				immedVO.setImmed_id(immed_id);

				/*************************** 2.開始修改資料 *****************************************/
				ImmedService immedSvc = new ImmedService();
				immedVO = immedSvc.updateImmedUp(immed_id);
				/*************************** 3.修改完成,準備轉交(Send the Success view) **************/
				String url = "/front-end/protected/immed/salerAlter.jsp"; // listOneImmed.jsp
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneImmed.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/immed/immed_index.jsp"); // update_immed_input.jsp
				failureView.forward(req, res);
			}
		}

		if ("backend_update_up".equals(action)) { // 後台商品上架

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String immed_id = req.getParameter("immed_id");

				ImmedVO immedVO = new ImmedVO();
				immedVO.setImmed_id(immed_id);

				/*************************** 2.開始修改資料 *****************************************/
				ImmedService immedSvc = new ImmedService();
				immedVO = immedSvc.updateImmedUp(immed_id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) **************/
				String url = "/back-end/immed/listAllImmed.jsp"; // listOneImmed.jsp
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneImmed.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/immed/listAllImmed.jsp"); // update_immed_input.jsp
				failureView.forward(req, res);
			}
		}

		if ("update_down".equals(action)) { // 前台商品下架 action

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String immed_id = req.getParameter("immed_id");

				ImmedVO immedVO = new ImmedVO();
				immedVO.setImmed_id(immed_id);

//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("immedVO", immedVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req.getRequestDispatcher("update_immed_input.jsp");
//					failureView.forward(req, res);
//					return; // 程式中斷
//				}

				/*************************** 2.開始修改資料 *****************************************/
				ImmedService immedSvc = new ImmedService();
				immedVO = immedSvc.updateImmedDown(immed_id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) **************/
				String url = "/front-end/protected/immed/salerAlter.jsp"; // listOneImmed.jsp
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneImmed.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/immed/immed_index.jsp"); // update_immed_input.jsp
				failureView.forward(req, res);
			}
		}

		if ("backend_update_down".equals(action)) { // 後台商品下架 action

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String immed_id = req.getParameter("immed_id");

				ImmedVO immedVO = new ImmedVO();
				immedVO.setImmed_id(immed_id);

//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("immedVO", immedVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req.getRequestDispatcher("update_immed_input.jsp");
//					failureView.forward(req, res);
//					return; // 程式中斷
//				}

				/*************************** 2.開始修改資料 *****************************************/
				ImmedService immedSvc = new ImmedService();
				immedVO = immedSvc.updateImmedDown(immed_id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) **************/
				String url = "/back-end/immed/listAllImmed.jsp"; // listOneImmed.jsp
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneImmed.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/immed/listAllImmed.jsp"); // update_immed_input.jsp
				failureView.forward(req, res);
			}
		}

		if ("update_shipping".equals(action)) { // 後台商品下架 action

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String immed_id = req.getParameter("immed_id");

				ImmedVO immedVO = new ImmedVO();
				immedVO.setImmed_id(immed_id);

//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("immedVO", immedVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req.getRequestDispatcher("update_immed_input.jsp");
//					failureView.forward(req, res);
//					return; // 程式中斷
//				}

				/*************************** 2.開始修改資料 *****************************************/
				ImmedService immedSvc = new ImmedService();
				immedVO = immedSvc.update_shipping(immed_id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) **************/
				String url = "/front-end/protected/immed/salerManage.jsp"; // listOneImmed.jsp
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneImmed.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/immed/immed_index.jsp"); // update_immed_input.jsp
				failureView.forward(req, res);
			}
		}

		if ("update_disable".equals(action)) { // 後台商品下架 action

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String immed_id = req.getParameter("immed_id");

				ImmedVO immedVO = new ImmedVO();

//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("immedVO", immedVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req.getRequestDispatcher("update_immed_input.jsp");
//					failureView.forward(req, res);
//					return; // 程式中斷
//				}

				/*************************** 2.開始修改資料 *****************************************/
				ImmedService immedSvc = new ImmedService();
				immedVO = immedSvc.update_disable(immed_id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) **************/
				String url = "/front-end/protected/immed/buyerManage.jsp"; // listOneImmed.jsp
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneImmed.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/immed/immed_index.jsp"); // update_immed_input.jsp
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { // 來自addImmed.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
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
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/protected/immed/addImmed.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				ImmedService immedSvc = new ImmedService();
				immedVO = immedSvc.addImmed(sale_id, pt_id, immed_name, immed_prc, immed_pic, immed_desc);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/immed/immed_index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/protected/immed/addImmed.jsp");
				failureView.forward(req, res);
			}
		}
//
		if ("delete".equals(action)) { // 來自listAllImmed.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				String immed_id = new String(req.getParameter("immed_id"));

				/*************************** 2.開始刪除資料 ***************************************/
				ImmedService immedSvc = new ImmedService();
				immedSvc.deleteImmed(immed_id);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/back-end/immed/listAllImmed.jsp"; // select_page.jsp
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/immed/listAllImmed.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
