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
<link rel="stylesheet" type="text/css" href="css/Detail/Detail.css">

</head>
<body>

<!-- url복사 -->
<form name="clipboard">
	<input type="hidden" name="shareUrl">
</form>
<input type="hidden" name="post_seq" id="post_seq" value="${post.post_seq }">
<input type="hidden" name="user_seq" id="user_seq" value="${user_seq }">
<div class="container all">

	<div class="frm">
		<div class="leftTbl">
			<!-- 사진 -->
			<div class="photoBox">
				<img alt="no Picture" src="https://storage.googleapis.com/boomkit/${post.post_filepath }"
					class="postPhoto" onclick="zoomPhoto(this.src)">
			</div>
		</div>
		<div class="rightTbl">
			<div class="innerRightBox">
			<!-- modal Menu -->
			<div>
				<div class="modalMenu">
					<a href="#ex1" rel="modal:open">···</a>
				</div>
				<div id="ex1" class="modal">
					<button type="button" id="editDetail" class="btn modalBtn">수정하기</button>
					<hr>
					<button type="button" id="deletDetail" class="btn modalBtn">삭제하기</button>
					<hr>
					<button type="button" id="sh-link" class="btn modalBtn">공유하기</button>
					<hr>
				</div>
			</div>
			<!-- 프로필 -->
			<div class="tableProfile">
				<div class="proflBox">
					<img class="profImg" src="https://storage.googleapis.com/boomkit/${profile.profile_image }"
						onclick="profile(${profile.user_seq })">
				</div>
				<div>
					<div>
						<div>
							<c:if test="${follow eq true }">
								<button type="button" id="followBtn" class="btn followBtn" value="Unfollow">
									Following
								</button>
							</c:if>
							<c:if test="${follow eq false  }">
								<button type="button" id="followBtn" class="btn followBtn" value="Follow">
									Follow
								</button>
							</c:if>
						</div>
						<div class="nickLoca">
							<!-- 멤버 닉네임 가져오기 -->
							<div>
								<a href="javascript:void(0)" onclick="profile(${profile.user_seq })" class="text text-weight-medium body1 post">
									${profile.user_nickname}
								</a>
							</div>
							<div>
								<!-- 위치 -->
								<a href="map.do?post_seq=${post.post_seq }" class="text body2 post">
									${post.post_position_name }
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
<hr>			
			<div style="overflow: auto; height: 226px; width: 100%;" class="cmtCls">
				<div class="content">
					<div class="contHash">
						<p class="text body1 post">
							${post.post_content } <br>
							<c:forEach items="${tag }" var="i">
								<a href="javascript:void(0)" class="text body1 post">${i.hashtag }</a>
							</c:forEach>
						</p>
				</div>
				
				<div id="cmt" class="cmtTbl">
				<hr>
					<c:if test="${empty reply }">
						<div class="text body2 post reply"><p class="replyInfo">첫 댓글을 남겨보세요!</p></div>
					</c:if>

					<c:forEach items="${reply }" var="i">
						<div class='text reply'>
							<div class="replyImgBox">
								<img class="replyImg" src="https://storage.googleapis.com/boomkit/${i.profile_image }"
									onclick="profile(${i.user_seq })">
							</div>
							<div class="replyNick">
								<a href="javascript:void(0)" class="text-weight-bold body1 post replyNick" onclick="profile(${i.user_seq})"> 
									${i.user_nickname } 
								</a>
								&emsp;
								<div class="body1 post replyCont">
									${i.reply_content }
								</div>
							</div>
							<c:if test="${i.user_seq eq user_seq || post.user_seq eq user_seq}">
								<div id="replyMenu" style="position: relative;" class="replyMenu">
									<a href="#ex2" rel="modal:open" onclick="replyMenu(${i.user_seq},${i.reply_seq })">
										··· 
									</a>
								</div>
							</c:if>
						<br>
							<div class="body2 post replyDate">
								${date } <input type="hidden" name="reply_seq" value=" ${i.reply_seq }">
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
<hr>
				<div class="camera">
					<p class="text body1 post">
						<b>CAMERA</b>
					</p>
					<a href="javascript:void(0)" class="text body1 post">${post.camera_serial }</a>
				</div>

<hr>
			<div>
				<span>
					<c:if test="${cLike eq 0  }">
						<a href="javascript:void(0)">
							<i id="heart" class="far fa-heart"></i>
						</a>
					</c:if> 
					<c:if test="${cLike eq 1  }">
						<a href="javascript:void(0)">
							<i id="heart" class="fas fa-heart"></i>
						</a>
					</c:if>
				</span>
			</div>
			<div>
				<span> <c:if test="${cBook eq 0  }">
						<a href="javascript:void(0)"><i id="addBookmark" class="far fa-bookmark"></i></a>
					</c:if> <c:if test="${cBook eq 1  }">
						<a href="javascript:void(0)"><i id="addBookmark" class="fas fa-bookmark"></i></a>
					</c:if>
				</span>
			</div>

			<div>
				<span id="heartCount" class="text body1 post"></span>
			</div>
			<hr>
			<div class="cmtBox">
				<textarea id="comment" class="text post body1 comment" onKeypress="if(event.keyCode==13) {addComment()}" placeholder="댓글 달기"></textarea>
				<input type="button" id="addCmt" onclick="addComment()" class="btn btn-reply" value="입력">
			</div>
		</div>
		</div>
	</div>
</div>







<script type="text/javascript">
/* 게시글 모달 사이즈 */
document.getElementById('ex1').style.height = '180px';
document.getElementById('ex1').style.width = '300px';

/* 사진 원본 크기 불러오기 */
function zoomPhoto(img){
	img1= new Image();
	img1.src=(img);
	imgControll(img);	
}
function imgControll(img){

	if((img1.width!= 0) && (img.height!=0)){
		viewImage(img);
	}else{
		controller="imgController('"+img+"')";
		intervalID=setTimeout(controller,20);
	}
}
function viewImage(img){
	W = img1.width;
	H = img1.height;
	O = "width=" + W + ",height=" + H + ",scrollerbars=yes";
	imgWin = window.open("","",O);
	imgWin.document.write("<html><head><title>확대보기</title></head>");
	imgWin.document.write("<body topmargin=0 leftmargin=0>");
	imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
	imgWin.document.close();
}
/* ******************** */
  
 
 
$(document).ready(function(){

	$("#subnav").hide();

	$("#topnav").on("click",function(){
		$(this).parent().find("#subnav").slideDown('normal').show();
		$(this).parent().hover(function(){},
			function(){
				$(this).parent().find("#subnav").slideUp('fast');
			});
	});
});
/* function getReply(){
	/* 댓글 불러오기 
	 $.ajax({
		url:"replyList.do",
		type:"get",
		data:{"post_seq":$("#post_seq").val()},
		async:true,
		success:function(list){

			window.load();
/* 
			$.each(list, function(i, item){

				/* 날짜만 가져오기  
				let d = list[i].reply_date;
				let date = d.substring(0, 11);
			
				$("#cmt").append("<tr class='text'>"
									+"<td class='replyTbl'>"
										+"<a href='javascript:void(0)' class='text ' onclick='profile("+ item.user_seq +")'>" 
										+ item.user_nickname + "</a>" 
									+"</td>" 
									+ "<td class='replyTbl'>" + item.reply_content + "</td>"
									+ "<td><div id='replyMenu' style='position: relative;'>"
										+ "<a href='#ex2' rel='modal:open' onclick='replyMenu()'> ··· </a>"
									+ "</div></td>"
									+ "</tr>" + "<tr class='text'>" + "<td>" + date + "<td>" + "<tr>");
				$("#cmt").append("<input type='hidden' name='reply_seq' value='" + ${item.reply_seq }+ "''>");
			}) 
		},
		error:function(){
			alert("error");
		}
	});
} */
/* 댓글 삭제 파라미터에 넣기 +${mem.user_seq},${post.post_seq}+ */
function replyMenu(user, reply){
	console.log(user + "," + reply);
	
	$("#replyMenu").append("<div id='ex2' class='modal'  style='max-width: 100%; width: auto;height:auto; display: table;'>"
								+"<button type='button' id='deletReply' class='btn modalBtn' onclick='deleteReply("+user+","+reply+")'>삭제하기</button><br>"
							+"</div> ");
}

function deleteReply(user,  reply){
	console.log(user +"," + reply);
	 location.href="deleteReply.do?user_seq="+user + "&reply_seq=" + reply + "&post_seq=" + $("#post_seq").val();
}




/*  댓글 추가 부분 */
function addComment(){

	let len =$.trim($('#comment').val()).length;
	
	if( $("#comment").val() == null || $("#comment").val() == "" || len == 0 ){
		$("#comment").val("");
		$("#comment").focus();
	}else{
			$.ajax({
			url:"addReply.do",
			type: "get",
			data: {"post_seq":$("#post_seq").val(), "user_seq":$("#user_seq").val(), "reply_content":  $("#comment").val() },
			async:true,
			success:function(data){
			//	console.log(data)
				$("#comment").val("");
				location.reload(true);
				location.href = location.href;

				history.go(0);
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

let Honoff = 0;
let HclsName = "far fa-heart";


$(document).ready(function(){
	

	$("#heart").on("click",function(){
		if(Honoff == 0) Honoff = 1;
		else		    Honoff = 0;

		$("#heart").removeClass(HclsName);

		if(Honoff == 1){
			HclsName = "fas fa-heart";
		}else{
			HclsName = "far fa-heart";
		}

		$.ajax({
			url:"addLike.do",
			type:"get",
			async:true,
			data: {"post_seq" : $("#post_seq").val(), "user_seq":$("#user_seq").val()},
			success:function(msg){
				/*msg가 NO일 경우 북마크에 추가됨*/
				
				if(msg == 'NO'){
					$("#heart").attr("class", HclsName);

				}else{
					$("#heart").attr("class", HclsName);
				}

				location.reload(true);
				location.href = location.href;

				history.go(0);
			},
			error:function(){
				alert("error");
	
			}
		});
	});

	$.ajax({
		url:"countLikeAll.do",
		type:"get",
		data:{"post_seq": $("#post_seq").val()},
		async: false,
		success:function(data){

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
			data: {"post_seq" : $("#post_seq").val(), "user_seq":$("#user_seq").val()},
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


	$("#followBtn").on("click",function(){
		/* if($("#followBtn").val() == 'Unfollow'){
			location.href='follow.do?follower='+${post.user_seq}+'&following='+21;
		}else{
			location.href='unfollow.do?follower='+${post.user_seq}+'&following='+21;
		} */

		$.ajax({
			url:'follow.do',
			data:{"following": ${post.user_seq}, "work": $("#followBtn").val()},
			success:function(data){
				$(this).html("Unfollow");

				location.reload(true);
				location.href = location.href;

				history.go(0);
			},
			error:function(){
				alert('에러');
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






<script src="<%=request.getContextPath() %>/js/detail/detail.js"></script>



</body>
</html>






