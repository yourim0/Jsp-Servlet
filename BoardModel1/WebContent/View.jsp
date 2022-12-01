<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model1.board.BoardDTO" %>
<%@ page import="model1.board.BoardDAO" %>
<%
String num = request.getParameter("num");
System.out.print(num);
BoardDAO dao = new BoardDAO(application);

//조회수 증가
dao.updateVisitCount(num);
//특정번호 게시물정보 조회
BoardDTO dto = dao.selectView(num);
dao.close();


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script>
function deletePost(){
	//0. form태그를 객체로 가지고 온다
	let form = document.writeFrm; //form 태그를 스크립트에서 사용가능하다
	//1. 전송방식
	form.method = "post"; //<form name="wirteFrm" method="post" action="">와 동일
	//2. 이동할 페이지 
	form.action = "DeleteProcess.jsp"
	//3. submit기능 실행 //클릭하면 hidden의 정보가 넘어간다
	form.submit();
}

</script>
</head>
<body>
<jsp:include page="./common/Link.jsp" />
<h2>회원제 게시판 - 상세보기</h2>
<form name="writeFrm">
	<input type="hidden" name="num" value="<%=num %>" />
	<table border="1" width="90%">
		<tr>
			<td>번호</td>
			<td><%=dto.getNum() %></td>
			<td>작성자</td>
			<td><%= dto.getName() %></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=dto.getPostdate() %></td>
			<td>조회수</td>
			<td><%= dto.getVisitcount() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3"><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<td>내용</td>
		 	<td colspan="3" height="100"><%=dto.getContent().replace("\r\n", "<br/>") %></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
			<%
				if(session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(dto.getId())){
				%>
				<button type="button" onclick="location.href='Edit.jsp?num=<%=dto.getNum() %>';">수정하기</button>
				<button type="button" onclick="deletePost();">삭제하기</button>
				<%
				}
				%>
				<button type="button" onclick="location.href='List.jsp';">목록보기
				</button>
			</td>
		</tr>
	</table>	
</form>


</body>
</html>