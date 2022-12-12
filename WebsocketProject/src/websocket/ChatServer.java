package websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/ChatingServer") //클라이언트쪽에서 이용할 이름 
public class ChatServer { //서버의 역할 담당
 
	private static Set<Session> clients
		= Collections.synchronizedSet(new HashSet<Session>()); //Collections.synchronizedSet(); : set타입의 메소드를 동기화 처리(한명의 사용자만 사용 가능. 동시x)
	
	//클라이언트 접속시 실행되는 역할
	@OnOpen
	public void onOpen(Session session) {
		clients.add(session); // 해당 클라이언트 접속시 생성된 클라이언트의 session값을 저장
		System.out.println("웹소켓 연결 : " + session.getId());
		
	}
	
	//메세지 받으면 실행
	@OnMessage
	public void onMessage(String message,Session session ) throws IOException {
		System.out.println("메세지 전송 : " + session.getId() + " : " + message); //사용자가 보낸 메세지 출력
		//순차적으로 메세지 처리 위한 동기화 처리
		synchronized(clients) {
			for(Session client : clients) { //set에서 client 정보 받아오면서
				if(!client.equals(session)) { //나를 제외하고
					client.getBasicRemote().sendText(message); //원격의 연결되어있는 모든 client에 메세지 전달(스트림 역할)
				}
			}
		}
		
	}
	
	//클라이언트와 연결 끊기 (더이상 set에서 관리할필요 없다)
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
		System.out.print("웹소켓 종료 : " + session.getId());
	}
	
	
	//에러 발생 시 
	@OnError
	public void onError(Throwable e) {
		System.out.println("에러발생");
		e.printStackTrace();
	}
}
