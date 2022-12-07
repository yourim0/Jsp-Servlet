<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 첨부형 게시판 - 목록보기(List) p493</h2>
	
	<form method="get">
	<table border="1" width="90%">
		<tr>
			<td align = "center">
				<select name="searchField">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="seachWord" />
				<input type="submit" value="검색하기" />
			</td>
		</tr>
	</table>
	</form>
	
	
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="*">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
			<th width="8%">첨부</th>
		</tr>

	
	
		<c:choose>
			<c:when test="${empty boardLists }">
			<tr>
				<td colspan="6" align="center">
				 	등록된 게시물이 없어요!!!!!!
				</td>
			</tr>
			</c:when>
			
			<c:otherwise>
					<c:forEach items="${boardLists }" var = "row" varStatus="loop">
						<tr>
							<td>${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)} </td>
							<td>${row.title }</td>
							<td>${row.name }</td>
							<td>${row.visitcount }</td>
							<td>${row.postdate }</td>
							<td>[DOWNLOAD]</td>
						</tr>
					</c:forEach>
			</c:otherwise>		
		</c:choose>
	</table>
	
	<table border="1" width="90%">
		<tr align="center">
			<td>${map.pagingImg }</td>
			<td width="100"><button type="button">글쓰기</button></td>
		</tr>
	</table>
	
	
	
	
</body>
</html>