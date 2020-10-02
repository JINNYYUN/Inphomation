<%@page import="bit.com.inpho.dto.MyPageCameraDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.top{
	width: 100%;
	height: 300px;
	background-color: lightgrey;
}
.top-wrap{
	padding: 20px;
}
.content-detail{
	width: 600px;
	height: 400px;
	background-color: lightgrey;
	margin: 0 auto;
}
.profile-img-back{
	background-color: lightgrey;
	border-radius: 50%;
	width: 150px;
	height: 150px;
	margin: auto;
}
.profile-img{
	position: relative;
	width:140px;
	height:140px;
	border-radius: 50%;
	margin: 5px;
	
}
.fa-pen{
	position: relative;
	left: 63px;
    top: -145px;
}
.top-detail{
	margin: auto;
}
.box{
	width: 500px;
	height: 100px;
	background-color: white;
	border: 1px;
}
</style>

</head>
<body>

<%
// 카메라 정보 가져오기
Map<String, Object> map = (Map<String, Object>)request.getAttribute("map");
List<MyPageCameraDto> camlist = (List<MyPageCameraDto>)map.get("camlist");
%>

<div id="container">

<div class="contents">
	<div class="top-wrap">
		<div class="profile-img-back" align="center">
			<img class=profile-img alt="" src="./image/2017070900603_4.jpg">
			<i class="fas fa-pen fa-2x" id="faPen"></i>
		</div>
	</div>

	
	
	<div class="content-detail">
		<div class="profile" align="center">
			닉네임
			<input size="30" value="${map.mem.user_nickname}">
			<p class=text>ABOUT ME</p>
			<div class="box">
			<textarea rows="5" cols="50">${map.mem.mypage_introduce}</textarea>
			</div>
			<p>CAMERA</p>
			<div class="box">
			<% 
				for(int i=0; i<camlist.size(); i++){
			%>
					<span><%=camlist.get(i).getCamera_serial() %></span>
			
			<%	
				}
			%>
			<button>+</button>
			</div>
			<button id="editProfile">프로필 수정</button>
		</div>
	</div>
	
	
</div>

</div>

<script type="text/javascript">

$("#faPen").click( function(){
	window.open("MyPageUpload", "이미지 업로드", "width=650, height=550, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
});

</script>

</body>
</html>