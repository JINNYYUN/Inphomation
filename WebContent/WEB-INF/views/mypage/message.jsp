<%@page import="bit.com.inpho.dto.MessageUserDto"%>
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
MessageUserDto msgUser = (MessageUserDto)request.getSession().getAttribute("msgUser");
%>
	<div class="container" style="margin-top: 100px">
		<div class="left-list" id="leftList">
			<div class="title">Messages</div>
		</div>
		<div class="right-msg" id="rightMsg">
			<div class="detail" id="msgDetail"></div>
		</div>
	</div>
</body>

<script type="text/javascript">

//유저 리스트 ajax로 가져오기 함수
function getUsers(){
	$.ajax({
		url:"getUsers",
		type:"post",
		async:false,
		success:function(userlist){
			let content = '';
			content += `<div class="left-users" id="leftUsers">`;
				
				if("${msgUser.msg_seq}" != ""){
				// 대화내역이 없는 유저일 때
					if("${msgUser.msg_seq}" == "0"){
						content += `<div class="user" id="tempUser" onclick="getmsg(${msgUser.user_target})">
							<div class="profile">
								<div class="frame"><img src="${msgUser.profile_image}">
								</div>
							</div>
							<div class="profile-info">
								<div class="user-nick">${msgUser.user_nickname}</div>
								<div class="user-msg">${msgUser.msg_content}</div>
							</div>
						</div>`;
					}
					getmsg(${msgUser.user_target})
				}
			// 대화내역이 있는 유저일 때
			$.each(userlist, function(i, user) {
				
				content+= '<div class="user" onclick="getmsg(' + user.user_target + ')" id="lastMsg' + user.user_target + '">';

				content += '<div class="profile">'
							+ '<div class="frame"><img src="' + user.profile_image + '">'
						 	+ '</div>'
						 + '</div>'
						+ '<div class="profile-info">'
							+ '<div class="user-nick">' + user.user_nickname;

				// 안 읽은 메시지가 있을 때
				if(user.isSend ==1 && user.msg_open == 0){
					content += `<i class="fas fa-circle text" aria-hidden="true"></i>`;
				}
		
				content += '</div><div class="user-msg">' + user.msg_content + '</div>'
						+ '</div>'
						+ '</div>';
			})
			content += `</div>`;

			$("#leftUsers").remove();
			$("#leftList").append(content);
			
		},
		error:function(){
			alert('error');
		}
	});
}

//메시지 보내기 함수 (전송 클릭, 엔터)
function clickSend(){
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
		async: false,
		data:{"user_sender":<%=login.getUser_seq()%>, "user_target":$("#targetSeq").val(), "msg_content":$('#message').val()},
		success:function(){
			//alert('success');
		},
		error:function(){
			alert('error');
		}
	});
	$("#msgData").append('<li class="msg send">' + chat + '</li>')
	$("#message").val("")
	
	getUsers()
	$('#msgData').scrollTop($('#msgData').prop('scrollHeight'));
	$("#tempUser").remove()
}

//메시지 읽음 처리 함수
function setOpen(user_target){
	$.ajax({
		url:"setOpen",
		type:"post",
		data:{"user_sender":user_target, "user_target":<%=login.getUser_seq()%>},
		async:false,
		success:function(){
			//alert('read success');	
		},
		error:function(){
			alert('error');
		}
	});	
}

//대화창 불러오기	 함수
	function getmsg(user_target){
		$.ajax({
			url:"getMsg",
			type:"post",
			data:{"user_sender":<%=login.getUser_seq()%>, "user_target":user_target},
			async:false,
			success:function(map){
				//alert('success');
				let content = `<div class="detail" id="msgDetail">
									<div class="user right" onclick="goMypage(` +map.target.user_seq+`)">	
										<div class="frame"><img src="` + map.target.profile_image+ `"></div>
										<div class="right_nickname">` + map.target.user_nickname + `</div>
									</div>
									<div class="msgData" id="msgData">
									<ul>`;
				$.each(map.msglist, function(i, msg) {

					if(msg.user_target == user_target){
						content += `<li class="msg send">` + msg.msg_content + `</li>`;
					}else{
						content += `<li class="msg target">` + msg.msg_content + `</li>`;
					}
					
				});
				content += `</ul></div>
							<div class="msgInput"><input class="form-control form-control-lg" type="text" id="message" placeholder="메시지를 입력해주세요" onkeypress="if(event.keyCode==13) {clickSend();}" />
							<button class="btn btn-danger disabled" id="sendBtn">전송</button>
							</div>`;
				// target user_seq & user_email 히든 값으로 넣어주기				
				content += '<input type="hidden" value="' +map.target.user_email+ '" id="targetId">'
							+ '<input type="hidden" value="' +map.target.user_seq+ '" id="targetSeq"></div>';
				$("#msgDetail").remove();
				$("#rightMsg").append(content);
			},
			error:function(){
				alert('error');
			}
		});
		 
		// DB에서 읽음 처리
		setOpen(user_target)
		// css 읽음 표시 변경
		$('.fa-circle').remove();
		// 대화창 스크롤 아래로
		$('#msgData').scrollTop($('#msgData').prop('scrollHeight'));
		// 입력창에 focus
		$("#message").focus();
		// 유저리스트 새로고침
		getUsers()
	}

	function onOpen(){
		//alert('연결 생성');
	}
	
	// 메시지 수신
	function addMsg(msg) {
		// 알림 표시
		//$('.fa-circle').css('display','inline');
		
		// 메시지 받을 때 보낸 사람 seq 받아오기
		var n = msg.indexOf('*');
		
		var from = msg.substring(0, n);
		//alert(from);
		//alert($("#targetSeq").val());
		var msgContent = msg.substring(n+1);

		//지금 오픈된 대화창 상대와 같은 seq인지 확인
		if(from == $("#targetSeq").val()){
			$("#msgData").append('<li class="msg target">' + msgContent + "</li>");

			//DB 읽음처리
			setOpen($("#targetSeq").val())
		}
		// 유저리스트 새로고침
		getUsers()
		$('#msgData').scrollTop($('#msgData').prop('scrollHeight'));
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

	function goMypage(user_seq){
		location.href="mypage?user_seq=" + user_seq;
	}

	//페이지가 로딩되면 connect 실행
 	$(function() {
		//connect();
		getUsers();
		// 메시지 전송 시
		$(document).on("click", "#sendBtn", function(){
			clickSend()
			
		});
	}); 

	
</script>
