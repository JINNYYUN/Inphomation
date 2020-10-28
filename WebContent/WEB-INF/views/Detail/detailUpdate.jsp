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
	border-radius: 24px;
}

.all {
	position: relative;
    /* padding-top: 100px; */
    margin-top: 148px;
    background-color: #ffffff;
    margin-bottom: 200px;
}

.photoBox {
	max-height: 100%;
}

.postPhoto {
	position: relative;
	max-width: 653px;
	max-height: 578px;
	height: 100%;
	width: 100%;
	height: 100%;
	object-fit: contain;
	max-height: 578px;
	height: 100%;
	height: 100%;
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
	float: right;
	height: -webkit-fill-available;
	position: relative;
	max-height: 580px;
	min-height: 580px;
	margin-top: 50px;
}

.camera-list, .camera {
	float: left;
	width: auto;
}

.btn-outline-primary:hover {
	color: #F27405;
	background: #F2F2F2;
}

.main-content {
	resize: none;
	overflow: scroll;
	width: 350px;
	height: 100px;
	overflow-x: hidden;
	font-family: "Noto Sans KR", sans-serif;
}

.main-content::-webkit-scrollbar, .hsh-tag::-webkit-scrollbar {
	width: 0px;
}

.main-content::-webkit-scrollbar-thumb, .hsh-tag::-webkit-scrollbar-thumb
	{
	background-color: lightgray;
	border-radius: 0px;
}

.main-content::-webkit-scrollbar-track, .hsh-tag::-webkit-scrollbar-track
	{
	background-color: #F2F2F2;
	border-radius: 0px;
	box-shadow: inset 0px 0px 0px black;
}

.position {
	width: fit-content;
	font-family: "Noto Sans KR", sans-serif;
}

.hsh-tag {
	resize: none;
	overflow: scroll;
	width: 350px;
	height: 100px;
	overflow-x: hidden;
	font-family: "Noto Sans KR", sans-serif;
}

.finish-btn {
	font-family: "Noto Sans KR", sans-serif;
	float: right;
	border-radius: 10%;
}

.position,
.main-content, 
.hsh-tag, 
.camera-input {
	border-radius: 0.64rem;
	border: 2px solid #ced4da;
	width: 305px;
}

.custom-select {
	height: calc(1.72em + 0.75rem + 2px);
}

.loca-wrap, .cont-wrap, .contHash, .camera {
	margin-top: 5px;
}
.position,
.main-content, 
.hsh-tag{
	width: 280px;
    margin-left: 77px;
}
.wrap-btn{
    float: right;
    margin-top: 20px;
    margin-right: 30px;
}
.camera-input {
    background-color: #FFF;
    color: #2B2D36;
    width: 190px;
    float: right;
    /* margin-top: 29px; */
    margin-left: 8px;
    /* margin-top: 39px;*/
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
			<!-- 위치 -->
			<div class="loca-wrap">
				<div class="text h6 text-weight-bold" style="float: left;">장소</div>
				<input type="text" id="post_position_name"
					class="text form-control position"
					value="${post.post_position_name }">
			</div>
			<hr>
			<div class="cont-wrap">
				<div class="text h6 text-weight-bold" style="float: left;">설명</div>
				<textarea id="post_content" class="form-control text body2 main-content" style="height: 120px;">${post.post_content }</textarea>
			</div>
			<hr>
			<div class="contHash">
				<p class="text h6 text-weight-bold" style="float: left;">해시태그</p>
				<!-- <p class="text h6 text-weight-bold" id="hashtag"> -->
				<textarea class="text body2 form-control post form-control-sm hsh-tag" 
					id="hash-tag" style="height: 100px;"><c:forEach items="${tag }" var="i" varStatus="j">&nbsp;${i.hashtag }</c:forEach>
				</textarea>
				<!-- </p> -->
			</div>
			<hr>
			<div class="camera">
				<p class="text body1 post" style="margin-bottom: 10px;">
					<b>CAMERA</b>
				</p>
				<select class="text custom-select custom-select-sm camera-list"
					id="select_cam" onchange="changeCam(this.form)">
					<c:forEach items="${camera }" var="i">
						<option class="body2 text text-weight-light"
							value="${i.camera_seq }">${i.camera_serial }</option>
					</c:forEach>
				</select>
				<input type="text" class="text form-control camera-input"
					style="background-color: #FFF; color: #2B2D36;"
					id="camera_serial" value="${post.camera_serial }" readonly>
				<input type="hidden" id="camera_seq" value="${post.camera_seq }">
			</div>
			<div class="wrap-btn">
				<input type="button" class="btn btn-primary finish-btn" id="update"
					value="수정">
			</div>

		</div>
	</div>
</div>
<script type="text/javascript">

// 해시태그 공백 제거
let hash_tag = $("#hash-tag").val();
var hsh = hash_tag.replace(/\s/gi, "");


	$("#update").on(
			"click",
			function() {

				location.href = "/postUpDate?postHashTag="
						+ encodeURIComponent(hsh)
						+ "&postLocation="
						+ encodeURIComponent($("#post_position_name").val())
						+ "&post_seq=" + $("#post_seq").val();

				$.ajax({
					url : "updateAf",
					type : "post",
					data : {
						"post_seq" : $("#post_seq").val(),
						"post_content" : $("#post_content").val(),
						"camera_seq" : $("#camera_seq").val(),
						"post_position_name" : $("#post_position_name").val()
					},
					success : function() {
					/* 	location.href = "detail?post_seq="
								+ $("#post_seq").val(); */

					},
					error : function() {

					}
				});

			});

	function changeCam(val) {

		var str = val.select - cam.selectedIndex;

		alert("dd" + str);

	}

	$("#select_cam").change(function() {
		var cam = $(this).val();
		var txt = $("#select_cam option:checked").text();

		// select한 value를 input에 넣기
		$("#camera_seq").val(cam);
		$("#camera_serial").val(txt.trim());

	});

	function initAutocomplete() {
		autocomplete = new google.maps.places.Autocomplete(document
				.getElementById("post_position_name"), {
			types : [ "geocode" ]
		});
	};
</script>