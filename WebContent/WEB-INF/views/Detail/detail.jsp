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
						<a href="#none"><i class="far fa-heart"></i></a>
					</td>
					<td>
						<a href="#none"><i id="addBookmark" class="far fa-bookmark"></i></a>
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
							<li>수정</li>
							<li>삭제</li>
							<li>공유</li>							
						</ul> 
					</div>
					</td>
				</tr>
				<tr>
					<td colspan="3">내용</td>
				</tr>
				<tr>
					<td colspan="3">댓글</td>
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
	
});

</script>

<script type="text/javascript">
let onoff = 0;
let clsName = "far fa-bookmark";
$(document).ready(function(){

	$("#addBookmark").on("click",function(){

		
		/*
		alert(clsName);

		
		$("#addBookmark").attr("class", clsName);

		//$("#addBookmark").attr("class", "fas fa-bookmark");
		*/
		$.ajax({
			url:"addBookmark.do",
			type:"get",
			async:false,
			data: {"post_seq" : "1", "user_seq":"1"},
			success:function(msg){
				alert(msg);
				if(onoff == 0) onoff = 1;
				else		   onoff = 0;

				$("#addBookmark").removeClass(clsName);
				if(onoff == 1){
					clsName = "fas fa-bookmark";
				}else{
					clsName = "far fa-bookmark";
				}
				if(msg == 'NO'){
					$("#addBookmark").attr("class", clsName);

				}else{
	//				location.href="deleteBookmark.do";
				}
			},
			error:function(){
				alert("error");
	
			}
		});
	});
});
</script>  

</body>
</html>






