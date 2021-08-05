<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<textarea cols="70" rows="30" id="messageArea"></textarea>
	<div>
		<input type="hidden" id="user_id" value="${user_id} : "/><br/>
		<input type="text" id="message" placeholder="메시지를 입력하세요." />
		<input type="button" id="sendBtn" value="전송"/>
	</div>
	
</body>
<script type="text/javascript">
	$("#message").keypress(function(e) {
		
		if(e.keyCode==13){
			console.log("asdfhfghfh");
			$("#sendBtn").trigger("click");
		}
		
	});
	
	$("#sendBtn").click(function(){
		const top = $('#messageArea').prop('scrollHeight'); 
		sendMessage();
		$('#message').val('')
		$('#messageArea').scrollTop(top);
		

	});

	let sock = new SockJS("http://192.168.0.90:80/echo/");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// 메시지 전송
	function sendMessage() {
		sock.send($("#user_id").val());
		sock.send($("#message").val());
		sock.send("");
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		$("#messageArea").append(data + "&#10;");

	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");

	}
</script>
</html>