package com.auct.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.Writer;
import java.sql.Timestamp;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.auct.model.AuctService;
import com.auct.model.AuctVO;

import redis.clients.jedis.Jedis;



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
				String url = "/front-end/protected/auct/update_auct_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_auct_input.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/protected/auct/listAllAuct.jsp");
				failureView.forward(req, res);
			}
		}  //listAllAuct.jsp的請求---end
		
		if ("update".equals(action)) {   //update_auct_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
		try {
			/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
			String pt_id = req.getParameter("pt_id");
			System.out.println(pt_id);
			System.out.println("---------------------");
			
			String auct_name = req.getParameter("auct_name");
			System.out.println(auct_name);
			System.out.println("---------------------");
			
			java.util.GregorianCalendar time = new java.util.GregorianCalendar(); //現在時間
			long now_ms = time.getTimeInMillis();
			
			java.sql.Timestamp auct_start = java.sql.Timestamp.valueOf(req.getParameter("auct_start"));
			System.out.println("---------------------"+auct_start);
			
			long auct_start_long = auct_start.getTime(); 				//Timestamp 轉 long
			Timestamp auct_start_OK =null;
			if(now_ms >= auct_start_long) {
				errorMsgs.add("拍賣開始時間錯誤");
			}else{
			auct_start_OK = new Timestamp(auct_start_long) ;  //long 轉 Timestamp
			}
			
			java.sql.Timestamp auct_end = java.sql.Timestamp.valueOf(req.getParameter("auct_end"));
			System.out.println("---------------------"+auct_end);
			
			long auct_end_long = auct_end.getTime();			 //Timestamp 轉 long
			Timestamp auct_end_OK = new Timestamp(auct_end_long) ;  //long 轉 Timestamp
			
			
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
				// 圖片
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
			auctVO.setAuct_start(auct_start_OK); //拍賣上架時間（開始時間）		
			auctVO.setAuct_end(auct_end_OK);     //拍賣結束時間  
			
			auctVO.setMarketPrice(marketPrice);//市價
			auctVO.setInitPrice(initPrice);  //拍賣出價（一開始為底價）
			auctVO.setAuct_inc(auct_inc);  //出價增額
			auctVO.setAuct_desc(auct_desc);  //商品描述
			auctVO.setAuct_pic(auct_pic);
			int auct_down = 0;
			auctVO.setAuct_down(auct_down);
			auctVO.setAuct_id(auct_id);
			//付款截止時間
			long pay_end_long = auct_end_OK.getTime()+ 24*60*60*1000L; //Timestamp 轉 long
			Timestamp pay_end = new Timestamp(pay_end_long) ;       //long 轉 Timestamp
			auctVO.setPay_end(pay_end);
			
			AuctService auctSvc = new AuctService();
			auctVO = auctSvc.update_auct( pt_id, auct_name, auct_start, auct_end,marketPrice, initPrice, auct_inc, auct_desc, auct_pic, pay_end,auct_down, auct_id);
			
			req.setAttribute("auctVO", auctVO);
			String url = "/front-end/protected/auct/listAllAuct.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
			/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/protected/auct/listAllAuct.jsp");
				failureView.forward(req, res);
			}

		}   //update_auct_input.jsp的請求 ---end

		

		if ("insert".equals(action)) {   //insert_auct.jsp的請求

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
			String url = "/front-end/protected/auct/listAllAuct.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
			
			

		}   //insert_auct.jsp的請求 ---end
		
		
		
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
				
				String url = "/front-end/protected/auct/listAllAuct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 下架成功後,轉交回送出下架的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("修改狀態失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/protected/auct/listAllAuct.jsp");
				failureView.forward(req, res);
			}
			
		}  // listAllAuct.jsp的 "下架" 請求---end
		


//===========================================================================================================================
		if("bid_info".equals(action)) {  // bid頁面, 抓取該商品的值
			
			/*************************** 1.接收請求參數 ****************************************/
			String auct_id = new String(req.getParameter("auct_id"));
			System.out.println("--------------" + auct_id);
			
			java.sql.Timestamp auct_start = java.sql.Timestamp.valueOf(req.getParameter("auct_start"));
			System.out.println("--------------" + auct_start);
			
			long auct_start_long = auct_start.getTime(); //Timestamp 轉 long
			
			java.util.GregorianCalendar time = new java.util.GregorianCalendar();
			long now_ms = time.getTimeInMillis();
			
			// 拍賣開始，才能進入競標頁面
			if(now_ms >= auct_start_long ) {
			/*************************** 2.開始查詢資料 ****************************************/
			AuctService auctSvc = new AuctService();
			AuctVO auctVO = auctSvc.listOneAuct(auct_id);
			
			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			req.setAttribute("auctVO", auctVO); // 資料庫取出的auctVO物件,存入req
			String url = "/front-end/protected/auct/bid_product.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 bid_product.jsp
			successView.forward(req, res);
			}else {
				String url = "/front-end/protected/auct/Auct_index.jsp"; //拍賣未開始
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}
		}

//===========================================================================================================================
		String  session_mem_id;
		String  buy_id = null;
		if("timeout".equals(action)) {  // 拍賣結束
			
			/*************************** 1.接收請求參數 ****************************************/
			Integer auct_down = 1; // 下架
			String  auct_id = req.getParameter("auct_id"); //接收 商品ID
System.out.println("拍賣結束--商品ID----------------"+auct_id);
			 session_mem_id = req.getParameter("mem_id"); //接收 會員ID
System.out.println("拍賣結束--會員ID----------------"+session_mem_id);
			
			AuctVO auctVO = new AuctVO();
			
			/***************************2.開始修改狀態***************************************/
			AuctService auctSvc = new AuctService();
			
			
			/*********************  檢查redis是否有key  ******************/
			Jedis jedis = new Jedis("localhost", 6379);
			jedis.auth("123456");
//			String auct_id = req.getParameter(auct_id);
			
			
			if (jedis.exists(auct_id)) { // 如果key存在
				
				Map<String, Double> scores1 = new HashMap<>();
				
				Set<String> mem_id = jedis.zrange(auct_id ,-1, -1); //最大key [M000002]
				System.out.println(mem_id);  
				
				int dollars;
				
				for (String memID : mem_id) {	 // 全部mem_id
					Double highest = jedis.zscore(auct_id , memID);// 取最大key的分數
					
					dollars = (int)(Math.ceil(highest)); //轉型(去除小數點)
					
					int auct_sold = 1; //售出
					buy_id = memID;
					int maxPrice = dollars;
					
					GregorianCalendar time1 = new GregorianCalendar();
					Timestamp ord_time = new Timestamp(time1.getTimeInMillis()); //產生訂單時間
					String ordstat_id = "002"; //未付款
					
			auctVO = auctSvc.update_winner(auct_sold,auct_down, buy_id, maxPrice,ord_time, ordstat_id, auct_id);
					
				}
					
			} //如果redis有key --end
			else {
				auctVO = auctSvc.update_auct_down(auct_down, auct_id); //更改成 下架狀態
			}
			
			/***************************3.修改完成,準備轉交(Send the Success view)***********/	
			req.setAttribute("auctVO", auctVO); //修改完成, 剩下工作交給Ajax
			
			//Ajax回傳資料
			res.setContentType("text/plain");
			res.setCharacterEncoding("utf-8");
			Writer writer = res.getWriter();
			System.out.println(session_mem_id.equals(buy_id));
			if(session_mem_id.equals(buy_id))
				writer.append("true"); //只能傳字串
			else
				writer.append("false");
			writer.flush();
			writer.close();
			
//			String url = "/front-end/protected/auct/Auct_index.jsp";
//			res.sendRedirect(req.getContextPath()+url); // 請求成功後, 重導回 拍賣首頁
			
		}
		
//===========================================================================================================
		if ("payOne_update".equals(action)) { // 來自buy_order.jsp的 "轉交付款" 請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				String  auct_id = req.getParameter("auct_id");
System.out.println("轉交付款---------------" + auct_id );				
				
				AuctVO auctVO = new AuctVO();
				
				/***************************2.開始修改狀態***************************************/
				AuctService auctSvc = new AuctService();
				auctVO = auctSvc.listOneOrd(auct_id);
							
				/***************************3.修改完成,準備轉交(Send the Success view)***********/	
				req.setAttribute("auctVO", auctVO);
				
				String url = "/front-end/protected/auct/payMoney.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 修改成功後,轉交給payMoney.jsp網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("轉交失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/protected/auct/sale_order.jsp");
				failureView.forward(req, res);
			}
			
		}  // buy_order.jsp的 "轉交付款" 請求---end
		
		if ("update_rcpt".equals(action)) { // 來自payMoney.jsp的 "更新收件資訊" 請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				String  auct_id = req.getParameter("auct_id");
System.out.println("付款---------------" + auct_id );		
				String ordstat_id = "003"; //已付款,待出貨
				String rcpt_name = req.getParameter("rcpt_name");
				String rcpt_cel = req.getParameter("rcpt_cel");
				String rcpt_add = req.getParameter("rcpt_add");
				
				AuctVO auctVO = new AuctVO();
				
				/***************************2.開始修改狀態***************************************/
				AuctService auctSvc = new AuctService();
				auctVO = auctSvc.update_ord(ordstat_id,rcpt_name,rcpt_cel,rcpt_add,auct_id);
							
				/***************************3.修改完成,準備轉交(Send the Success view)***********/	
				req.setAttribute("auctVO", auctVO);
				
				String url = "/front-end/protected/auct/pay.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 修改成功後,轉交給pay.jsp網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("付款失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/protected/auct/buy_order.jsp");
				failureView.forward(req, res);
			}
			
		}  // buy_order.jsp的 "付款" 請求---end
		
		
//============================================================================================================		
		if ("update_ordstat".equals(action)) { // 來自sale_order.jsp的 "出貨" 請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				String  ordstat_id = "005"; //已送達,待收貨
				String  auct_id = req.getParameter("auct_id");
				
				
				AuctVO auctVO = new AuctVO();
				
				/***************************2.開始修改狀態***************************************/
				AuctService auctSvc = new AuctService();
				auctVO = auctSvc.update_ordstat_id(ordstat_id, auct_id);
							
				/***************************3.修改完成,準備轉交(Send the Success view)***********/	
				req.setAttribute("auctVO", auctVO);
				
				String url = "/front-end/protected/auct/sale_order.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 修改成功後,轉交回 : 來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("修改狀態失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/protected/auct/sale_order.jsp");
				failureView.forward(req, res);
			}
			
		}  // sale_order.jsp的 "出貨" 請求---end
		
//============================================================================================================		
		if ("update_OK_ordstat".equals(action)) { // 來自buy_order.jsp的 "完成" 請求

					List<String> errorMsgs = new LinkedList<String>();
					// Store this set in the request scope, in case we need to
					// send the ErrorPage view.
					req.setAttribute("errorMsgs", errorMsgs);
			
					try {
						/***************************1.接收請求參數***************************************/
						String  ordstat_id = "014";
						String  auct_id = req.getParameter("auct_id");
						
						
						AuctVO auctVO = new AuctVO();
						
						/***************************2.開始修改狀態***************************************/
						AuctService auctSvc = new AuctService();
						auctVO = auctSvc.update_ordstat_id(ordstat_id, auct_id);
									
						/***************************3.修改完成,準備轉交(Send the Success view)***********/	
						req.setAttribute("auctVO", auctVO);
						
						String url = "/front-end/protected/auct/buy_order.jsp";
						RequestDispatcher successView = req.getRequestDispatcher(url);// 修改成功後,轉交回 : 來源網頁
						successView.forward(req, res);
						
						/***************************其他可能的錯誤處理**********************************/
					} catch (Exception e) {
						errorMsgs.add("修改狀態失敗:"+e.getMessage());
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front-end/protected/auct/buy_order.jsp");
						failureView.forward(req, res);
					}
					
		}  // buy_order.jsp的 "完成" 請求---end
		
		
		


	}//HttpServletRequest-end
}
