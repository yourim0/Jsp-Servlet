<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="common.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--<c:태그명 />--%>
	<%--<c:set></c:set> //<c:set />--%>
	
	<!-- int directVar = 100 -->
	<!-- 동적 데이터 처리가 가능 -->
	
	<!-- page 영역에 저장 -->
	<c:set var="directVar" value="100" />
	<c:set var="elVar" value="${ directVar mod 5}" />
	<!-- 표현식 사용도 가능 -->
	<c:set var="expVar" value="<%= new Date() %>" />
	<!-- 잘 안씀 -->
	<c:set var="betweenVar">변수값 이렿게 설정</c:set>
	
	directVar : ${ pageScope.directVar } <br>
	expVar : ${ directVar } <br>
	betweenVar : ${ expVar } <br>
	betweenVar : ${ betweenVar } <br>
	
	<!-- scope : 기본은 page 영역, 원하는 영역으로 설정 가능 -->
	<c:set var="personVar1" value='<%= new Person("홍길동",10) %>' scope="request" />
	${requestScope.personVar1.name }<br>
	${personVar1.age }<br> <!-- 지금은 requst객체에만 있으니까 굳이 영역 특정 없이도 나와 -->
	
	<%--변수 삭제 <c:remove 변수명>  --%>
	<c:remove var="personVar1" scope="request" />
		${requestScope.personVar1.name }<br>
		${personVar1.age }<br>
	
</body>
</html>