<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); //한글 
	
	String id = request.getParameter("id");
	String sex = request.getParameter("sex");
	
	//checkbox는 배열 형태로 전달된다
	String favoStr = "";
	String[] favo = request.getParameterValues("favo"); //1차원 배열 형태
	for(String fa : favo){
		favoStr += fa + ", ";
	}
	
	String intro = request.getParameter("intro");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li><%=id %></li>
		<li><%=sex %></li>
		<li><%=favoStr %></li>
		<li><%=intro %></li>
	</ul>
</body>
</html>