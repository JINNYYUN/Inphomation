<%@page import="bit.com.inpho.dto.MemberDto"%>
<%@page import="bit.com.inpho.dto.MyPageMemberDto"%>
<%@page import="java.util.Map"%>
<%@page import="bit.com.inpho.dto.MyPageCameraDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="css/MyPage/MyPage.css">

<body>

<%
// 회원정보
MyPageMemberDto mem = (MyPageMemberDto)request.getAttribute("mem");

// 팔로잉 여부
boolean isFollowing = (boolean)request.getAttribute("isFollowing");

//session 정보
MemberDto login = (MemberDto)request.getSession().getAttribute("login");
%>

<div class="">

	<!-- The Modal Following -->
	<div id="myModal" class="modal">
	  <!-- Modal content -->
	  <div class="modal-content">
	    <span class="close">&times;</span>
	    	<div class="modal-detail"></div>
	  </div>
	</div>
	
	<!-- The Modal Follower-->
	<div id="myModal2" class="modal2">
	  <!-- Modal content -->
	  <div class="modal-content2">
	    <span class="close2">&times;</span>
	    	<div class="modal-detail2"></div>
	  </div>
	</div>

<div class="top">
	<div class="top-wrap">
		
		<%
		if(login != null){
			if(mem.getUser_seq() == login.getUser_seq()){
			%>
				<button class="btn follow-btn" id="editProfile">프로필 수정</button>
				<button id="editMember">설정</button>
			<%	
			}else{
				if(isFollowing){
				%>
					<input type="button" class="btn follow-btn" id="followBtn" value="Unfollow">
				<%	
				}else{
				%>
					<input type="button" class="btn follow-btn" id="followBtn" value="Follow">
				<%	
				}
			}
		}
		%>

		<div class="profile-img">
			<img src="${mem.profile_image}">
		</div>
		<div class="top-detail" align="center">
			<span class="nickname">${mem.user_nickname}</span>
			<br>
			<div id="follow">
				<span id="following">팔로잉 <b>${following}</b></span>
				<span id="follower">팔로워 <b>${follower}</b></span>
			</div>
			<br>
			
		</div>
	</div>
</div>
<div class="contents">
	<div class="mynav">
		<hr>
		<table class="mynav-table">
			<tr>
				<td id="nav_post" onclick="getPost('post')" ><i class="fas fa-camera"></i> 게시글</td>
				<td id="nav_bookmark" onclick="getPost('bmk')"><i class="far fa-bookmark"></i> 북마크</td>
				<td id="nav_profile"><i class="far fa-user-circle"></i> 프로필</td>
			</tr>
		</table>
	</div>
	
	<div class="content-detail">
	<hr>

	</div>
	</div>

</div>



<script type="text/javascript">
// 프로필 수정 이동
$("#editProfile").click( function(){
	location.href="mypageedit?user_seq=" + ${mem.user_seq};
});
// 비밀번호 변경 이동
$("#editMember").click( function(){
	location.href="editMem"
});

// 팔로우/언팔로우 함수
$("#followBtn").click( function(){

	var value = $(this).val();
	  $.ajax({
		url:'follow?user_seq=' + ${mem.user_seq},
		type:'post',
		data:{"work":value},
		success:function(data){ 
			
			if(value == 'Follow'){
				$("#followBtn").val('UnFollow');
			}else{
				$("#followBtn").val('Follow');
			}
		},
		error:function(){
			alert('error');
		}
	}); 
	
});
</script>

<!-- 팔로잉  Modal -->
<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("following");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
// modal load 시 jsp 불러오기
$(".modal-detail").load("getFollowing?user_seq=" + ${mem.user_seq});
</script>

<!-- 팔로워 Modal -->
<script>
// Get the modal
var modal2 = document.getElementById("myModal2");

// Get the button that opens the modal
var btn2 = document.getElementById("follower");

// Get the <span> element that closes the modal
var span2 = document.getElementsByClassName("close2")[0];

// When the user clicks the button, open the modal 
btn2.onclick = function() {
  modal2.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span2.onclick = function() {
  modal2.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal2) {
    modal2.style.display = "none";
  }
}
// modal load 시 jsp 불러오기
$(".modal-detail2").load("getFollower?user_seq=" + ${mem.user_seq});
</script>

<!-- 하단 nav bar ajax -->
<!-- ① 게시글 & 북마크 구현 -->
<script type="text/javascript">
//ajax로 post 불러오는 함수
function getPost(work){
	$.ajax({
		url:"getPost",
		type:"post",
		data:{"user_seq":<%=mem.getUser_seq()%>, "work":work},
		async: false,
		success:function(postlist){
			//alert('success');
			let content = '';
			if(postlist.length == 0){
				content = `<div class="profile">
								<div class="notice" align="center">
					 	   			<i class="far fa-images" align="center"></i>
					 				<p>게시글이 없습니다</p>
					 			</div
					 		</div>`;
			}else{
				
				content += '<div class="main-container">'
							+ '<div class="grid">';
	
				$.each(postlist, function(i, post) {
					content += '<div class="item">'
					+ '<img src="https://storage.googleapis.com/boomkit/' + post.post_filepath +'">'
						+ '<div class="white-circle">'
						+ '<i class="fas fa-bars menu" onclick="test();"></i>'
						+ '</div>'
					+ '<div class="bottom-icon-bar icon-absoulte">';

					// 좋아요 여부
					if(post.dolike){
						content += '<h4><i class="fas fa-heart" onclick="clickLike('+i+', 1,'+post.post_seq+');" id="like'+i+'"> ' +post.count_like+ '</i></h4>';
					}else{
						content += '<h4><i class="far fa-heart" onclick="clickLike('+i+', 0,'+post.post_seq+');" id="like'+i+'"> ' +post.count_like+ '</i></h4>';
					}
					// 북마크 여부
					if(post.dobookmark){
						content+= '<h4><i class="fas fa-bookmark" onclick="clickBookmark('+i+', 1,'+post.post_seq+');" id="bookmark'+i+'"> ' +post.count_book+'</i></h4>';
					}else{
						content+= '<h4><i class="far fa-bookmark" onclick="clickBookmark('+i+', 0,'+post.post_seq+');" id="bookmark'+i+'"> ' +post.count_book+'</i></h4>';
					}
					content+= '</div>'
					+ '</div>';
				});
					
				content += '</div></div>';
				}
			
			$(".main-container").remove();
			$(".profile").remove();
			$(".content-detail").append(content);
			
		},
		error:function(){
			alert('error');
		}
	});
	SetGridItemHeight();
}

//페이지 시작 시 함수 실행
getPost('post');

//grid layout 설정
function SetGridItemHeight() {
	let grid = document.getElementsByClassName('grid')[0];
	let rowHeight = parseInt(window.getComputedStyle(grid).getPropertyValue('grid-auto-rows'));
	let rowGap = parseInt(window.getComputedStyle(grid).getPropertyValue('grid-row-gap'));

	let item = grid.getElementsByClassName('item');
	for (let i = 0; i < item.length; ++i) {
		let a = Math.floor((item[i].children[0].offsetHeight) / 25)
		//item[i].style.gridRowEnd = `span ${Math.floor((item[i].children[0].offsetHeight) / 25)}`
		item[i].style.gridRowEnd = `span ` + a
	}
}
window.addEventListener("load", SetGridItemHeight);
window.addEventListener("resize", SetGridItemHeight);

// 좋아요 클릭 함수
function clickLike(num, dolike, post_seq){
	<%
	if ( login == null){
	%>
		goLogin();
		return
	<%	
	}%>
	$.ajax({
		url:"addLike",
		type:"post",
		data:{"post_seq":post_seq, "dolike":dolike},
		success:function(){
			//alert('success');
			var likeid = "#like"+num;
			if(dolike==0){
				let count = Number($(likeid).html())+1;
				$(likeid).html(' ' + count);
				$(likeid).attr("onclick", "clickLike(" + num + ", 1, " + post_seq + ")");
				$(likeid).removeClass();
				$(likeid).addClass("fas fa-heart"); 
			}else{
				let count = Number($(likeid).html())-1;
				$(likeid).html(' ' + count);
				$(likeid).attr("onclick", "clickLike(" + num + ", 0, " + post_seq + ")");
				$(likeid).removeClass();
				$(likeid).addClass("far fa-heart"); 
			}
		},
		error:function(){
			alert('error');
		}
	});
}

//북마크 클릭 함수
function clickBookmark(num, dobook, post_seq){

	<%
	if ( login == null){
	%>
		goLogin();
		return
	<%	
	}%>
	$.ajax({
		url:"addBookmark",
		type:"post",
		data:{"post_seq":post_seq, "dobook":dobook},
		success:function(){
			
			var bookid = "#bookmark"+num;
			if(dobook==0){
				let count = Number($(bookid).html())+1;
				$(bookid).html(' ' + count);
				$(bookid).attr("onclick", "clickBookmark(" + num + ", 1, " + post_seq + ")");
				$(bookid).removeClass();
				$(bookid).addClass("fas fa-bookmark"); 
			}//onclick="clickBookmark('+i+', 1,'+post.post_seq+')
			else{
				let count = Number($(bookid).html())-1;
				$(bookid).html(' ' + count);
				$(bookid).attr("onclick", "clickBookmark(" + num + ", 0, " + post_seq + ")");
				$(bookid).removeClass();
				$(bookid).addClass("far fa-bookmark"); 
			}
		},
		error:function(){
			alert('error');
		}
	});
	
}
</script>

<!-- ② 프로필 구현 -->
<script type="text/javascript">

$("#nav_profile").click(function(){
	$.ajax({
		url:"getMyCamera",
		type:"post",
		data:{"user_seq":<%=mem.getUser_seq()%>},
		success:function(camlist){
			//alert('success');
			let content = `<div class="profile">
				<p class="prf-text">ABOUT ME</p><div class="box">${mem.mypage_introduce}</div>
				<p class="prf-text">CAMERA</p>
				<div class="box">`;
				
			$.each(camlist, function(i, cam) {
					content += `<span class="btn btn-cam">${'${cam.camera_serial}'}</span>`;
			});
			$(".main-container").remove();
			$(".profile").remove();
			$(".content-detail").append(content);
		},
		error:function(){
			alert('error');
		}
	});
});

</script>


</body>
