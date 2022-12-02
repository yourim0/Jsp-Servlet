package utils;

import javax.servlet.jsp.JspWriter;

public class JSFunction {

	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script =""
							+ "<script>"
							+ " alert('"+ msg + "');"
							+ " location.href='"+ url+ "' ;"
							+ "</script>";
			out.println(script);
		}catch(Exception e) {
			
		}
	}
	
	
	
	
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = "" //삽입할 자바스크립트 코드
							+ "<script>"
							+ "		alert('" + msg + "');"
							+ "		history.back();" //이전페이지로 강제 페이지 이동(.forward)
							+ "</script>";
			
			out.println(script);			
		}catch(Exception e) {
			
		}
	}
	
}
