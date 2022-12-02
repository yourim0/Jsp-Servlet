<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판-로그인</title>
</head>
<body>
	<jsp:include page="./common/Link.jsp"></jsp:include>
	<h2>로그인 페이지</h2>
	<span style="color : red; font-size: 1.2em;">
		<%=request.getAttribute("LoginErrMsg") == null?
				"" : request.getAttribute("LoginErrMsg")%>
	</span>
</body>
</html>