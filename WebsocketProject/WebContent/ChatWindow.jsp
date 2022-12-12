<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓 채팅</title>
<script>
var webSocket = new WebSocket("ws://localhost:8081/WebsocketProject/ChatingServer"); //ip주소:port번호
var chatWindow, chatMessage, chatId;

//---------------------------------------------------------
window.onload = function(){ //onload : 브라우저 로드 완료 후 마지막으로 이벤트 실행
	chatWindow = document.getElementById("chatWindow");
	chatMessage = document.getElementById("chatMessage");
	chatId = document.getElementById('chatId').value;
}

//메세지 전송
function sendMessage(){ 
	//1. 나의 창에 내가 보낸 메세지 표시,/2. 서버로 문자 전송
	chatWindow.innerHTML += "<div class='myMsg'>" + chatMessage.value + "</div>" 
	webSocket.send(chatId + '|' + chatMessage.value);
	//3. 내 창에서 메세지 삭제
	chatMessage.value = "";
	//4. 스크롤 자동이동
	chatWindow.scrollTop = chatWindow.scrollHeight;
}

//서버 연결 정료
function disconnect(){
	webSocket.close();
}

//엔터키 입력
function enterKey(){
	if(window.event.keyCode == 13){
		sendMessage();
	}
}


//웹소켓 서버에 연결됐을 때 실행
webSocket.onopen = function(event){
	chatWindow.innerHTML += "웹소켓 서버에 연결되었습니다.</br>";
}

//웸소켓이 닫혔을 때 (서버와 연결 끊겼을때)
webSocket.onclose = function(event){
	chatWindow.innerHTML += "웹소켓 서버가 종료되었습니다.</br>";
};

//에러발생시
webSocket.onerror = function(event){
	alert(event.data);
	chatWindow.innerHTML += "채팅 중 에러가 발생하였습니다. </br>";
}

//메세지 받았을 때
webSocket.onmessage = function(event){
	var message= event.data.split("|"); //대화명과 메시지 분리
	var sender = message[0]; //대화명
	var content = message[1]; //메세지 내용
	if(content != ""){
		if(content.match("/")){ //귓속말
			if(content.match(("/" + chatId))){
			var temp = content.replace(("/" + chatId), "[귓속말] : ");
			chatWindow.innerHTML += "<div>" + sender + "" + temp + "</div>";
			}
		}
		else { //일반대화
			chatWindow.innerHTML += "<div>" + sender + ":" + content + "</div>";
			
		}
	}
	chatWindow.scrollTop = chatWindow.scrollHeight;
};


</script>
</head>
<style>  <!-- 대화창 스타일 지정 -->  
		#chatWindow{border:1px solid black; width:270px; height:310px; overflow:scroll; padding:5px;}
		#chatMessage{width:236px; height:30px;}
		#sendBtn{height:30px; position:relative; top:2px; left:-2px;}
		#closeBtn{margin-bottom:3px; position:relative; top:2px; left:-2px;}
		#chatId{width:158px; height:24px; border:1px solid #AAAAAA; background-color:#EEEEEE;}
		.myMsg{text-align:right;}
	</style>
<body>
	대화명 : <input type="text" id="chatId" value="${ param.chatId }" readonly /> <!-- 수정불가 -->
	<button id="closeBtn" onclick="disconnect();">채팅종료</button>
	<div id = "chatWindow"></div>
	<div>
		<input type="text" id="chatMessage" onkeyup="enterKey();">
		<button id = "sendBtn" onclick="sendMessage();">전송</button>
	</div>
</body>
</html>