<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--<jsp:forward page="ParamForward.jsp">
		<jsp:param name="param1" value="리미" />
		<jsp:param name="param2" value="28" />
	</jsp:forward> -->
	
	<jsp:include page="inc/ParamInclude.jsp">
		<jsp:param value="강원도" name="loc1" />
		<jsp:param value="부산" name="loc2" />
	</jsp:include>
		
</body>
</html>