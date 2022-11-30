<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%@ page import="model1.board.BoardDTO" %>
<%@ page import="model1.board.BoardDAO" %>
<%@ page import="utils.JSFunction" %>
<%
//폼값 받기 
String title = request.getParameter("title");
String content = request.getParameter("content");

//폼값을 dto 객체에 저장
BoardDTO dto = new BoardDTO();
dto.setTitle(title);
dto.setContent(content);
dto.setId(session.getAttribute("UserId").toString());
//dto.setId("리미리미");

//dto 객체를 통해 db 에 dto저장
BoardDAO dao = new BoardDAO(application);
int iResult = dao.insertWrite(dto);
dao.close();

//성공 or 실패
if(iResult == 1){
	response.sendRedirect("List.jsp");
}else{
	JSFunction.alertBack("글쓰기 실패",out);
}

%>