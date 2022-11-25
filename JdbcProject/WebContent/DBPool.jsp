<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="common.DBConnPool" %> <!-- 생성하는 순간 db연결 -->
<%
	DBConnPool pool = new DBConnPool();
	out.print("<h1>성공!!!!</h1>");
	pool.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>