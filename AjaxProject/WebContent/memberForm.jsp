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
		$("#check").click(function(){
			if($("#userid").val() == ""){
				$("#result").text("id 입력하세요");
				return;
			}
			
			query = {
					userid:$("#userid").val(),
					userpwd:$("#userpwd").val()
			}
			
			$.ajax({
				url: 'ajaxServer5.jsp',
				type:'post',
				data: query  //성공적으로 데이터처리했을 때 실행되는 함수 .done
			}).done(function(data){ //gson으로 넘어온 형식은 json이지만 문자열로 받음. 다시 객체로 변환해주어야 함
				obj = JSON.parse(data); //client에서 받은 json을 사용하려면 json.parse를 이용해서 객체형식으로 형변환 해주어야 한다
				if(obj.userid != undefined){
					$("#result").text(obj.userid + " / " + obj.userpwd);
				}else{
					$("#result").text("존재하지 않는 아이디 입니다");
				}
			});
			
		});
	});

</script>
</head>
<body>
	<label>user ID</label>
	<input type="text" id="userid"> <br>
	<label>user PWD</label>
	<input type="password" id="userpwd">
	<button id="check">Check</button>
	<p id="result"></p>
</body>
</html>