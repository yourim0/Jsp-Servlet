<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Nonage Shop</title>
  <link href="css/shopping.css" rel="stylesheet">  
  <script type="text/javascript" src="member/member.js"></script>
  <script type="text/javascript" src="mypage/mypage.js"></script> 
</head>
<body> <!-- 헤더 부분 내용 -->
<div id="wrap">
	<header>
		<div id="logo">
			<a href="NanageServlet?command=index">
				<img src="images/logo.gif" width="180" height="100" alt="nonageshop">
			</a>
		</div>
		<nav id="catagory_menu">
			<ul>
				<c:choose>
				<c:when test="${empty sessionScope.loginUser}">
					<li>
						<a href="NanageServlet?command=login_form" style="width:110px;">LOGIN(CUSTOMER)</a>
						<a href="NanageServlet?command=admin_login_form" style="width:100px">| ADMIN</a>
					</li>
					<li>/</li>
					<li><a href="NanageServlet?command=contract">JOIN</a></li>
					<li>/</li>
				</c:when>
				<c:otherwise>
					<li style="color:orange">
						${sessionScope.loginUser.name}${sessionScope.loginUser.id}
					</li>
					<li><a href="NanageServlet?command=logout">LOGOUT</a></li>
				</c:otherwise>
				</c:choose>
				<li>/</li>
				<li>
					<a href="NonageServlet?command=mypage">MY PAGE</a>
				</li>
				<li>/</li>
				<li>
					<a href="NonageServlet?command=qna_list">Q&amp;A</a>
				</li>
			</ul>
		</nav>
		<nav id="top_menu">
			<ul>
				<li>
					<a href="NanageServlet?command=catagory&kind=1">Heels</a>
				</li>
				<li>
					<a href="NanageServlet?command=catagory&kind=2">Boots</a>
				</li>
				<li>
					<a href="NanageServlet?command=catagory&kind=3">Sandals</a>
				</li>
				<li>
					<a href="NanageServlet?command=catagory&kind=4">Sneakers</a>
				</li>
				<li>
					<a href="NanageServlet?command=catagory&kind=5">On Sale</a>
				</li>
			</ul>		
		</nav>
		<div class="clear"></div>
		<hr>	
	</header>
