<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>2. HTTP응답 헤더 설정하기</h2>
	<form action="./ResponseHeader.jsp" method="get">
		날짜 형식 : <input type="text" name="add_date" value="2022-11-23 09:00" /><br />
		숫자 형식 : <input type="text" name="add_int" value="5959" /><br />
		문자 형식 : <input type="text" name="add_str" value="리미" /><br />
		<br /><input type="submit" value="응답 헤더 설정 & 출력">
	</form>
</body>
</html>