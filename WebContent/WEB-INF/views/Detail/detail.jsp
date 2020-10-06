<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form name="clipboard"><input type="hidden" name="shareUrl"></form> 

<div class="container">
<div>
	<a href="#none" onclick="history.back()"><i class="far fa-arrow-alt-circle-left" ></i></a>
</div>
<form>
<!-- <input type="hidden" name="seq" value="${post.post_seq }">	 -->
	<div>
		<table border="1">
		<tr>
			<td>
				<table border="1">
				<tr>
					<td>
					<!-- 사진 -->
					<div class="text">사진</div>
					</td>
				</tr>
				<tr>
					<td>
						<a href="javascript:void(0)"><i id="heart" class="far fa-heart"></i></a>
						<span id="heartCount"></span>
					</td>
					<td>
					<!-- <span>
						<c:if test="${count eq 0  }">
							<a href="#none"><i id="addBookmark" class="far fa-bookmark"></i></a>
						</c:if>
						<c:if test="${count eq 1  }">
							<a href="#none"><i id="addBookmark" class="fas fa-bookmark"></i></a>
						</c:if>
					</span> -->
						<a href="javascript:void(0)"><i id="addBookmark" class="far fa-bookmark"></i></a>
						
					</td>

				</tr>
				</table>
			</td>
			<td>
				<!-- 프로필 -->
				<div>
				<table border="1">
				<tr>
					<td rowspan="1">프로필 사진</td>
					<td>
						<!-- <table>
						<tr>
							<td>${member.nickname }</td>		<!-- 멤버 닉네임 가져오기 
						</tr>
						<tr>
							<td>${post.position }</td>
						</tr>
						</table>	 -->
					</td>
					<td>
					<div id="navi_set">
						<div id="topnav">···</div>
						<ul id="subnav">
							<li><a href="javascript:void(0)" id="editDetail">수정</a></li>
							<li><a href="javascript:void(0)" id="deleteDetail">삭제</a></li>
							<li>
								<a href="javascript:void(0)"  onClick="javascript:window.clipboardData.setData('Text', location.href);alert('주소가 복사되었습니다.\n\원하는 곳에 ctrl + v 하세요.');">
								공유</a>
							</li>							
						</ul> 
					</div>
					</td>
				</tr>
				<tr>
					<td colspan="3">내용</td>
				</tr>
				<tr>
					<td colspan="3">
						<textarea style="resize: none">댓글</textarea><br>
						
						<input type="text" id="comment">
						<input type="button" id="addCmt" value="입력">
					</td>
				</tr>
				</table>
			</div>
			</td>
		</tr>
		</table>
	</div>
</form>
</div> 

<script type="text/javascript">
$(document).ready(function(){

	
	$("#subnav").hide();

	$("#topnav").on("click",function(){
		$(this).parent().find("#subnav").slideDown('normal').show();
		$(this).parent().hover(function(){},
			function(){
				$(this).parent().find("#subnav").slideUp('fast');
			});
	});

	
	if( $("#comment").val(); == null){
		$("#comment").focus();
	}else{
		$("#addCmt").on("click",function(){
	
			$.ajax({
				url:"addReply.do",
				type: "get",
				data: {"post_seq":"1", "user_seq":"1", 
					"reply_content": cmt},
				success:function(data){
					console.log(data)
				},
				error:function(){
	
				}
			});
		});
	}
});

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
			async:false,
			data: {"post_seq" : "1", "user_seq":"1"},
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
		async: false,
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
			async:false,
			data: {"post_seq" : "1", "user_seq":"1"},
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

</script>  

<script>
function urlClipCopy() {
	var f = document.clipboard.url;
	f.value = document.location.href;
	f.select() ;
	therange=f.createTextRange() ;
	therange.execCommand("Copy");
	alert("클립보드로 URL이 복사되었습니다.");
	}
</script>

</body>
</html>






