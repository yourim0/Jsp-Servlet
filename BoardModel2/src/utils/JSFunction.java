package utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

public class JSFunction {
	//메세지 창 출력 및 페이지 이동
	//jsp 내장객체 out을 사용하려면 jspwriter로 생성해주어야 한다.
	
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script = "" //삽입할 자바스크립트 코드
							+"<script>"
							+"    alert('" + msg + "');"
							+"    location.href='" + url + "';"
							+"</script>";
			
			out.println(script);
			
		}catch(Exception e) {
			
		}
	}
	
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = "" //삽입할 자바스크립트 코드
							+"<script>"
							+"    alert('" + msg + "');"
							+"    history.back();"
							+"</script>";
			
			out.println(script);
			
		}catch(Exception e) {
			
		}
		
	}
	
	 //추가 : 기존은 jsp 내장객체 JspWriter 새용하는 방식이기 때문에 servlet에서 사용할 수 있게response 객체에서 제공하는 getwirter 메소드를 사용하도록 수정
	public static void alertLocation(HttpServletResponse response, String msg, String url) {
		try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter writer = response.getWriter();
			String script = " "
						+ "<script>" 
						+ "    alert('" + msg + "');"
						+ "    location.href='" + url + "';"
						+ "</script>";
			
			writer.print(script);
		}catch(Exception e) {
			
		}
}
	
	
	public static void alertBack(HttpServletResponse response, String msg) {
		try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter writer = response.getWriter();
			String script = " " //삽입할 자바스크립트 코드
							+"<script>"
							+"    alert('" + msg + "');"
							+"    history.back();"
							+"</script>";
			
			writer.print(script);	
		}catch(Exception e) {
			
		}
		
	}
	
	
}

