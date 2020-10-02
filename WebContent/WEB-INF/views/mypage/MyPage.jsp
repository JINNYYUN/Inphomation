nrknrk<%@page import="bit.com.inpho.dto.MyPageMemberDto"%>
<%@page import="java.util.Map"%>
<%@page import="bit.com.inpho.dto.MyPageCameraDto"%>
<%@page import="java.util.List"%>
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
.profile-img{
	background-color: white;
	border-radius: 50%;
	width: 150px;
	height: 150px;
	margin: auto;
}
img{
	width:140px;
	height:140px;
	border-radius: 50%;
	margin: 5px;
}
.follow-btn{
	float: right;
}
.top-detail{
	margin: auto;
}

.mynav-table{
	width: 900px;
	border: 1px;
	border-collapse: collapse;
}
.box{
	width: 500px;
	border: 1px;
	border-radius: 90%;
}
</style>
</head>
<body>

<%
// 회원정보
Map<String, Object> map = (Map<String, Object>)request.getAttribute("map");
MyPageMemberDto mem = (MyPageMemberDto)map.get("mem");
// 카메라 정보 가져오기

List<MyPageCameraDto> camlist = (List<MyPageCameraDto>)map.get("camlist");

%>

<div id="container">

<div class="top">
	<div class="top-wrap">
		<button class="follow-btn">Follow</button>
		<div class="profile-img">
			<%
			if(mem.getProfile_image() == null || mem.getProfile_image().equals("")){
			%>
				<img alt="" src="./image/2017070900603_4.jpg">
			<%	
			}else{
			%>
				<img src="d:\\inphoimg/${map.mem.profile_image}">
			<%	
			}
			%>

		</div>
		<div class="top-detail" align="center">
			<span>${map.mem.user_nickname}</span>
			<br>
			팔로잉 0 팔로우 0
			<br>
			<button id="editProfile">프로필 수정</button>
		</div>
	</div>
</div>
<div class="contents">
	<div class="mynav">
		<table class="mynav-table">
			<tr>
				<td><i class="fas fa-camera">게시글</i></td>
				<td><i class="far fa-bookmark">북마크</i></td>
				<td><i class="far fa-user-circle">프로필</i></td>
			</tr>
		</table>
	</div>
	
	<div class="content-detail">
	<!-- 디폴트값 게시글로 -->
		<div class="profile">
			<p class=text>ABOUT ME</p>
			<div class="box">${map.mem.mypage_introduce}</div>
			<p>CAMERA</p>
			<div class="box">
			<% 
				for(int i=0; i<camlist.size(); i++){
			%>
					<span><%=camlist.get(i).getCamera_serial() %></span>
			
			<%	
				}
			%>
			</div>
		</div>
	</div>
</div>

</div>

<script type="text/javascript">

$("#editProfile").click( function(){
	location.href="mypageedit?user_seq=" + ${map.mem.user_seq};
});

</script>
</body>
</html>