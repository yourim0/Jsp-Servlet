<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>외부파일 2</h1>
	<%
	String newVar2 = "백제 온조왕";
	%>
	<ul>
		<li>page 영역 속성 : <%=pageContext.getAttribute("pAttr") %></li>
		<li>requets 영역 속성 : <%=request.getAttribute("rAttr") %></li>
	</ul>
</body>
</html>