<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDufBnGzI2ttp_WOvh83H8BgH6nT9HJLLc&callback=initAutocomplete&libraries=places&v=weekly"
	defer>
	</script>

<style>
.frm {
	position: relative;
	width: 1108px;
	height: 580px;
	margin-top: auto;
	box-shadow: 2px 2px 2px 2px #E6E6E6;
	border-radius: 50px;
}

.all {
	position: relative;
	padding-top: 100px;
	margin-top: 15px;
	background-color: #ffffff;
}

.photoBox {
	max-height: 100%;
}

.postPhoto {
	position: relative;
	width: 100%;
	height: 100%;
	object-fit: contain;
}

.leftTbl {
	position: relative;
	padding-top: 0px;
	margin-top: 0px;
	overflow: hidden;
	float: left;
	position: relative;
	width: 715px;
	height: 100%;
}

.rightTbl {
	position: relative;
	width: 35%;
	max-height: 100%;
	float: right;
}

.btn {
	background-color: #fff;
}

.camera-list, .camera {
	float: left;
}

.btn-outline-primary:hover {
	color: #F27405;
	background: #F2F2F2;
}

ul li {
	list-style: none;
	float: left;
}
.main-content{
	resize: none;
	overflow: scroll;
	width: 350px;
    height: 100px;
    overflow-x:hidden;
   	font-family: "Noto Sans KR", sans-serif;
}
.main-content::-webkit-scrollbar {
	width: 6px;
}
.main-content::-webkit-scrollbar-thumb {
	background-color: lightgray;
	border-radius: 10px;
}

.main-content::-webkit-scrollbar-track {
	background-color: #F2F2F2;
	border-radius: 10px;
	box-shadow: inset 0px 0px 0px black;
}
.position{
	width: fit-content;
	font-family: "Noto Sans KR", sans-serif;
}
.hsh-tag{
	border-top: none;
	border-left: none;
	border-right: none;
	border-radius: 0%;
	resize: none;
}
</style>


<div class="container all">

	<input type="hidden" name="post_seq" id="post_seq"
		value="${post.post_seq }"> <input type="hidden"
		name="user_seq" id="writer" value="${post.user_seq }">
	<div class="frm">
		<div class="leftTbl">
			<!-- 사진 -->
			<div class="photoBox">
				<img alt="no Picture"
					src="https://storage.googleapis.com/boomkit/${post.post_filepath }"
					class="postPhoto" onclick="zoomPhoto(this.src)">
			</div>
		</div>
		<div class="rightTbl">
			<div class="innerRightBox">
				<!-- 위치 -->
				<input type="text" id="post_position_name" class="text form-control position" value="${post.post_position_name }">
			</div>
			<textarea id="post_content" class="form-control text main-content">${post.post_content }</textarea>
			<div class="cmtCls">
				<div class="content">
					<div class="contHash">
						<p class="text body1 post" id="hashtag" style="line-height: 1.9">
							<textarea class="text form-control form-control-sm hsh-tag" id="hash-tag" style=" height: 100px; width: 350px;">
								<c:forEach items="${tag }" var="i" varStatus="j">&nbsp;${i.hashtag }</c:forEach></textarea>
						</p>
					</div>
					<div class="camera">
						<p class="text body1 post">
							<b>CAMERA</b>
						</p>
						<select class="custom-select camera-list">
							<c:forEach items="${camera }" var="i">
								<option class="btn btn-outline-primary body2 text-weight-light" id="${i.camera_serial }" onclick="changeCam(this.id, ${i.camera_seq})"
								value="${i.camera_serial }">${i.camera_serial }</option >
							</c:forEach>
						</select>
						<input type="text" id="camera_serial"
							value="${post.camera_serial }" readonly> <input
							type="hidden" id="camera_seq" value="${post.camera_seq }">
					</div>
				</div>
				<input type="button" id="update" value="수정">
			</div>
		</div>
	</div>
</div>
	<script type="text/javascript">

$("#update").on("click",function(){

	location.href="postUpDate?post_hashtag="+$("#hash-tag").val()+"
		&postLoaction="+$("#post_position_name").val();
	 	
	$.ajax({
		url:"updateAf",
		type:"post",
		data:{
			"post_seq" : $("#post_seq").val(),
			"post_content" : $("#post_content").val(),
			"camera_seq" : $("#camera_seq").val(),
			"post_position_name" : $("#post_position_name").val()
			},
		success:function(){
			 location.href="detail?post_seq="+$("#post_seq").val(); 

			
		},
		error:function(){

		}	
	});
	
});


function changeCam(val,seq){
	$("#camera_serial").val(val);
	$("#camera_seq").val(seq);
}

function initAutocomplete() {
    autocomplete = new google.maps.places.Autocomplete(
      document.getElementById("post_position_name"),
      { types: ["geocode"] }
    );
  };
</script>