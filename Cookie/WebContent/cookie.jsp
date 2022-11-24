<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Cookie cookie = new Cookie("myCookie","야미~");
	cookie.setPath(request.getContextPath());
	cookie.setMaxAge(3600);
	response.addCookie(cookie);


%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//1. 요청 헤더에서 쿠키정보 얻기 
	Cookie[] cookies = request.getCookies();
	//2. 쿠키 정보가 있는지 확인
	if(cookies != null){
		for(Cookie c : cookies){
			String cookieName = c.getName();
			String cookieValue = c.getValue();
			out.print(cookieName + ":"+ cookieValue);
		}
	}else{
		out.print("쿠키정보없음");
	}

%>   
</body>
</html>