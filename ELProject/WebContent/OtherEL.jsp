<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>context에서 읽어오는거</title>
</head>
<body>
	<!--web.xml 정보 읽어오기 (기존 : application.getInitParam) -->
	<h3>컨텍스트 초기화 매개변수 읽기</h3>
	<li>OracleDriver : ${ initParam.OracleDriver }</li>
</body>
</html>