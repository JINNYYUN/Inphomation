<%@page import="bit.com.inpho.dto.MyPageMemberDto"%>
<%@page import="bit.com.inpho.dto.MyPageCameraDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/MyPage/MyPageEdit.css">

<script type="text/javascript" src="js/MyPage/jquery/lib/jquery.js"></script>
<script type="text/javascript" src="js/MyPage/jquery/lib/jquery.bgiframe.min.js"></script>
<script type="text/javascript" src="js/MyPage/jquery/lib/jquery.ajaxQueue.js"></script>
<script type="text/javascript" src="js/MyPage/jquery/jquery.autocomplete.js"></script>
<link rel="stylesheet" type="text/css" href="js/MyPage/jquery/jquery.autocomplete.css">

</head>
<body>

<%
// 카메라 정보 가져오기
Map<String, Object> map = (Map<String, Object>)request.getAttribute("map");
List<MyPageCameraDto> camlist = (List<MyPageCameraDto>)map.get("camlist");
MyPageMemberDto mem = (MyPageMemberDto)map.get("mem");
%>

<div id="container">

<div class="contents">
	<div class="top">
		<div class="top-wrap">
			<div class="profile-img" align="center">
				<img src="<%=mem.getProfile_image()%>">
				<i class="fas fa-pen fa-2x" id="faPen"></i>
			</div>
		</div>
	</div>
	
	
	<div class="contents">
		<div class="mynav">
		<hr>
		<p align="center">프로필 수정</p>
		</div>
		<div class="content-detail">
		
		<div class="profile" align="center">
			<hr>
			<form id="frm" method="post">
				<p align="left">NICKNAME</p>
				<input type="hidden" name="user_seq" value="${map.mem.user_seq}">
				<input id="nickname" name="user_nickname" class="form-control form-control-lg" size="30" value="${map.mem.user_nickname}">
				<p align="left">ABOUT ME</p>
					
				<textarea name="mypage_introduce" class="form-control" rows="5" cols="50">${map.mem.mypage_introduce}</textarea>
				
				<p align="left">CAMERA</p>
				
				<div class="box" id="box">
				<% 
					for(int i=0; i<camlist.size(); i++){
				%>
						<input type="text" name="camera_serial" class="form-control form-control-lg inputCam" value="<%=camlist.get(i).getCamera_serial() %>">
				<%	
					}
				%>
				<input type="button" id="plusBtn" class="btn edit-btn plus" value="+">
				<!-- <button id="plusBtn">+</button> -->
				</div>
				</form>
								
			<button class="btn edit-btn" id="editBtn">프로필 수정</button>
		</div>
		</div>
	</div>
	
	
</div>

</div>

<script type="text/javascript">

$("#faPen").click( function(){
	window.open("MyPageUpload", "이미지 업로드", "width=650, height=550, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
});

$("#editBtn").click( function(){

	if( $("#nickname").val() == null || $("#nickname").val() == '' ){
		alert('닉네임을 입력해주세요.');
		}
	else{
		$("#frm").attr("action", "myPageEditAf").submit();
		}
});

$("#plusBtn").click( function(){
	let tag = '<input type="text" name="camera_serial" class="form-control form-control-lg inputCam" onclick="autoSearch()">';
	$("#box").append(tag);
});
</script>

<!-- 자동완성 기능 -->
<script type="text/javascript">

// 새로운 input tag 생성 시 실행 될 함수
function autoSearch() {
	$.ajax({
		url:'getCam',
		type:'post',
		success:function(data){
			var availableTags = JSON.parse( data );
	
			$(".inputCam").autocomplete(availableTags, {
				matchContains: true,
				selectFirst: false
			
				});
		},
		error:function(){
			alert('error');
		}
	});
}
//페이지 시작 시 실행
	$.ajax({
		url:'getCam',
		type:'post',
		success:function(data){
			//alert(data);
			var availableTags = JSON.parse( data );
			//alert(availableTags);

			$(".inputCam").autocomplete(availableTags, {
				matchContains: true,
				selectFirst: false
			
				});
		},
		error:function(){
			alert('error');
		}
	
});


</script>

</body>
</html>