<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
	<a href="./requestWebinfo.jsp?eng=Hello&han=안녕"> <!-- GET 방식으로 요청 -->
		GET 방식 전송
	</a>
	<br /><br /><br />
	<form action="./requestWebinfo.jsp" method="get"> <!-- POST 방식으로 요청 -->
		영어 : <input type="text" name="eng" value="Bye" /><br/>
		한글 : <input type="text" name="han" value="잘 가" /><br/>
		<input type="submit" value="POST 방식 전송" />
	</form>
</body>
</html>