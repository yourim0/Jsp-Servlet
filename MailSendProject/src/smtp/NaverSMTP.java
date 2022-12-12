package smtp;

import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import com.sun.net.httpserver.HttpExchange;

public class NaverSMTP {
	private final Properties serverInfo;
	private final Authenticator auth;
	
	public NaverSMTP() {
		//네이버 SMTP 서버 접속 정보
		serverInfo = new Properties();
		serverInfo.put("mail.smtp.host", "smtp.naver.com"); //네이버 smtp 서버명
		serverInfo.put("mail.smtp.port" , "465"); //456:네이버 포트번호
		serverInfo.put("mail.smtp.starttls.enable","true");
		serverInfo.put("mail.smtp.auth" , "true");
		serverInfo.put("mail.smtp.debug" , "true");
		serverInfo.put("mail.smtp.socketFactory.port" , "465");
		serverInfo.put("mail.smtp.socketFactory.class" , "javax.net.ssl.SSLSocketFactory");
		serverInfo.put("mail.smtp.socketFactory.fallback" , "false");
		
		//사용자 인증정보
		auth = new Authenticator() {
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("네이버 아이디", "네이버 비밀번호");
			}
		};
	}
	
	//주어진 메일 내용을 네이버 smtp 서버를 통해 전송
	public void emailSending(Map<String, String> emailInfo) throws MessagingException{
			//세션 생성
		Session session = Session.getInstance(serverInfo,auth);
		//session.setDebug(true);
		
		//2. 메세지 작성
		MimeMessage msg= new MimeMessage(session);

		//폼에서 입력한 데이터
		msg.setFrom(new InternetAddress(emailInfo.get("from")));
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress(emailInfo.get("to")));
		msg.setSubject(emailInfo.get("subject"));
		msg.setContent(emailInfo.get("content"), emailInfo.get("format"));
		
		//3. 전송
		Transport.send(msg);
	}
}
