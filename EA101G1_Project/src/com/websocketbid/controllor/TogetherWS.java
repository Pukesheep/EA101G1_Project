package com.websocketbid.controllor;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.auct.model.AuctService;
import com.auct.model.AuctVO;
import com.member.model.MemberService;
import com.member.model.MemberVO;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPoolConfig;

@ServerEndpoint("/TogetherWS/{mem_id}/{auct_id}")
public class TogetherWS {
	private static final Set<Session> connectedSessions = Collections.synchronizedSet(new HashSet<>());

	/*
	 * 如果想取得HttpSession與ServletContext必須實作
	 * ServerEndpointConfig.Configurator.modifyHandshake()，
	 * 參考https://stackoverflow.com/questions/21888425/accessing-servletcontext-and-
	 * httpsession-in-onmessage-of-a-jsr-356-serverendpoint
	 */
//	AuctVO auctVO = (AuctVO) session.getAttribute("auctVO");

	@OnOpen
	synchronized public void onOpen(@PathParam("mem_id") String mem_id, @PathParam("auct_id") String auct_id,
			Session userSession) throws IOException {
		connectedSessions.add(userSession);
		String text = String.format("Session ID = %s, connected; userName = %s", userSession.getId(), mem_id);
		
		AuctService auctSvc = new AuctService();
		AuctVO auctVO = auctSvc.listOneAuct(auct_id);
		
		
		Jedis jedis = null;
		jedis = new Jedis("localhost", 6379);
		jedis.auth("123456");
		Map<String, Double> scores1 = new HashMap<>();
		Set<String> set = jedis.zrange(auct_id, scores1.size() -9, -1);// 取最大key
		System.out.println("Map:" + scores1);
		System.out.println("set:"+set);
		System.out.println("----------");  //取得Redis資料
		
		if(set.size()==0) {
			try {
				double highest = (double) auctVO.getInitPrice();
				System.out.println("最高價 :" + highest);
				
				MemberService memSvc = new MemberService();
				MemberVO memVO = memSvc.getOneMember(mem_id);
				String userName = memVO.getMem_name();
				
				Map<String, String> map = new LinkedHashMap<>();
				map.put("userName", userName);
				map.put("score", String.valueOf(highest));

				JSONObject jobj = new JSONObject();
				jobj.append("record", map);
				System.out.println("OnOpen = " + jobj);
				userSession.getAsyncRemote().sendText(jobj.toString()); //送至前端webSocket.onmessage
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}else {
//			for (String ownerbynow : set) {
//				Double highest = jedis.zscore(auct_id, ownerbynow);// 取最大key
//				
//				String retu = "{\"userName\" : \"" + ownerbynow + "\"," + "\"score\" : " + highest + "}";
//				System.out.println("1111111111111111111111111111111111111111");			
//				System.out.println(retu);
//				userSession.getAsyncRemote().sendText(retu);
//			}
			
			JSONObject jobj = new JSONObject();  //取得Redis資料
			for (String ownerbynow : set) { 	 //ownerbynow是 全部mem_id
				Double highest = jedis.zscore(auct_id, ownerbynow);// 取最大key
				
				MemberService memSvc = new MemberService();
				MemberVO memVO = memSvc.getOneMember(ownerbynow);
				String userName = memVO.getMem_name();
				
				Map<String, String> map = new LinkedHashMap<>();
				map.put("userName", userName);
				map.put("score", String.valueOf(highest));
				
				try {
					jobj.append("record", map);
				} catch (JSONException e) {
					e.printStackTrace();
				}
			}
			
			userSession.getAsyncRemote().sendText(jobj.toString());  //送至前端webSocket.onmessage
			
		}
//		
//		for (String ownerbynow : set) {
//			Double highest = jedis.zscore(auct_name, ownerbynow);// 取最大key
//			
//			String retu = "{\"userName\" : \"" + ownerbynow + "\"," + "\"score\" : " + highest + "}";
//			userSession.getAsyncRemote().sendText(retu);
//		}

		
		
		
		
		System.out.println("2222222222222222222222222222222");

		 // jsonObj.getString("product");
		

//		Set<String> set=jedis.zrange(product, scores1.size()-2, -1);//取最大key

	}

	@OnMessage //收到 sendMessage()送進來的JSON物件
	public void onMessage(Session userSession, String message) {
		Jedis jedis = null;

				jedis = new Jedis("localhost", 6379);
				jedis.auth("123456");
				try {
//					
					JSONObject jsonObj = new JSONObject(message); 
					String userID = jsonObj.getString("userID");
					Double score = jsonObj.getDouble("score");
					String product = jsonObj.getString("product");
					
					Map<String, Double> scores1 = new HashMap<>();
					scores1.put(userID, new Double(score));

					jedis.zadd(product, scores1);
					
					MemberService memSvc = new MemberService();
					MemberVO memVO = memSvc.getOneMember(userID);
					String userName = memVO.getMem_name();
//					Set<String> set = jedis.zrange(product, scores1.size() -9, -1);// 取最大key
//					System.out.println("Map:" + scores1);
//					System.out.println("set:"+set);
//					System.out.println("----------");
					
					Map<String, String> map = new LinkedHashMap<>();
					map.put("userName", userName);
					map.put("score", String.valueOf(score));
					
					
					JSONObject jObj = new JSONObject();
					jObj.append("record", map);
					System.out.println("Onmessage = " + jObj);
					for (Session session : connectedSessions) { //推播給每一條連線
						if (session.isOpen()) {
							session.getAsyncRemote().sendText(jObj.toString());  //送至前端webSocket.onmessage
						}
					}
					
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}
//				session.getAsyncRemote().sendText(message);
			
		
		System.out.println("Message received: " + message);
	}

	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
		connectedSessions.remove(userSession);
		String text = String.format("session ID = %s, disconnected; close code = %d; reason phrase = %s",
				userSession.getId(), reason.getCloseCode().getCode(), reason.getReasonPhrase());
		System.out.println(text);
	}

	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("Error: " + e.toString());
	}

	public void select(String auct_name, Session userSession) {
		Jedis jedis = null;
		jedis = new Jedis("localhost", 6379);
		jedis.auth("123456");
		Map<String, Double> scores1 = new HashMap<>();
		Set<String> set = jedis.zrange(auct_name, scores1.size() - 2, -1);// 取最大key

		System.out.println("SSS");

		for (String ownerbynow : set) {
			Double highest = jedis.zscore(auct_name, ownerbynow);// 取最大key

			String retu = "{\"userName\" : \"" + ownerbynow + "\"," + "\"score\" : " + highest + "}";
			userSession.getAsyncRemote().sendText(retu);
		}

	}

}
