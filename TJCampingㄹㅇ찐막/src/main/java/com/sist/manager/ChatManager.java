package com.sist.manager;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;
@ServerEndpoint(value="/chat/chat-ws",configurator = HttpSessionConfigurator.class)
public class ChatManager {
   private static Map<Session,ChatVO> users=Collections.synchronizedMap(new HashMap<Session,ChatVO>());
   @OnOpen
   public void onOpen(Session session,EndpointConfig config) throws Exception
   {
	   ChatVO vo=new ChatVO();
	   HttpSession hs=(HttpSession)config.getUserProperties().get(HttpSessionConfigurator.Session);
	     vo.setId((String)hs.getAttribute("id"));
	     vo.setName((String)hs.getAttribute("name"));
	     vo.setSession(session);
	     users.put(session,vo);
	     System.out.println("ID:"+vo.getId());
	     System.out.println("Name:"+vo.getName());
	   Iterator<Session> it=users.keySet().iterator();
	   while(it.hasNext())
	   {
		   Session ss=it.next();
		   ChatVO vo1=users.get(session);
		   if(ss.getId()!=session.getId())
		   {
		      ss.getBasicRemote().sendText("msg:[알림 ☞]"+vo.getName()+"님이 입장하셨습니다✋");
		   }
		   System.out.println(vo1.getName()+":전송 완료!!");
	   }
	   System.out.println("클라이언트 접속...:"+vo.getId()+"--"+vo.getName()+" "+vo.getSession());
	   
   }
   @OnMessage
   public void onMessage(String message,Session session) throws Exception
   {
	   System.out.println("수신된 메세지...:"+message+"==> 보낸사람:"+session.getId());
	   Iterator<Session> it=users.keySet().iterator();
	   while(it.hasNext())
	   {
		   Session ss=it.next();
		   ChatVO vo=users.get(session);
		   if(session.getId()==ss.getId())
		   {
		       ss.getBasicRemote().sendText("my:["+vo.getName()+"]"+message);
		   }
		   else
		   {
			   ss.getBasicRemote().sendText("you:["+vo.getName()+"]"+message);
		   }
		   System.out.println(vo.getName()+":전송 완료!!");
	   }
	   
   }
   @OnError
   public void onError(Throwable ex)
   {
	   ex.printStackTrace();
   }
   @OnClose
   public void onClose(Session session) throws Exception
   {
	   Iterator<Session> it=users.keySet().iterator();
	   while(it.hasNext())
	   {
		   Session ss=it.next();
		   ChatVO vo=users.get(session);
		   if(ss.getId()!=session.getId())
		   {
		     ss.getBasicRemote().sendText("msg:[알림 ☞]"+vo.getName()+"님이 퇴장하셨습니다✋");
		   }
		     System.out.println(vo.getName()+":전송 완료!!");
	   }
	   System.out.println("클라이언트 퇴장:"+users.get(session).getName());
	   users.remove(session);
	   
		/*
		 * for(int i=0;i<users.size();i++) { ChatVO vo=users.get(i);
		 * if(vo.getSession().getId()==session.getId()) {
		 * System.out.println("클라이언트 퇴장...:"+vo.getUserName()); users.remove(i);
		 * 
		 * break; } }
		 */
	   
   }
}
