<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container all">


<input type="hidden" name="post_seq" id="post_seq" value="${post.post_seq }">
<input type="hidden" name="user_seq" id="writer" value="${post.user_seq }">
	<div class="frm">
		<div class="leftTbl">
			<!-- 사진 -->
			<div class="photoBox">
				<img alt="no Picture"
					src="https://storage.googleapis.com/boomkit/${post.post_filepath }"
					class="container postPhoto" onclick="zoomPhoto(this.src)">
			</div>
		</div>
		<textarea id="post_content">${post.post_content }</textarea>
		<div class="rightTbl">
			<div class="innerRightBox">
				<!-- 위치 -->
				<input type="text" id="post_position_name" value=" ${post.post_position_name }">
			</div>
		</div>
		<hr>
		<div class="cmtCls">
			<div class="content">
				<div>
					<a href="javascript:void(0)" onclick="addTag()"><i class="fas fa-plus"></i></a>
				</div>
				<div class="contHash">
					<p class="text body1 post" id="hashtag" style="line-height: 1.9">
						<c:forEach items="${tag }" var="i" varStatus="j">
							<div id="hashtag${j.count }" >
								<input type="text" value="${i.hashtag }${i.tag_seq }" readonly>
								<input type="text" id="tag_seq${j.count }" value="${i.tag_seq }">
								<a href="javascript:void(0)" onclick="deleteTag(${j.count})"><i class="fas fa-times"></i></a>
							</div>
						</c:forEach>
					</p>
				</div>
				<div class="camera">
					<p class="text body1 post">
						<b>CAMERA</b>
					</p>
					<ul>
					<c:forEach items="${camera }" var="i">
						<li id="camera"><input type="button" onclick="changeCam(this.value, ${i.camera_seq})" value="${i.camera_serial }"></li>
					</c:forEach>
					</ul>
					<input type="text" id="camera_serial" value="${post.camera_serial }" readonly>
					<input type="hidden" id="camera_seq" value="${post.camera_seq }">
				</div>
			</div>
			<input type="button" id="update" value="수정">
		</div>
	</div>	

</div>			
<script type="text/javascript">
function deleteTag(num){
	console.log(num);
	$("#hashtag"+num).remove();

	let tag_seq = $("#tag_seq").val();
	console.log(tag_seq+num);
	
	$.ajax({
		url:"delTag",
		type:"get",
		data:{
				"post_seq" : $("#post_seq").val(),
				"tag_seq" : tag_seq 
			},
		error:function(){
			alert("dd");
		}
	});
	
}
function addTagDel(num){
	console.log(num);
	$("#hashtagadd"+num).remove();
}

var i = 0;

function addTag(){
	i++;

	var id = i;
	let aStr = '<a href="javascript:addTagDel('+id+')">'
	$("#hashtag").append("<div id='hashtagadd"+id+"'><input type='text' />"+aStr+"<i class='fas fa-times'></i></a></div>");

}

$("#update").on("click",function(){

	$.ajax({
		url:"updateAf",
		type:"post",
		data:{
			"post_seq" : $("#post_seq").val(),
			"post_content" : $("#post_content").val(),
			"camera_seq" : $("#camera_seq").val(),
			"post_position_name" : $("#post_position_name").val()},
		success:function(){
			alert("수정 완료");
		},
		error:function(){
			alert("잠시후 다시 시도해 주세요");
		}
			
	});
});


function changeCam(val,seq){
	$("#camera_serial").val(val);
	$("#camera_seq").val(seq);
}
</script>