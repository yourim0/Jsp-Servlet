<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="membership.MemberDTO" %> <!-- memberDAO에서 return dto 받아야 하니까 -->
<%@ page import="membership.MemberDAO" %>

<%
	String userId = request.getParameter("user_id");
	String userPwd = request.getParameter("user_pw");
	
	String oracleDriver = application.getInitParameter("OracleDriver"); //web.xml파일
	String oracleURL = application.getInitParameter("OracleURL");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePwd = application.getInitParameter("OraclePwd");
	
	MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
	MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
	dao.close();
	
	if(memberDTO.getId() != null){
		session.setAttribute("UserId", memberDTO.getId());
		session.setAttribute("UserName", memberDTO.getName());
		response.sendRedirect("LoginForm.jsp"); //단순 페이지 이동
	}else{
		request.setAttribute("LoginErrMsg", "로그인 오류입니다");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);//req,res에 대한 제어권을 넘기기위한 목적
	}

%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>