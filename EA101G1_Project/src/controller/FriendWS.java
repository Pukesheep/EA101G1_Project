package idv.david.websocketchat.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

import idv.david.websocketchat.jedis.JedisHandleMessage;
import idv.david.websocketchat.jedis.JedisPoolUtil;
import idv.david.websocketchat.model.ChatMessage;
import idv.david.websocketchat.model.State;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@ServerEndpoint("/FriendWS/{userName}")
public class FriendWS {
	private static Map<String, Session> sessionsMap = new ConcurrentHashMap<>();
	Gson gson = new Gson();

	@OnOpen
	public void onOpen(@PathParam("userName") String userName, Session userSession) throws IOException {
		/* save the new user in the map */
		sessionsMap.put(userName, userSession);
		/* Sends all the connected users to the new user */
		Set<String> userNames = sessionsMap.keySet();
		HashSet<String> friends=selectfriend(userName);
		Boolean isonline=false;
		State stateMessage = new State("open", userName, userNames, friends,isonline);
		//-------------------
		String stateMessageJson = gson.toJson(stateMessage);
		System.out.println(stateMessageJson);
		Collection<Session> sessions = sessionsMap.values();
		for (Session session : sessions) {
			if (session.isOpen()) {
				session.getAsyncRemote().sendText(stateMessageJson);
			}
		}
		String text = String.format("Session ID = %s, connected; userName = %s%nusers: %s", userSession.getId(),
				userName, friends);
		System.out.println(text);
	}

	@OnMessage
	public void onMessage(Session userSession, String message) {
		ChatMessage chatMessage = gson.fromJson(message, ChatMessage.class);
		String sender = chatMessage.getSender();
		String receiver = chatMessage.getReceiver();
		
		if ("history".equals(chatMessage.getType())) {
			List<String> historyData = JedisHandleMessage.getHistoryMsg(sender, receiver);
			String historyMsg = gson.toJson(historyData);
			ChatMessage cmHistory = new ChatMessage("history", sender, receiver, historyMsg);
			if (userSession != null && userSession.isOpen()) {	//這個判斷是?
				userSession.getAsyncRemote().sendText(gson.toJson(cmHistory));//將紀錄送出
				System.out.println("history = " + gson.toJson(cmHistory));
				return;
			}
		}
		
		
		Session receiverSession = sessionsMap.get(receiver);
		if (receiverSession != null && receiverSession.isOpen()) {
			receiverSession.getAsyncRemote().sendText(message);
			userSession.getAsyncRemote().sendText(message);
			JedisHandleMessage.saveChatMessage(sender, receiver, message);
		}
		System.out.println("Message received: " + message);
	}

	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("Error: " + e.toString());
	}

	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
		String userNameClose = null;
		Set<String> userNames = sessionsMap.keySet();
		for (String userName : userNames) {
			if (sessionsMap.get(userName).equals(userSession)) {
				userNameClose = userName;
				sessionsMap.remove(userName);
				break;
			}
		}

		if (userNameClose != null) {
			Boolean isonline=true;
			Set<String> friends=selectfriend(userNameClose);
			State stateMessage = new State("close", userNameClose, userNames,friends,isonline);//
			String stateMessageJson = gson.toJson(stateMessage);
			Collection<Session> sessions = sessionsMap.values();
			for (Session session : sessions) {
				session.getAsyncRemote().sendText(stateMessageJson);
			}
		}

		String text = String.format("session ID = %s, disconnected; close code = %d%nusers: %s", userSession.getId(),
				reason.getCloseCode().getCode(), userNames);
		System.out.println(text);
	}
	
	
	public HashSet<String> selectfriend(String userName) {
		JedisPool pool = JedisPoolUtil.getJedisPool();
		Jedis jedis = null;
		jedis = new Jedis("localhost", 6379);
		jedis.auth("123456");
//		String userName="早";	//傳入使用者
		HashSet<String> friends= new HashSet<String>();;
		Set<String> set = jedis.keys(userName+"*");
        for (String friendli : set) { 
             int mark = friendli.indexOf(":");
             String friend = friendli.substring(mark+1,friendli.length());
             System.out.println(friend);
             friends.add(friend);
        }
        
        for(String s:friends)
        {
        System.out.println(s);
        }
        return friends;

	}
}
