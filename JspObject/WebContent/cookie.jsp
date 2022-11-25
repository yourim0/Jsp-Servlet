<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 쿠키 객체를 생성한다. 
	Cookie cookie = new Cookie("myCookie","쿠키야미~!");
	//2. 쿠키의 생성 경로 설정
	cookie.setPath(request.getContextPath()); //현재 프로젝트의 기본 루트패스
	//3. 유지시간
	cookie.setMaxAge(3600); //세션 유지 시간(초)
	//4. 응답헤더에 쿠키정보 저장
	response.addCookie(cookie);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
	<!-- 읽어올 때 사용방법 -->
	<%
		//1. 요청 헤더에서 쿠키정보 확인 
		Cookie[] cookies = request.getCookies();
		//2. 쿠키 정보가 있는지 확인
		if(cookies != null){
			for(Cookie c : cookies){
				String cookieName = c.getName();
				String cookieValue = c.getValue();
				out.print(cookieName + " : " + cookieValue);
				
			}
		}else{
			out.print("쿠키정보 없습니다.");
		}
	
	%>
</body>
</html>