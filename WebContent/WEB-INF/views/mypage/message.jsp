<%@page import="bit.com.inpho.dto.MemberDto"%>
<%@page import="bit.com.inpho.dto.MyPageMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/MyPage/Message.css">

<body>
<%
MemberDto login = (MemberDto)request.getSession().getAttribute("login");
%>
	<div style="margin-top: 100px">
	
		<div class="left-list">
			<c:forEach items="${userlist}" var="user" varStatus="status">
				<div>
					<img src="${user.profile_image}">
					${user.user_nickname}
				</div>
				<div onclick="getmsg(${user.user_target})" id="lastMsg${user.user_target}">
					${user.msg_content}
				</div>
			</c:forEach>
		</div>
		<div class="right-msg" id="rightMsg">
			<div class="detail" id="msgDetail"></div>
		</div>
	</div>
</body>
<script type="text/javascript">
	//지난 메시지 모두 가져오기	
	function getmsg(user_target){
		$.ajax({
			url:"getMsg",
			type:"post",
			data:{"user_sender":<%=login.getUser_seq()%>, "user_target":user_target},
			success:function(map){
				//alert('success');
				let content = `<div class="detail" id="msgDetail">
								<div><img src="` + map.target.user_profile+ `">
								` + map.target.user_nickname + `</div>
								<div class="msgData" id="msgData">`;
				$.each(map.msglist, function(i, msg) {

					if(msg.user_target == user_target){
						content += `<div class="msg send">보낸 메시지:` + msg.msg_content + `</div>`;
					}else{
						content += `<div class="msg target">받은 메시지:` + msg.msg_content + `</div>`;
					}
					
				});
				content += `</div>
							<div class="msgInput"><input type="text" id="message" />
							<input type="button" id="sendBtn" value="submit"/>
							<div id="messageArea"></div></div></div>`;
				// target user_seq & user_email 히든 값으로 넣어주기
				content += '<input type="hidden" value="' +map.target.user_email+ '" id="targetId">'
							+ '<input type="hidden" value="' +map.target.user_seq+ '" id="targetSeq">';
				$("#msgDetail").remove();
				$("#rightMsg").append(content);
			},
			error:function(){
				alert('error');
			}
		});
		
	}

<%-- //메시지 전송
$(document).on("click", "#sendBtn", function(){
	sendMessage();
	$.ajax({
		url:"sendMsg",
		type:"post",
		data:{"user_sender":<%=login.getUser_seq()%>, "user_target":1, "msg_content":$('#message').val()},
		success:function(){
			//alert('success');
		},
		error:function(){
			alert('error');
		}
	});
	
	$('#message').val('')
});

	let sock = new SockJS("http://192.168.0.201:8090/Inphomation/echo/");
	sock.onmessage = onMessage;
	sock.onclose = onClose;

	// 메시지 전송
	function sendMessage() {
		sock.send($("#message").val());
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		alert(data);
		$("#msgData").append(data + "<br/>");
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");

	} --%>

///////////////////////////////////////////////////
	var ws;
	var userid = "<%=login.getUser_email()%>"; //파라미터로 넘겨서 설정할 (내) 아이디

	function connect() {

		alert('connect()');
		//웹소켓 객체 생성하는 부분
		//핸들러 등록(연결 생성, 메시지 수신, 연결 종료)

		//url 연결할 서버의 경로
		ws = new WebSocket('ws://192.168.0.201:8090/Inphomation/echo.do/websocket');	

		
		ws.onopen = function() {
			console.log('연결 생성');
			alert('연결 생성');
			register();
		};
		
		//ws.onopen = onOpen;
		
		ws.onmessage = function(e) {
			console.log('메시지 받음');
			var data = e.data;
			//alert("받은 메시지 : " + data);
			addMsg(data);
		};
		ws.onclose = function() {
			//console.log('연결 끊김');
			alert('연결 끊김');
		};
	}

	function onOpen(){
		alert('연결 생성');
	}
	
	// 메시지 수신
	function addMsg(msg) { //원래 채팅 메시지에 방금 받은 메시지 더해서 설정하기
		// 메시지 받을 때 보낸 사람 seq 받아오기
		var n = msg.indexOf('*');
		
		var from = msg.substring(0, n);
		alert(from);
		var msgContent = msg.substring(n+1);
		alert(msgContent);

		//지금 오픈된 대화창 상대와 같은 seq인지 확인
		if(from == $("#targetSeq").val()){
			$("#msgData").append('<div class="msg target">' + msgContent + "</div>");
		}
		$("#lastMsg" + from).html(msgContent);
	}

	function register() { //메시지 수신을 위한 서버에 id 등록하기
		var msg = {
			type : "register", //메시지 구분하는 구분자 - 상대방 아이디와 메시지 포함해서 보냄
			userid : "<%=login.getUser_email()%>"
		};
		ws.send(JSON.stringify(msg));
	}

	function sendMsg() {
		
		var msg = {
			type : "chat", //메시지 구분하는 구분자 - 상대방 아이디와 메시지 포함해서 보냄
			target : $("#targetId").val(),
			message : $("#message").val(),
			from : '<%=login.getUser_seq()%>'
		};
		ws.send(JSON.stringify(msg));
	}

	//페이지가 로딩되면 connect 실행
 	$(function() {
		connect();
		// 메시지 전송 시
		$(document).on("click", "#sendBtn", function(){
			//alert('sendBtn');
			if( $("#message").val()=='' ){
				alert('메시지를 입력해주세요');
				return;
			}
			var chat = $("#message").val();
			sendMsg();
			

			// DB에 저장
			$.ajax({
				url:"sendMsg",
				type:"post",
				data:{"user_sender":<%=login.getUser_seq()%>, "user_target":$("#targetSeq").val(), "msg_content":$('#message').val()},
				success:function(){
					//alert('success');
				},
				error:function(){
					alert('error');
				}
			});
			$("#msgData").append('<div class="msg send">' + chat + '</div>')
			$("#lastMsg" + $("#targetSeq").val()).html(chat)
			$("#message").val("")
		});
	}); 
	
	
</script>
