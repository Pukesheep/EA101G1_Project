package com.gro_mem.controller;

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

import com.gro_mem.model.Gro_memService;
import com.gro_mem.model.Gro_memVO;
import com.groupBuy.controller.GroupBuyServlet;
import com.groupBuy.model.GroupBuyService;
import com.groupBuy.model.GroupBuyVO;
import com.rebate.model.RebateService;
import com.rebate.model.RebateVO;

public class Gro_memServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
//
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
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/gromem/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				String gro_Id = null;
				try {
					gro_Id = new String(str);
				} catch (Exception e) {
					errorMsgs.add("團購ID不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/gromem/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 2.開始查詢資料 *****************************************/
				Gro_memService gromemSvc = new Gro_memService();
				Gro_memVO gromemVO = gromemSvc.getOneGroupBuy(gro_Id);
				if (gromemVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/gromem/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("gromemVO", gromemVO); // 資料庫取出的memVO物件,存入req
				String url = "/back-end/gromem/listOneGromem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOnemem.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/gromem/select_page.jsp");
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
				String gro_Id = new String(req.getParameter("gro_Id"));
				/*************************** 2.開始查詢資料 ****************************************/
				Gro_memService gromemSvc = new Gro_memService();
				Gro_memVO gromemVO = gromemSvc.getOneGroupBuy(gro_Id);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("gromemVO", gromemVO); // 資料庫取出的empVO物件,存入req
				String url = "/back-end/gromem/update_gromem_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/rebate/update_reb_input.jsp");
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

				String gro_Id = new String(req.getParameter("gro_Id").trim());

				String mem_Id = req.getParameter("mem_Id");
				System.out.println("1 " + gro_Id);
				System.out.println("2 " + mem_Id);
				String mem_IdReg = "[(a-zA-Z0-9)]{1,10}";
				if (mem_IdReg == null || mem_IdReg.trim().length() == 0) {
					errorMsgs.add("商品編號:");
				}

				Gro_memVO gromemVO = new Gro_memVO();

				gromemVO.setGro_Id(gro_Id);
				gromemVO.setMem_Id(mem_Id);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("gromemVO", gromemVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/gromem/update_gromem_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				Gro_memService gromemSvc = new Gro_memService();
				gromemVO = gromemSvc.updateGro_mem(gro_Id, mem_Id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("gromemVO", gromemVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back-end/gromem/listOneGromem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/gromem/update_gromem_input.jsp");
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
				String gro_Id = req.getParameter("gro_Id").trim();

				String mem_Id = req.getParameter("mem_Id").trim();

				if (mem_Id == null || mem_Id.trim().length() == 0) {
					errorMsgs.add("會員編號請勿空白");
				} else if (!mem_Id.trim().matches(mem_Id)) {
					errorMsgs.add("人數且長度必需在10位數");
				}

				Gro_memVO gromemVO = new Gro_memVO();
				gromemVO.setGro_Id(gro_Id);
				gromemVO.setMem_Id(mem_Id);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("gromemVO", gromemVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/gromem/addGromem.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				Gro_memService gromemSvc = new Gro_memService();
				gromemVO = gromemSvc.addGro_mem(gro_Id, mem_Id);

				GroupBuyService groupBuy = new GroupBuyService();
				GroupBuyVO groupBuyVO = groupBuy.getOneGroupBuy(gro_Id); //這邊是團購會員要再修改 //用團購ID查有幾個會員加入
				groupBuyVO = groupBuy.gropeo(gro_Id, groupBuyVO.getPeople() + 1); //修改人數 . 可以拿到幾個人的SIZE

				RebateService rebate = new RebateService();
				RebateVO rebate1VO = rebate.getOneRebate(groupBuyVO.getReb1_No());

				Integer money = 0;
				Integer groupbuypeople = Integer.valueOf(groupBuyVO.getPeople());
				Integer rebatepeople = Integer.valueOf(rebate1VO.getPeople());
				if (groupbuypeople >= rebatepeople) {
					money = groupBuyVO.getMoney() * rebate1VO.getDiscount();
					RebateVO rebate2VO = rebate.getOneRebate(groupBuyVO.getReb2_No());
					rebatepeople = Integer.valueOf(rebate2VO.getPeople());
					if (groupbuypeople >= rebatepeople) {
						money = groupBuyVO.getMoney() * rebate2VO.getDiscount();
						RebateVO rebate3VO = rebate.getOneRebate(groupBuyVO.getReb3_No());
						rebatepeople = Integer.valueOf(rebate3VO.getPeople());
						if (groupbuypeople >= rebatepeople) {
							money = groupBuyVO.getMoney() * rebate3VO.getDiscount();
						}
					}
				}
				
				groupBuyVO = groupBuy.gromon(gro_Id,money);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("gromemVO", gromemVO);
				String url = "/back-end/gromem/listAllGromem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/gromem/addGromem.jsp");
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
				String gro_Id = new String(req.getParameter("gro_Id"));
				/*************************** 2.開始刪除資料 ***************************************/
				Gro_memService gromemSvc = new Gro_memService();
				gromemSvc.deleteGro_mem(gro_Id);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/back-end/gromem/listAllGromem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/gromem/listAllGromem.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
