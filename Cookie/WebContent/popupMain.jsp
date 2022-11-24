<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String popupMode = "on"; //off->on
	
	//1. 요청 헤더에서 쿠키정보 얻기 
		Cookie[] cookies = request.getCookies();
		//2. 쿠키 정보가 있는지 확인
		if(cookies != null){
			for(Cookie c : cookies){
				String cookieName = c.getName(); //PopupClose
				String cookieValue = c.getValue(); //off
				if(cookieName.equals("PopupClose")){
					popupMode = cookieValue;
				}
			}
		}else{
			out.print("쿠키정보없음");
		}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#closeBtn").click(function(){
			$("#popup").hide();
			//let chkVal = $("input:checkbox[id=inactiveToday]:checked").val();//속성선택자 + 상태선택자 //1이 넘어오면 체크가 된 상태
			let chkVal = $("input:checked").val();
			$.ajax({
				url:'./PopupCookie.jsp',
				type:'get',
				data:{inactiveToday:chkVal},//파라미터값
				dataType:"text",
				success:function(resData){
					if(resData != ''){
						document.write(resData);
						//location.reload();
					}
				}
			});
		});	
	});

</script>
<style type="text/css">
	div#popup{
	        position: absolute; top:100px; left:100px; color:yellow;  
	        width:300px; height:100px; background-color:gray;
	    }
	    div#popup>div{
	        position: relative; background-color:#ffffff; top:0px;
	        border:1px solid gray; padding:10px; color:black;
	    }
</style>
</head>
<body>
	
	<h2>팝업 메인 페이지</h2><%
		out.print("팝업창은 " + popupMode + "상태입니다<br>");
	%>
	<%if(popupMode.equals("on")) {%> 
	<!-- 팝업창으로 사용할 div -->
	<div id ="popup">
		<h2 align="center">공지사항 팝업입니다.</h2>
		<div align="right">
			<form name="popFrm">
				<input type="checkbox" id="inactiveToday" value="1" />
				하루 동안 열지 않음
				<input type="button" value="닫기" id="closeBtn" />
			</form>
		</div>
	</div>
	<%} %>
</body>
</html>