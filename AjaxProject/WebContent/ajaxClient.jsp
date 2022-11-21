<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#buttonSubmit").on("click",function(){
			$.ajax({
				url:'./ajaxServer.jsp',
				type:'post',
				data:{nickName:'리미'},//여기까지 서버 쪽으로 보낼 때 필요한 데이터
				dataType:'json', //여기부터는 받을 때 필요한 데이터
				success:function(data){ //data={"nickName":"리미"} (data:json형태로 넘어온 정보를 서버가 보내는 정보를 받을 매개변수)
					console.log(data);
					console.log("요청성공");
					$("#nickname").text(data.nickName)
				}
				
				
			});
		});		
	});
</script>
</head>
<body>
	<input id="buttonSubmit" type="button" value="제출">
	<h1 id="nickname"></h1>
	<p>ajax 통신성공 </p>
</body>
</html>