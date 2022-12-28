<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	
	String info_id=request.getParameter("id");
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	try{
        Context init = new InitialContext();
        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/myoracle");
        conn = ds.getConnection();

        pstmt=conn.prepareStatement("select * from member where id=?");
		pstmt.setString(1, info_id);
		rs = pstmt.executeQuery();
		rs.next();
		}catch(Exception e){
		e.printStackTrace();
		}
	
%>
<html>
<head>
<title>회원관리 시스템 관리자모드(회원 정보 보기)</title>
</head>
<body>
<center>
	<table border=1 width=300>
		 <tr>
			 <td>아이디:</td>
			 <td><%=rs.getString("id") %></td>
		 </tr>
		 <tr>
			 <td>비밀번호 : </td>
			 <td><%=rs.getString("pass") %></td>
		 </tr> 
		 <tr>
			 <td>나이:</td>
			 <td><%=rs.getString("age") %></td>
		 </tr>
		 <tr>
			 <td>성별:</td>
			 <td><%=rs.getString("gender") %></td>
		 </tr>
		 <tr>
			 <td>이메일 주소:</td>
			 <td><%=rs.getString("email") %></td>
		 </tr> 
		 <tr>
		 <td colspan=2><a href="member_list.jsp">리스트로 돌아가기</a></td>
	</table>
</center>
</body>
</html>
