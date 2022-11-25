<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="common.JDBConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>scott emp01 test</h1>
	<%
		JDBConnect jdbc = new JDBConnect();
	
		String deletesql = "delete from emp01 where deptno = ?";//동적
		PreparedStatement psmt3 = jdbc.con.prepareStatement(deletesql);
		psmt3.setInt(1,10); //10번부서 삭제
		
		psmt3.executeUpdate();
	
		String updatesql = "update emp01 set deptno = ? where deptno =?";//동적
		PreparedStatement psmt2 = jdbc.con.prepareStatement(updatesql);
		psmt2.setInt(1,10); //앞 숫자 1, 2는 물음표 순서
		psmt2.setInt(2,30);
		
		psmt2.executeUpdate();
		
	
		String sql = "select * from EMP01"; //정적 쿼리문
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);
		//Statement stmt= jdbc.con.createStatement();
		
		
			
		//ResultSet rs = stmt.executeQuery(sql);
		ResultSet rs = psmt.executeQuery(sql);
		
		while(rs.next()){
			int empno = rs.getInt(1);
			String ename = rs.getString(2);
			String job = rs.getString(3);
			int mgr = rs.getInt(4);
			String hiredate = rs.getString(5);  //날짜는 data타입, string 타입 둘다 가능
			int sal = rs.getInt(6);
			int comm = rs.getInt(7);
			int deptno = rs.getInt(8);
					
			
			out.print(String.format("%d %s %s %d %s %d %d %d", empno, ename, job, mgr, hiredate, sal, comm, deptno) + "<br/>");
		}
		
		//사용 후 필수적으로close해주어야 하는 변수 -> rs, stmt, psmt, cons
		/*
		rs.close(); 
		stmt.close();
		jdbc.close(); close함수에 다 담음*/
		
		//jdbc.close();
	%>
	
</body>
</html>