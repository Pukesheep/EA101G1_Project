package com.chat.data;

import java.io.ObjectInputStream.GetField;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import java.util.TimerTask;
import java.util.stream.Collectors;

import com.member.model.MemberDAO;
import com.member.model.MemberJDBCDAO;
import com.member.model.MemberService;
import com.member.model.MemberVO;

import redis.clients.jedis.Jedis;

public class test {
	public static void main(String[] args) {
		
	
		
		Jedis jedis = null;
		jedis=new Jedis("localhost",6379);
		jedis.auth("123456");
		MemberJDBCDAO memSvc=new MemberJDBCDAO();
		List<MemberVO> listMember=memSvc.getAll();
		List<String> list=new ArrayList<String>();
		for(MemberVO mem:listMember) {
			list.add(mem.getMem_name());
		}
		list.add("CustomerSever");
		for(int i=0;i<list.size();i++) {
			List<String> newList = new ArrayList<>();
			for(int j=0;j<list.size();j++) {				
				if(!(list.get(i).equals(list.get(j)))) {
					StringBuffer str=new StringBuffer(list.get(i));
					String key=str.append(":").append(list.get(j)).toString();
					if (!jedis.exists(key)) {	//改
						String message="{\"type\" : \"chat\"," + "\"sender\" : \""+list.get(i)+"\",\"receiver\":\""+list.get(j)+"\",\"message \":\" "
								+ " welcome \" }";
						jedis.rpush(key,message);
						System.out.println(key);
					}
				}
				
			}	
		}
		jedis.close();
		

		
	}
}
