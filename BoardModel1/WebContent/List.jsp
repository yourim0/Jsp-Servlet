<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model1.board.BoardDAO" %>
<%@ page import="model1.board.BoardDTO" %>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="java.util.Map" %>
<%@ page import ="java.util.List" %>
    
    
<%
	BoardDAO dao = new BoardDAO(application);

	Map<String, Object> param = new HashMap<String, Object>(); //검색 기능에서 사용할 겁색 키워드와 값
	String searchField = request.getParameter("searchField"); //쿼리스트링으로 넘어간 값은 requset영역에 저장
	String searchWord = request.getParameter("searchWord"); 
	
	
	if(searchWord != null){ //검색 form은 searchword가 있을 때 동작
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	
	int totalCount = dao.selectCount(param);
	List<BoardDTO> boardLists = dao.selectList(param); //BoardDTO객체 9개 값을 가진 bbs리스트 반환
	dao.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./common/Link.jsp" ></jsp:include>
	<h2>목록보기(List)</h2>
	
	<form method="get">
	<table border="1" width="90%">
	<tr>
		<td align="center">
			<select name="searchField">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchWord" />
			<input type="submit" value="검색하기" />
		</td>
	</tr>		
	</table>
	</form>
	
	<table border="1" width="90%">
	<tr>
		<th width="10%">번호</th>
		<th width="50%">제목</th>
		<th width="15%">작성자</th>
		<th width="10%">조회수</th>
		<th width="15%">작성일</th>
	</tr>		
	
	<%
		if(boardLists.isEmpty()){
			
	%>
	
	<tr>
		<td colspan="5" align="center">
			<h2>등록된 게시물이 없습니다.~! '~'</h2>
		</td>
	</tr>
	
	<%} else {
	
	int virtualNum=0;
	for (BoardDTO dto : boardLists){
		virtualNum = totalCount--;
	%>
	
	
	<tr align="center"> 
		<td><%=virtualNum %></td>
		<td align="left">
			<a href="View.jsp?num=<%=dto.getNum() %> "><%=dto.getTitle() %>
			</a>
		</td>
		<td align="center"><%=dto.getId() %></td>
		<td align="center"><%=dto.getVisitcount() %></td>
		<td align="center"><%=dto.getPostdate() %></td>
	</tr>

	<%
		}
	}
	%>
	
	</table>
	
	<table border="1" width=90%">
		<tr align="right">
			<td><button type="button" onclick="location.href='Write.jsp';">글쓰기</button>
			</td>
		</tr>
	</table>
</body>
</html>