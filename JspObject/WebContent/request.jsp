<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person"%>

<%
	request.setAttribute("requestString","request 영역의 문자열");
	request.setAttribute("requestPerson", new Person("안중근",31));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>forward 방식으로 이동한 페이지</h1>
	<%
		Person person = (Person)request.getAttribute("requestPerson");
	%>
	<%=request.getAttribute("requestString") %>
	<br>
	<%=person.getName() %>
	<%=person.getAge() %>
	
	<h2>포워드한 방식으로 이동해야한다. a태그 링크 같은걸로 이동 안됨</h2>
	<%
		RequestDispatcher disforward = request.getRequestDispatcher("RequesForward.jsp");
		disforward.forward(request, response);
	%>
</body>
</html>