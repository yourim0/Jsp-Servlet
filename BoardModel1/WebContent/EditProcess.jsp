<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model1.board.BoardDTO" %>
<%@ page import="model1.board.BoardDAO" %>
<%@ include file ="./IsLoggedIn.jsp" %>

<%
String num = request.getParameter("num");
System.out.print("editprocess : "+num);
String title = request.getParameter("title");
String content = request.getParameter("content");

BoardDTO dto = new BoardDTO();
dto.setNum(num);
dto.setTitle(title);
dto.setContent(content);



BoardDAO dao = new BoardDAO(application);
int affected = dao.updateEdit(dto);
System.out.print(affected);
dao.close();

if(affected == 1){ //1이면 성공 0이면 실패 
	//처리된 내용이 필요하다 : foward , 내용은 필요 없고 페이지 이동만 하면 된다 : redirect 
	response.sendRedirect("View.jsp?num=" + dto.getNum());
}else{
	JSFunction.alertBack("수정 실패하였습니다.",out);
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