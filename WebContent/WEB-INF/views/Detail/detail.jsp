<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style type="text/css">

.tableBack{
	width: 100%;
	height: auto;
	border: 1px solid black;
}
input:focus {
	outline:none;
}
textarea:focus {
	outline:none;
}
a:hover {
	text-decoration: none;
}
.cmtCls {
  width: 250px;
  height: 140px;
  overflow: auto;
}
.cmtCls::-webkit-scrollbar {
  width: 10px;
}
.cmtCls::-webkit-scrollbar-thumb {
  background-color: #401E01;
  border-radius: 10px;
}
.cmtCls::-webkit-scrollbar-track {
  background-color: #F2F2F2;
  border-radius: 10px;
  box-shadow: inset 0px 0px 5px white;
}
.replyTbl{
	width: 100px;
}
.btn-reply {
  color: #fff;
  background-color: #F25C05;
  border-color: #F25C05;
  padding: 3px;
  size: 10pt;
}

.close-modal{
	visibility: hidden;
}
.photoBox{
  	width: 50px;
    height: 50px;
    background-image:url("배경이미지경로");
    border-radius: 150px; /* 레이어 반크기만큼 반경을 잡기*/    
    display: table-cell;
    vertical-align: middle;
    color: #ffffff;
    font-weight: bold;
    text-align: center;
}
.profImg{
    width: 50px;
    height:50px;
    border-radius: 50px; 
}

.no-close .ui-dialog-titlebar-close {display: none }
</style>
</head>
<body>


<form name="clipboard"><input type="hidden" name="shareUrl"></form> 

<div class="container">
  <div>
	 <a href="#none" onclick="history.back()"><i class="far fa-arrow-alt-circle-left" ></i></a>
  </div>
<div class="frm">
<input type="hidden" name="seq" id="post_seq" value="${post.post_seq }">
	<div class="detailTbl">
		<table class="tableBack">
		<tr>
			<td>
				<table class="tablePhoto">
				<tr>
					<td>
					<!-- 사진 -->
					<div class="text">사진</div>
					</td>
				</tr>
				<tr>
					<td>
						<!-- <a href="javascript:void(0)"><i id="heart" class="far fa-heart"></i></a>
 -->						<span>
							<c:if test="${cLike eq 0  }">
								<a href="javascript:void(0)"><i id="heart" class="far fa-heart"></i></a>
							</c:if>
							<c:if test="${cLike eq 1  }">
								<a href="javascript:void(0)"><i id="heart" class="fas fa-heart"></i></a>
							</c:if>
						</span>
						<span id="heartCount"></span>
					</td>
					<td>
					 	<span>
							<c:if test="${cBook eq 0  }">
								<a href="#none"><i id="addBookmark" class="far fa-bookmark"></i></a>
							</c:if>
							<c:if test="${cBook eq 1  }">
								<a href="#none"><i id="addBookmark" class="fas fa-bookmark"></i></a>
							</c:if>
						</span> 
						<!--  <a href="javascript:void(0)"><i id="addBookmark" class="far fa-bookmark"></i></a>
						 -->
					</td>

				</tr>
				</table>
			</td>
			<td>
				<!-- 프로필 -->
				<div>
				<table class="tableProfile">
				<tr>
					<td rowspan="1" class="photoBox">
						<img class="profImg" src="http://localhost:8090/Inphomation/upload/profileImage/${profile.profile_image }" onclick="profile(${profile.user_seq })">
					</td>
					<td>
						 <table>
						<tr>
							<td>
							<a href="#none" onclick="profile(${profile.user_seq })" class="text text-weight-medium body2">${profile.user_nickname}</a></td>		<!-- 멤버 닉네임 가져오기 -->
						</tr>
						<%-- <tr>
							<td>${profile.position }</td>
						</tr> --%>
						</table>
					</td>
					<td>
						<div><a href="#ex1" rel="modal:open">···</a></div>
						<div id="ex1" class="modal">
							<button type="button" id="editDetail" class="btn modalBtn">수정하기</button><br>
							<button type="button" id="deletDetail" class="btn modalBtn">삭제하기</button><br>
							<button type="button" id="sh-link" class="btn modalBtn">공유하기</button><br>
						</div> 
					</td>
				</tr>
				<tr>
					<td colspan="3">${post.post_content }
						<c:forEach items="${tag }" var="i">
							<a href="#none">${i.hashtag }</a>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td colspan="3" rowspan="4" height="180px">					
						<div style="overflow: auto; height: 150px; width: 200px;" class="cmtCls">
							<table id="cmt">
								<!-- 댓글 불러오기 -->
							</table>		
						</div>
							<input type="text" id="comment" onKeypress="if(event.keyCode==13) {addComment()}">
							<input type="button" id="addCmt" onclick="addComment()" class="btn btn-reply" value="입력">
					</td>
				</tr>
				</table>
			</div>
			</td>
		</tr>
		</table>
	</div>
	</div>
</div> 

<script type="text/javascript">
/* 게시글 모달 사이즈 */
document.getElementById('ex1').style.height = '180px';
document.getElementById('ex1').style.width = '300px';

$(document).ready(function(){

	$("#subnav").hide();

	$("#topnav").on("click",function(){
		$(this).parent().find("#subnav").slideDown('normal').show();
		$(this).parent().hover(function(){},
			function(){
				$(this).parent().find("#subnav").slideUp('fast');
			});
	});

	/* 댓글 불러오기 */
	 $.ajax({
		url:"replyList.do",
		type:"get",
		data:{"post_seq":$("#post_seq").val()},
		async:true,
		success:function(list){

			$.each(list, function(i, item){

				/* 날짜만 가져오기 */
				let d = list[i].reply_date;
				let date = d.substring(0, 11);
			
				$("#cmt").append("<tr>"
									+"<td class='replyTbl'>"
										+"<a href='#none' class='text ' onclick='profile("+ item.user_seq +")'>" 
										+ item.user_nickname + "</a>" 
									+"</td>" 
									+ "<td class='replyTbl'>" + item.reply_content + "</td>"
									+ "<td><div id='replyMenu' style='position: relative;'>"
										+ "<a href='#ex2' rel='modal:open' onclick='replyMenu()'> ··· </a>"
									+ "</div></td>"
									+ "</tr>" + "<tr>" + "<td>" + date + "<td>" + "<tr>");
				$("#cmt").append("<input type='hidden' name='reply_seq' value='" + ${item.reply_seq }+ "''>");
			})
		},
		error:function(){
			alert("error");
		}
	});
});

/* 댓글 삭제 파라미터에 넣기 +${mem.user_seq},${post.post_seq}+ */
function replyMenu(){
	$("#replyMenu").append("<div id='ex2' class='modal'  style='max-width: 100%; width: auto;height:auto; display: table;'>"
								+"<button type='button' id='deletReply' class='btn modalBtn'>삭제하기</button><br>"
							+"</div> ");
}

function deletReply(){
	/* location.href="deletReply.do?post_seq="+post_seq+"&user_seq="+user_seq + "&reply_seq=" + reply_seq;
	 */
}

$(function(){
$("#deletReply").on("click",function(){
	alert("dd");
})
	
});



/*  댓글 추가 부분 */
function addComment(){
	if( $("#comment").val() == null || $("#comment").val() == ""){
		$("#comment").focus();
	}else{
			$.ajax({
			url:"addReply.do",
			type: "get",
			data: {"post_seq":$("#post_seq").val(), "user_seq":"1", "reply_content":  $("#comment").val() },
			async:true,
			success:function(data){
			//	console.log(data)
				$("#comment").val("");
			},
			error:function(){

			}
		});
	}
}
/* 유저 프로필로 이동 */
function profile(user_seq){
	location.href = "mypage?user_seq=" + user_seq;
}
</script>
<script type="text/javascript">
let Honoff = 0;
let HclsName = "far fa-heart";


$(document).ready(function(){
	
	$("#heart").on("click",function(){

		if(Honoff == 0) Honoff = 1;
		else		    Honoff = 0;

		$.ajax({
			url:"addLike.do",
			type:"get",
			async:true,
			data: {"post_seq" : $("#post_seq").val(), "user_seq":"1"},
			success:function(msg){
				/*msg가 NO일 경우 북마크에 추가됨*/

				$("#heart").removeClass(HclsName);
				if(Honoff == 1){
					HclsName = "fas fa-heart";
				}else{
					HclsName = "far fa-heart";
				}
				
				if(msg == 'NO'){
					$("#heart").attr("class", HclsName);

				}else{
					$("#heart").attr("class", HclsName);
				}
			},
			error:function(){
				alert("error");
	
			}
		});
	});

	$.ajax({
		url:"countLikeAll.do",
		type:"get",
		data:{"post_seq":"1"},
		async: true,
		success:function(data){
		//	alert("success" + data);
		
			if(data == '0'){
				$("#heartCount").html("");
			}else{
				$("#heartCount").html(data + "명이 좋아합니다.");
			}
		},
		error:function(){
			alert("error");
	
		}
	});

}); 
 </script>
<script type="text/javascript">
let Bonoff = 0;
let BclsName = "far fa-bookmark";

$(document).ready(function(){
	
	$("#addBookmark").on("click",function(){

		if(Bonoff == 0) Bonoff = 1;
		else		   Bonoff = 0;

		$.ajax({
			url:"addBookmark.do",
			type:"get",
			async:true,
			data: {"post_seq" : $("#post_seq").val(), "user_seq":"1"},
			success:function(msg){
				/*msg가 NO일 경우 북마크에 추가됨*/

				$("#addBookmark").removeClass(BclsName);
				if(Bonoff == 1){
					BclsName = "fas fa-bookmark";
				}else{
					BclsName = "far fa-bookmark";
				}
				
				if(msg == 'NO'){
					$("#addBookmark").attr("class", BclsName);

				}else{
					$("#addBookmark").attr("class", BclsName);
				}
			},
			error:function(){
				alert("error");
	
			}
		});
	});
});

// 링크 복사 소스코드
$(document).on("click", "#sh-link", function(e) { 
	// 링크복사 시 화면 크기 고정 
	$('html').find('meta[name=viewport]').attr('content', 'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no'); 
	var html = "<input id='clip_target' type='text' value='' style='position:absolute;top:-9999em;'/>"; 
	$(this).append(html); 

	var input_clip = document.getElementById("clip_target");
		//현재 url 가져오기 
		var _url = $(location).attr('href'); 
	$("#clip_target").val(_url);
	if (navigator.userAgent.match(/(iPod|iPhone|iPad)/)) { 

		var editable = input_clip.contentEditable; 
		var readOnly = input_clip.readOnly; 
	
		input_clip.contentEditable = true; 
		input_clip.readOnly = false; 

	 	var range = document.createRange();
	   	range.selectNodeContents(input_clip);

		var selection = window.getSelection(); 
	    selection.removeAllRanges(); 
	    selection.addRange(range);
	    input_clip.setSelectionRange(0, 999999); 

		input_clip.contentEditable = editable; 
	    input_clip.readOnly = readOnly;
	} else { 
		input_clip.select(); 
	}
	try { 
		var successful = document.execCommand('copy');
		input_clip.blur();

		if (successful) {
			alert("URL이 복사 되었습니다. 원하시는 곳에 붙여넣기 해 주세요.");
			// 링크 복사 시 화면 크기 고정 
			$('html').find('meta[name=viewport]').attr('content', 'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=yes');
		} else { 
			alert('이 브라우저는 지원하지 않습니다.'); 
		} 
	} catch (err) { 
		alert('이 브라우저는 지원하지 않습니다.'); 
		}
	 }); //클립보드 복사

</script>












</body>
</html>






