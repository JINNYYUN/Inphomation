
$(document).ready(function(){

	
});


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
	imgWin.document.write("<html style='overflow-x:hidden; overflow-y:auto;'><head><title>확대보기</title></head>");
	imgWin.document.write("<body topmargin=0 leftmargin=0>");
	imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
	imgWin.document.close();
}
/* ******************** */



/* 댓글 모달 메뉴 */
function replyMenu(user, reply){
	console.log(user + "," + reply);
	
	$("#replyMenu").append("<div id='ex2' class='modal'  style='max-width: 100%; width: auto;height:auto; display: table;'>"
								+"<button type='button' id='deletReply' class='btn modalBtn' onclick='deleteReply("+$("#user_seq").val()+","+reply+")'>삭제하기</button><br>"
							+"</div>");
}

/* 댓글 삭제 */
function deleteReply(user,  reply){
	console.log(user +"," + reply);
	 location.href="deleteReply?user_seq="+user + "&reply_seq=" + reply + "&post_seq=" + $("#post_seq").val();
}


/*  댓글 추가 부분 */
function addComment(){

	/* 로그인을 하지 않았을 경우 로그인 페이지로 이동 */
	if($("#user_seq").val() == 0){
		$("#comment").val("");
		alert("로그인 페이지로 이동합니다");
		location.href="goLogin";
	}else{
	
		let len =$.trim($('#comment').val()).length;
		
		if( $("#comment").val() == null || $("#comment").val() == "" || len == 0 ){
			$("#comment").val("");
			$("#comment").focus();
		}else{
				$.ajax({
				url:"addReply",
				type: "get",
				data: {"post_seq":$("#post_seq").val(), "user_seq":$("#user_seq").val(), "reply_content":  $("#comment").val() },
				async:true,
				success:function(){
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
}

/* 유저 프로필로 이동 */
function profile(user_seq){
	location.href = "mypage?user_seq=" + user_seq;
}

/* 글 수정 */
function editDetail(post){
	console.log("edit");
	location.href="update?post_seq=" + post;
}
/* 글 삭제 */
function deleteDetail(){
	console.log("delete");
	location.href="deleteDetail?post_seq="+$("#post_seq").val();
}

/* 좋아요, 북마크 */
function addLikeBook(id){

	if($("#user_seq").val() == 0){
		alert("로그인 페이지로 이동합니다");
		location.href="goLogin";
	}else{

		$.ajax({
			url:"addLikeBook",
			data: {"post_seq": $("#post_seq").val(),
					"user_seq": $("#user_seq").val(),
					"word":id},
			async:true,
			success:function(){

				location.reload(true);
				location.href = location.href;

			},
			error:function(){
				alert("오류");

			}
		});
	}
}

