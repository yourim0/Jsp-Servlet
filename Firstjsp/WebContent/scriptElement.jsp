<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
스크립트 세가지 형식
<%! 
	//선언문
	//변수나 메소드 정의
	//전역변수(인스턴스 변수)
	
	int sum = 0;
	public int add(int x, int y){
		sum = x + y;
		return sum;
	}
%>

<%
	//스크립틀릿
	//변수나 실행문 정의(메소드 정의 불가) 
	//jsp service()메소드 안에 정의되어 있기 때문에 메소드를 정의하면 메소드 내부에 메소드를 정의한것과 같아서 오류 발생한다. 
	int result = add(10,20);
%>
<br>

결과 : 
<%= result
	//표현식
	//자바의 결과 출력 
	//지역변수
%>
<br>

결과 : 
<%= add(50,10) %>

</body>
</html>