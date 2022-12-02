<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="common.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>${personObj.name }, ${personObj.age }</li> <!-- getname 변수로  -->	
		<li>${ stringObj }</li><!--request.Scope.stringObj -->	
		<li>${ integerObj }</li>
	</ul>
	
	<p>${param.firstNum }</p>
	<p>${param.secondNum }</p>

	<!-- 파라미터로 넘어오는 건 다 문자열 -->
	<p>${param.firstNum } + ${param.secondNum }</p>
	
	<!-- EL 내부의 +는 연산자 수식-->
	<p>${param.fistNum + param.secondNum }</p>
	
	
		
</body>
</html>