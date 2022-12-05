<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="common.Person"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>List 컬렉션 사용하기</h4>
	<%
	LinkedList<Person> lists = new LinkedList<Person>(); //lists 변수명 그대로 사용할 수 없다. 객체 혹은 영역객체에 담아서 사용해야 함
	lists.add(new Person("김유림",28));
	lists.add(new Person("성한빈",31));
	lists.add(new Person("권나현",28)); 
	//session.setAttribute("lists",lists);
	%>
	<c:set var="lists" value="<%=lists %>" />
	<c:forEach items="${lists }" var ="list" >
	<li>
		이름 : ${list.name }, 나이 : ${list.age } <!-- .name,.age:get메소드 사용한 것  -->
	</li>
	</c:forEach>
	
	
	<h4>Map 컬렉션 사용하기</h4>
	<%
	Map<String,Person> maps = new HashMap<String,Person>();
	maps.put("1st",new Person("김유림",28));
	maps.put("2nd",new Person("성한빈",31));
	maps.put("3rd",new Person("권나현",28));
	//session.setAttribute("maps",maps);
	 %>
	 
	 <c:set var="maps" value="<%=maps %>" /> <!-- value maps :maps 바로 사용 안돼. el이나 표현식으로 사용 -->
	 <c:forEach items="${maps }" var="map">
	 	<li>Key => ${map.key } <br />
	 		Value => 이름 : ${map.value.name },나이 : ${map.value.age }</li>
	 </c:forEach>
</body>
</html>