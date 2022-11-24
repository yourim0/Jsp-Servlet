<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String chkVal = request.getParameter("inactiveToday");

	if(chkVal != null && chkVal.equals("1")){ //1이 넘어왔을 경우에만 쿠키생성
		Cookie cookie = new Cookie("PopupClose","off");
		cookie.setPath(request.getContextPath());
		cookie.setMaxAge(3); //3초뒤 창 다시 보임 
		response.addCookie(cookie);
		
		out.print("<h1>하루동안 창 열기 금지</h1>");		
	}

%>
