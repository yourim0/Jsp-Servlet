<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%
out.print("<h2>페이지 이동</h2>");
ArrayList<String> lists = (ArrayList)session.getAttribute("lists");
for(String str : lists){
	out.print(str+"<br>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="SessionLocation.jsp">SessionLocation.jsp 바로가기</a>
</body>
</html>