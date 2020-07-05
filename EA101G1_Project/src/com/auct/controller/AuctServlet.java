package com.auct.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.auct.model.AuctService;
import com.auct.model.AuctVO;



@MultipartConfig
public class AuctServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

	
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String auct_id = req.getParameter("auct_id");
System.out.println("----------"+auct_id);
				if (auct_id == null || (auct_id.trim()).length() == 0) {
					errorMsgs.add("請輸入商品編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/auct/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/auct/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				AuctService auctSvc = new AuctService();
				AuctVO auctVO = auctSvc.listOneAuct(auct_id);
System.out.println("--------------"+auctVO);
				if (auctVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/auct/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("auctVO", auctVO); // 資料庫取出的auctVO物件,存入req
				String url = "/front-end/auct/listOneAuct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneAuct.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/auct/select_page.jsp");
				failureView.forward(req, res);
			}
		}//select_page.jsp的請求---end
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllAuct.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String auct_id = new String(req.getParameter("auct_id"));
System.out.println("--------------"+auct_id);
				
				/***************************2.開始查詢資料****************************************/
				AuctService auctSvc = new AuctService();
				AuctVO auctVO = auctSvc.listOneAuct(auct_id);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("auctVO", auctVO);         // 資料庫取出的auctVO物件,存入req
				String url = "/front-end/auct/update_auct_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_auct_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/auct/listAllAuct.jsp");
				failureView.forward(req, res);
			}
		}  //listAllAuct.jsp的請求---end
		
		if ("update".equals(action)) {   //update_auct_input.jsp的請求

			String pt_id = req.getParameter("pt_id");
			System.out.println(pt_id);
			System.out.println("---------------------");
			
			String auct_name = req.getParameter("auct_name");
			System.out.println(auct_name);
			System.out.println("---------------------");
			
			java.sql.Timestamp auct_start = java.sql.Timestamp.valueOf(req.getParameter("auct_start"));
			System.out.println(auct_start);
			System.out.println("---------------------");
			
			java.sql.Timestamp auct_end = java.sql.Timestamp.valueOf(req.getParameter("auct_end"));
			System.out.println(auct_end);
			System.out.println("---------------------");
			
			Integer marketPrice =new Integer (req.getParameter("marketPrice"));
			System.out.println(marketPrice);
			System.out.println("---------------------");
			
			Integer initPrice =new Integer (req.getParameter("initPrice"));
			System.out.println(initPrice);
			System.out.println("---------------------");
			
			Integer auct_inc = new Integer (req.getParameter("auct_inc"));
			System.out.println(auct_inc);
			System.out.println("---------------------");
			
			String auct_desc = req.getParameter("auct_desc");
			System.out.println(auct_desc);
			System.out.println("---------------------");
			
//			Integer auct_sold = new Integer (req.getParameter("auct_sold"));
//			System.out.println(auct_sold);
//			System.out.println("---------------------");
//			
//			Integer auct_down = new Integer (req.getParameter("auct_down"));
//			System.out.println(auct_down);
//			System.out.println("---------------------");
			
String auct_id = req.getParameter("auct_id");
			
			// 商品圖片
			byte[] auct_pic = null;
			InputStream in = null;
			
			try {
				// 房型圖片
				Part part = req.getPart("auct_pic");
				in = part.getInputStream();
				System.out.println(in.available());
				if (in.available() > 0) {
					auct_pic = new byte[in.available()];
					in.read(auct_pic);
					in.close();
				} else {
					AuctService AuctSvc = new AuctService();
					AuctVO auctVO = AuctSvc.listOneAuct(auct_id);
					auct_pic = auctVO.getAuct_pic();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (in != null) {
					try {
						in.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}

			
			AuctVO auctVO = new AuctVO();
			auctVO.setPt_id(pt_id);      //商品分類編號
			auctVO.setAuct_name(auct_name);   //商品名稱
			auctVO.setAuct_start(auct_start); //拍賣上架時間（開始時間）		
			auctVO.setAuct_end(auct_end);     //拍賣結束時間  
			
			auctVO.setMarketPrice(marketPrice);//市價
			auctVO.setInitPrice(initPrice);  //拍賣出價（一開始為底價）
			auctVO.setAuct_inc(auct_inc);  //出價增額
			auctVO.setAuct_desc(auct_desc);  //商品描述
			auctVO.setAuct_pic(auct_pic);
			auctVO.setAuct_id(auct_id);
			//付款截止時間
			long pay_end_long = auct_end.getTime()+ 24*60*60*1000L; //Timestamp 轉 long
			Timestamp pay_end = new Timestamp(pay_end_long) ;       //long 轉 Timestamp
			auctVO.setPay_end(pay_end);
			
			AuctService auctSvc = new AuctService();
			auctVO = auctSvc.update_auct( pt_id, auct_name, auct_start, auct_end,marketPrice, initPrice, auct_inc, auct_desc, auct_pic, pay_end, auct_id);
			
			req.setAttribute("auctVO", auctVO);
			String url = "/front-end/auct/listOneAuct.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
			

		}   //update_auct_input.jsp的請求 ---end

		

		if ("insert".equals(action)) {   //addAuct.jsp的請求

			String sale_id = req.getParameter("sale_id");
			System.out.println(sale_id);
			System.out.println("---------------------");

			String pt_id = req.getParameter("pt_id");
			System.out.println(pt_id);
			System.out.println("---------------------");
			
			String auct_name = req.getParameter("auct_name");
			System.out.println(auct_name);
			System.out.println("---------------------");
			
			java.sql.Timestamp auct_start = java.sql.Timestamp.valueOf(req.getParameter("auct_start"));
//			String auct_start = req.getParameter("auct_start");
			System.out.println(auct_start);
			System.out.println("---------------------");
			
			java.sql.Timestamp auct_end = java.sql.Timestamp.valueOf(req.getParameter("auct_end"));
//			String auct_end = req.getParameter("auct_end");
			System.out.println(auct_end);
			System.out.println("---------------------");
				
			Integer marketPrice =new Integer (req.getParameter("marketPrice"));
			System.out.println(marketPrice);
			System.out.println("---------------------");
			
			Integer initPrice =new Integer (req.getParameter("initPrice"));
			System.out.println(initPrice);
			System.out.println("---------------------");
			
			Integer auct_inc = new Integer (req.getParameter("auct_inc"));
			System.out.println(auct_inc);
			System.out.println("---------------------");
			
			String auct_desc = req.getParameter("auct_desc");
			System.out.println(auct_desc);
			System.out.println("---------------------");
			
//			Integer auct_sold = new Integer (req.getParameter("auct_sold"));
//			System.out.println(auct_sold);
//			System.out.println("---------------------");
//			
//			Integer auct_down = new Integer (req.getParameter("auct_down"));
//			System.out.println(auct_down);
//			System.out.println("---------------------");
			
			// 商品圖片
			Part part = req.getPart("auct_pic");
			InputStream in = part.getInputStream();
			System.out.println(in.available());
			byte[] auct_pic = new byte[in.available()];
			in.read(auct_pic);
			in.close();
			
			AuctVO auctVO = new AuctVO();
			auctVO.setSale_id(sale_id);  //賣家編號
			auctVO.setPt_id(pt_id);      //商品分類編號
			auctVO.setAuct_name(auct_name);   //商品名稱
			auctVO.setAuct_start(auct_start); //拍賣上架時間（開始時間）		
			auctVO.setAuct_end(auct_end);     //拍賣結束時間 --------型別為Timestamp
			
//			GregorianCalendar time1 = new GregorianCalendar();
//			auctVO.setAuct_start(new Timestamp(time1.getTimeInMillis())); //拍賣上架時間（開始時間）
			
//			GregorianCalendar time2 = new GregorianCalendar();  //拍賣截止時間（24小時後停止下單）
//			auctVO.setAuct_end(new Timestamp(time2.getTimeInMillis()+24*60*60*1000L));  
			
			auctVO.setMarketPrice(marketPrice);//市價
			auctVO.setInitPrice(initPrice);  //拍賣出價（一開始為底價）
			auctVO.setAuct_inc(auct_inc);  //出價增額
			auctVO.setAuct_desc(auct_desc);  //商品描述
			auctVO.setAuct_pic(auct_pic);
			
			Integer auct_sold = 0;
			auctVO.setAuct_sold(auct_sold);  //是否售出 （0:在售）
			Integer auct_down = 0;
			auctVO.setAuct_down(auct_down);  //是否上架 （0:上架）
			//付款截止時間
			long pay_end_long = auct_end.getTime()+ 24*60*60*1000L; //Timestamp 轉 long
			Timestamp pay_end = new Timestamp(pay_end_long) ;       //long 轉 Timestamp
			auctVO.setPay_end(pay_end);
			
			AuctService auctSvc = new AuctService();
			auctVO = auctSvc.insert_auct(sale_id, pt_id, auct_name, auct_start, auct_end,marketPrice,
					 initPrice, auct_inc, auct_desc,auct_pic, auct_sold, auct_down, pay_end);
			
			req.setAttribute("auctVO", auctVO);
			String url = "/front-end/auct/listAllAuct.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
			

		}   //addAuct.jsp的請求 ---end
		
		
		
//==================================================================================================================	

		if ("update_down".equals(action)) { // 來自listAllAuct.jsp的 "下架" 請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				Integer auct_down = 1;
				String  auct_id = req.getParameter("auct_id");
				
				AuctVO auctVO = new AuctVO();
				
				/***************************2.開始修改狀態***************************************/
				AuctService auctSvc = new AuctService();
				auctVO = auctSvc.update_auct_down(auct_down, auct_id);
							
				/***************************3.修改完成,準備轉交(Send the Success view)***********/	
				req.setAttribute("auctVO", auctVO);
				
				String url = "/front-end/auct/listAllAuct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 下架成功後,轉交回送出下架的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("修改狀態失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/auct/listAllAuct.jsp");
				failureView.forward(req, res);
			}
			
		}  // listAllAuct.jsp的 "下架" 請求---end
		

		if ("update_up".equals(action)) { // 來自listAllAuct.jsp的 "上架" 請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				Integer auct_down = 0;
				String  auct_id = req.getParameter("auct_id");
				
				AuctVO auctVO = new AuctVO();
				
				/***************************2.開始修改狀態***************************************/
				AuctService auctSvc = new AuctService();
				auctVO = auctSvc.update_auct_down(auct_down, auct_id);
				
				/***************************3.修改完成,準備轉交(Send the Success view)***********/	
				req.setAttribute("auctVO", auctVO);
				
				String url = "/front-end/auct/listAllAuct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 上架成功後,轉交回送出上架的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("修改狀態失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/auct/listAllAuct.jsp");
				failureView.forward(req, res);
			}
			
		}  // listAllAuct.jsp的 "上架" 請求---end
		

//===========================================================================================================================
		
			


	}//HttpServletRequest-end
}
