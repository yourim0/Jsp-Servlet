<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(function(){
		$('#searchBtn').click(function(){
			$.ajax({
				type: 'get',
				url:"./NaverSearchAPI.do",
				data: {
						keyword:$('#keyword').val(),
						startNum:$('#startNum option:selected').val()
				},
				dataType:"json",
				success: sucFuncJson, //ajax 함수 호출 시()필요없더
				error : errFunc
			});
		});
	});
	
	function sucFuncJson(d){  
		var str = ""; //str 한 개당 한 개의 데이터
		$.each(d.items,function(index,item){//index:반복 요소의 인덱스 / item:6개의 속성이있는 하나의 객체
			str += "<ul>"
			str += "<li>" + (index + 1) + "</li>"
			str += "<li>" + item.title + "</li>"
			str += "<li>" + item.description + "</li>"
			str += "<li>" + item.bloggername + "</li>"
			str += "<li>" + item.bloggerlink + "</li>"
			str += "<li>" + item.postdate + "</li>"
			str += "<li><a href='" + item.link +"' target='_black'>바로가기</a></li>"
			str += "</ul>"
				
		
		});
		$("#searchResult").html(str);
	}
	
	function errFunc(e){
		alert("실패 : " + e.status); //status속성으로 에러 원인 출력
	}
	
</script>

<style>
	ul{border:2px #cccccc solid;}
</style>
</head>
<body>
	<div>
		<div>
			<form id="searchFrm"> <!-- startNum, keyword를 서블릿으로 보냄 -->
				한 페이지에 10개씩 출력됨 <br />
				<select id = "startNum">
					<option value="1">1페이지</option>
					<option value="11">2페이지</option>
					<option value="21">3페이지</option>
					<option value="31">4페이지</option>
					<option value="41">5페이지</option>
				</select>	
				<input type="text" id="keyword" placeholder="검색어를 입력하세요" />
				<button type="button" id="searchBtn">검색 요청</button>
			</form>
		</div>
		<div class="row" id="searchResult">
			여기에 검색 결과가 출력됩니다.
		</div>
	</div>
</body>
</html>