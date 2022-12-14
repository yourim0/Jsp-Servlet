<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.member.Member" %>
<%

	request.setCharacterEncoding("utf-8");

	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("userpwd");

	String uid = "admin";
	
	//gson사용 시 jason의 parse 속성과 함께 사용해야 3한다
	Gson gson = new Gson();
	Member m;
	
	if(uid.equals(userid)){
		m = new Member(userid, userpwd);
	}else{
		m = new Member();
	}
	
	//json형태의 객체로 변환
	out.print(gson.toJson(m)); //통 문자열로 json객체 구성 후 client로 전송 -> $("#nickName").text(data.nickName); 형태로 사용할 수 없다.(객체가 아니니까)
	
	
%>