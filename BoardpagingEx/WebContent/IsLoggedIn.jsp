<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.JSFunction"  %>

<%
if(session.getAttribute("UserId") == null){
	JSFunction.alertBack("로그인 후 이용하세요", out);
	
	return;
}


%>
