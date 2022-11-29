<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="person" class="common.Person"></jsp:useBean>  <!-- person이 참조변수 역할을 한다 -->
	<!--<jsp:setProperty property="name" name="person" value="" />
	<jsp:setProperty property="age" name="person" value="" />-->
		<!--<jsp:setProperty property="name" name="person" param="name" />
	<jsp:setProperty property="age" name="person" param="age" />-->
	<!-- 변수 명과 변수의 개수가 같을 땐 *로 입력 가능하다 -->
	<jsp:setProperty property="*" name="person" />
	
	<ul>
		<li><jsp:getProperty property="name" name="person" /></li>
		<li><jsp:getProperty property="age" name="person" /></li>
	</ul>
</body>
</html>