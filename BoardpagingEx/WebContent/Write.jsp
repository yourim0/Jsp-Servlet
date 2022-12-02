<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./IsLoggedIn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script>

function validateForm(form){
	if(form.title.value == ""){
		alert("제목을 입력해");
		form.title.focus();
		return false();
	}
	if(form.content.value == ""){
		alert("내용 입력해");
		from.content.focus();
		return false();
	}
}


</script>


</head>
<body>
	<h1>회원제게시판 - 글쓰기(write)</h1>
	<form name = "writeFrm" method="post" action="WriteProcess.jsp"
	onsubmit="return validateForm(this);">
		<table border="1" width="90%">
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" style="width:90%;" />
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" style="width: 90%; height:100px;"></textarea>	
				</td>	
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">작성 완료</button>
					<button type="reset">다시 입력</button>
					<button type="button" onclick="location.href='List.jsp';">목록보기</button>
				</td>
			</tr>
					
		</table>
</form>
</body>
</html>