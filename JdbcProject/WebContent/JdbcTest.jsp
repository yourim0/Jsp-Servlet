<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;

	String url = "jdbc:oracle:thin:@localhost:1521:orcl";

	try{
		Class.forName("oracle.jdbc.driver.OracleDriver"); //클래스라는 클래스, oracledriver라는 이름이 있는지 체크 (없으면 오라클 사용못함)
		conn = DriverManager.getConnection(url, "musthave", "1234"); //연결 부분, driverManager도 클래스
		
		conn.close(); //끊어주지 않으면 부하생긴다
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	DB연결 성공
</body>
</html>