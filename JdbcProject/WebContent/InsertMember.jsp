<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="common.JDBConnect" %>
    <!-- 쿼리문 실행, 오토 커밋이다 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 추가 테스트(executeUpdate() 사용)</h2>
	<%
	/*JDBConnect jdbc = new JDBConnect();
	
	String sql = "insert into member values(?,?,?,sysdate)";// 동적쿼리문->prepared사용
	
	PreparedStatement psmt = jdbc.con.prepareStatement(sql); //객체생성
	psmt.setString(1,"test1");//문자열일때 (set)물음표의 값을 작성하는 메소드
	psmt.setString(2,"1111"); //물음표 갯수맞게 사용될 값을 지정하면 실행할 때 적용된다. 
	psmt.setString(3,"회원1");
	
	int result = psmt.executeUpdate(); //쿼리문 실행( inser 구문 )
	if(result != 0){
		out.print("쿼리문 실행 완료");
	}else{
		out.print("쿼리문 실행 실패");
	}
	
	//db관련 된건 다 닫아줘야함
	psmt.close();
	jdbc.close();*/
	
	
	%>
	<h1>회원 목록 조회 테스트(executeQuery() 사용) 정적인거~!~!</h1>
	<%
		JDBConnect jdbc = new JDBConnect();
	
		String sql = "select * from member"; //정적 쿼리문
		Statement stmt= jdbc.con.createStatement();
		
			
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){//bolean 타입. true/fasle반환 /반환값이 false때가지 반복
			String id = rs.getString("id"); //= rs.getString(1) ->첫번째 컬름을 가리킴
			String pass = rs.getString("pass"); //가져오고 싶은 데이터만 가져오면 된다
			String name = rs.getString("name");
			java.sql.Date regidate = rs.getDate("regidate");
			
			out.print(String.format("%s %s %s %s",id, pass, name, regidate) + "<br/>");
		}
		
		//사용 후 필수적으로close해주어야 하는 변수 -> rs, stmt, psmt, cons
		/*
		rs.close(); 
		stmt.close();
		jdbc.close(); close함수에 다 담음*/
		
		jdbc.close();
	%>
	
</body>
</html>