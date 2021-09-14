<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8">

<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.origin.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/fontawesome-free-5.8.2-web/css/all.min.css">
<link rel="stylesheet" id="bootstrap-css" href="resources/css/chat_main.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<title>ITKey Talk</title>
</head>

<body>
	<div class="container">
		<h3 class=" text-center">
			<div class="jumbotron">
				<h1>
					<i class="fa fa-paper-plane color-blue"></i> ITKey <font class="color-blue">T</font>
				</h1>
				<p>ITKEY 단체 채팅방 개발을 위한 퍼블리싱 파일입니다. 해당 채팅방을 예쁘게 만들어 주세요.</p>
			</div>
			<input class="mainbtn" style="float: right;" type="button" value="메인화면" onclick="location.href='main' ">

		</h3>
<!-- 		<form id="chatForm"> -->
		<div class="messaging">
			<div class="inbox_msg">
				<div class="mesgs">
					<div class="msg_history" id="messageArea">
					
					</div>
					<div class="type_msg">
						<div class="input_msg_write">
							<input type="text" class="write_msg" id="message" placeholder="내용을 입력해 주세요." />
							<button type="button" id="sendBtn"  class="msg_send_btn" >
								<i class="fa fa-paper-plane" aria-hidden="true"></i>
							</button> 
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- 	</form> -->
	</div>
	
	<script type="text/javascript">
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});

	let sock = new SockJS("http://localhost:8080/sam/echo/");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// 메시지 전송
	function sendMessage() {
		
		var id= "${id}";
		var msg = $("#message").val();
		sock.send(id + ":"+ msg);
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		$("#messageArea").append(data + "<br/>");
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("${id} : " + "연결 끊김");

	}
</script>
</body>
</html>