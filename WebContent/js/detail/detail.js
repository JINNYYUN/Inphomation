$(document).ready(function(){

	$("#followBtn").on("click",function(){
		$.ajax({
		url:'follow',
			data:{
			"following": $("#writer").val(), 
			"work": $("#followBtn").val()},
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

function follow(user_seq){
	
	location.href='follow?user_seq='+user_seq;
	
	location.reload(true);
	location.href = location.href;
}

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
		alert("로그인.........................................");
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
}

/* 유저 프로필로 이동 */
function profile(user_seq){
	location.href = "mypage?user_seq=" + user_seq;
}

/* 글 수정 */
function editDetail(){
	console.log("edit");
	/* location.href="editDetail?"; */
}
/* 글 삭제 */
function deleteDetail(){
	console.log("delete");
	location.href="deleteDetail?post_seq="+$("#post_seq").val();
}

/* 좋아요, 북마크 */
function addLikeBook(id){

	if($("#user_seq").val() == 0){
		alert("로그인.......................");
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



