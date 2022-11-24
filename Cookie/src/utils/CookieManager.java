package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {

	public static void makeCookie(HttpServletResponse response, String cName, 
								String cValue, int cTime) {
		Cookie cookie = new Cookie(cName,cValue);
		cookie.setPath("/");
		cookie.setMaxAge(cTime);
		response.addCookie(cookie);
	}
	
	public static String readCookie(HttpServletRequest request, String cName) {
		String cookieValue=""; //전역변수로 변환
		
		Cookie[] cookies = request.getCookies();
		//2. 쿠키 정보가 있는지 확인
		if(cookies != null){
			for(Cookie c : cookies){
				String cookieName = c.getName();
				if(cookieName.equals(cName)) {
					cookieValue = c.getValue();		
				}
			}
		}
		
		return cookieValue;
	}
	
	//쿠키삭제
	
	public static void deleteCookie(HttpServletResponse response,String cName) {
		makeCookie(response,cName,"",0);
	}
	
}
