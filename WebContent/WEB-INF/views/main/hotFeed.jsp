<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.nav-left-wrapper a:last-child{
		color:#f28705;
	}
	.nav-left-wrapper a:last-child:hover{
		cursor: auto;
		pointer-events:none;
	}
	.hotfeed-wrapper a:hover{
		text-decoration: none;
		cursor: pointer;
	}
	.hotfeed-wrapper{
		width:100%;
		margin:100px 0 0;
	}
	.hotfeed-wrapper .post-box{
		position: relative;
		display: block;
		max-width: 1200px;
		height: 500px;
		width:100%;
	    box-shadow: 2px 2px 2px 2px #E6E6E6;
   		border-radius: 4px;
   		left:50%;
   		transform:translateX(-50%);
   		margin-bottom:50px;
	}
	.post-box .left-table{
		position:absolute;
		width:50%;
		height:100%;
		left:0;
	}
	.left-table .photo-box{
		width:100%;
		height:100%;
		position: relative;
	}
	.left-table .photo-box img{
		width:95%;
		height:95%;
		object-fit:cover;
		padding:5px;
		border-radius: 15px;
		position: absolute;
		top:50%;
		left:50%;
		transform:translate(-50%,-50%);
	}
	.post-box .right-table{
		width:50%;
		height:100%;
		position: absolute;
		padding: 0 20px;
		right:0;
	}
	.right-box .inner-right-box{
		width:100%;
		height: 100%;
		display: flex;
		flex-direction: column;
		flex-wrap: nowrap;
	}
	.inner-right-box .right-up-box{
		position: relative;
		height: 50px;
		margin-top: 10px;
		display: flex;
		flex-direction: row;
		flex-wrap: nowrap;
	}
	.right-up-box .profile-box img.profile-img{
		width:50px;
		height:50px;
		border-radius: 50%;
		display:block;
	}
	.right-up-box .profile-box img.profile-img:hover{
		cursor: pointer;
	}
	.right-up-box .user-info{
		margin-left:20px;
		display: flex;
		flex-direction: column;
		flex-wrap: nowrap;
	}
	.content{
		margin-left: 5px;
	    padding-right: 20px;
	    overflow: auto;
	    height: 50%;
	    width: 100%;
	    white-space: normal;
	}
	.reply-list .reply{
		display: flex;
		flex-direction: row;
		flex-wrap: nowrap;
		margin: 15px 0;
		position: relative;
	}
	.reply-list .reply .reply-info{
		margin:auto;
	}
	.reply .reply-user-profile{
		margin-right: 10px;
		position:relative;
	}

	.reply .reply-user-profile img{
		width:30px;
		height:30px;
		border-radius: 50%;
		position: relative;
	    top: 50%;
    	transform: translatey(-50%);
	}
	
	.reply .reply-user-profile img:hover{
		cursor:pointer;
	}
	.reply-date{
		white-space: nowrap;
	}
	.post-content .hashtag-box a:not(:last-child):after{
		content:'';
		margin: 0 5px;
	}
	.right-down-box .post-status{
		display: flex;
		justify-content: space-between;
	}
	div.reply-content .reply-user{
		position: relative;
	    top: 50%;
	    transform: translateY(-50%);
	}
	.reply span.reply-content{
		margin-left:5px;
	}
	.post{
		color: #2B2D36;
	    white-space: inherit;
	}
	
	.screen-up {
	  position: fixed;
	  bottom: 24px;
	  right: 24px;
	  width: 50px;
	  height: 50px;
	  border-radius: 50%;
	  background-color: #F27405;
	  cursor: pointer;
	  text-align: center;
	  z-index: 5;
	  display:none;
	}
	
	.screen-up>i {
	  color: white;
	  font-size: 27px;
	  margin-top: 10.5px;
	}
</style>
<div class="screen-up" id="screen-up"><i class="fas fa-angle-up"></i></div>
<div class="hotfeed-wrapper">
	<c:forEach items="${hotFeed }" var="post" varStatus="i">
		<div class="post-box">
			<div class="left-table"><!-- 사진 -->
				<div class="photo-box">
					<img alt="no Picture"
						src="https://storage.googleapis.com/boomkit/${post.filePath }"
						class="container postPhoto" onclick="javascript:location.href='../detail?post_seq=${post.postSeq}'">
				</div>
			</div>
			<div class="right-table">
				<div class="inner-right-box">
					<div id="right-up-user-profile" class="right-up-box">
						<div class="profile-box">
							<img class="profile-img" src="${post.postUserProfile }" onclick="javascript:location.href='../mypage?user_seq=${post.userSeq}'">
						</div>
						<div class="user-info">
							<!-- 유저 닉네임 -->
							<div class="user-name">
								<a href="../mypage?user_seq=${post.userSeq }" class="text text-weight-medium body1 post">
									${post.userNickName }
								</a>
							</div>
							<!-- 지역 -->
							<div class="photo-positionname">
								<a href="../detail/map?post_seq=${post.postSeq }" class="text body2 post"> 
									${post.positionName }
								</a>
							</div>
						</div>
					</div>
					
					<hr>
					<div class="right-middle-box">
						<div class="content">
							<div class="post-content">
								<p class="text body1 post content-box" style="line-height: 1.9">
									${post.postContent }
								<p><br>
								<p class="text body1 hashtag-box">
									<c:forEach items="${post.hashtag }" var="hashtag">
										<a href="../keywordSearch?keywordId=${hashtag }" class="post">
											${hashtag }
										</a>
									</c:forEach>
								</p>
							</div>
							
							<div class="reply-list">
								<hr>
								<c:choose>
									<c:when test="${empty post.replyList }">
										<div class="text body2 post reply">
											<h2 class="reply-info text">작성된 댓글이 없어요!</h2>
										</div>
									</c:when>
									<c:otherwise>
										<c:forEach items="${post.replyList }" var="reply">
											<div class="text reply">
												<div class="reply-user-profile">
													<img class="reply-user-img" src="${reply.profile_image }" onclick="location.href='../mypage?user_seq=${reply.user_seq }'">
												</div>
												
												<div class="reply-content">
													<div class="reply-user">
														<a href="../mypage?user_seq=${reply.user_seq }" class="text-weight-bold body1 post replyNick">
															 ${reply.user_nickname }
														</a>&emsp;
														<div class="body2 post replyDate">
															<span class="reply-date">
																<fmt:parseDate value="${reply.reply_date}" var="replyDate" pattern="yyyy-MM-dd HH:mm:ss.s" />
																<fmt:formatDate value="${replyDate }" pattern="yy/MM/dd HH:mm" var="transDate"/>
																${transDate }
															</span> 
														</div>
													</div>
												</div>
												<span class="body1 post reply-content">${reply.reply_content }</span>
												<br>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
						<hr>
					<div class="right-down-box">		
						<div class="camera">
							<p class="text body1 post">
								<b>CAMERA</b>
							</p>
							<a href="../keywordSearch?keywordId=${post.cameraSerial }"> 
								<span class="badge badge-pill badge-neutral">
									${post.cameraSerial} 
								</span>
							</a>
						</div>
						
						<hr>
						<div class="post-status">
							<div class="user-heartBook">
								<c:choose>
									<c:when test="${empty login }"> <!-- 비로그인 -->
										<h4><i id="heart" class="far fa-heart" onclick="goLogin()"> ${post.postLike }</i> Likes</h4>
									</c:when>
									<c:when test="${post.userLike gt 0 }">
										<h4><i class="fas fa-heart" onclick="clickLike(this,${post.postSeq});"> ${post.postLike }</i> Likes</h4>
									</c:when>
									<c:otherwise>
				            			<h4><i class="far fa-heart" onclick="clickLike(this,${post.postSeq});"> ${post.postLike }</i> Likes</h4>
				            		</c:otherwise>
								</c:choose>
							</div>
						
							<div class="user-bookmark">
								<c:choose>
									<c:when test="${empty login  }">
										<h4><i class="far fa-star" onclick="goLogin();"> ${post.postBookmark }</i></h4>
									</c:when>
					            	<c:when test="${post.userBookMark gt 0  }">
					            		<h4><i class="fas fa-star" onclick="clickBookMark(this,${post.postSeq});"> ${post.postBookmark }</i></h4>
					            	</c:when>
					            	<c:otherwise>
					            		<h4><i class="far fa-star" onclick="clickBookMark(this,${post.postSeq});"> ${post.postBookmark }</i></h4>
					            	</c:otherwise>
				            	</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>	
</div>

<script type="text/javascript">
//우측 하단의 상단방향 화살표를 클릭시 실행되는 함수로 최상단페이지로 올려주는 역할 
$('#screen-up').click(function () {
	window.scrollTo({
		top: 0,
		left: 0
	})
})
var getMoreFeed = 0
$(window).scroll(function (e){
	//우측 하단의 상단방향 화살표가 400px이상 내려가면 화살표가 보이고 이하로 내려가면 안보이게 하는 역할 
	if(400 >= window){
		$('#screen-up').css('display','none')
	}else{
		$('#screen-up').css('display','block')	
	}
})

//좋아요 클릭시
function clickLike(e, seq) {
	changeMark(e, 'like', seq)
}
//북마크 클릭시
function clickBookMark(e, seq) {
	changeMark(e, 'book', seq)
}

//좋아요와 북마크를 클릭했을시 숫자를 증감시키는 역할과 비동기를 통해서 DB에 추가 삭제작업함
function calculNumber(e, b, cate, seq) {
	let number = Number(e.innerText)
	let url=''
	var data=""
	if(cate=='like'){
		url= "./addLike"
		if(b){
			data={
				post_seq:seq,
				dolike:true
			}
		}else{
			data={
				post_seq:seq,
				dolike:false
			}
		}
	}else{
		url= './addBookmark'
		if(b){
			data={
				post_seq:seq,
				dobook:true
			}
		}else{
			data={
				post_seq:seq,
				dobook:false
			}
		}
	}
	
	//비동기로 DB에 갈때 필요한것 post_seq, true/ false
	if (b) { 
		//db에서 삭제해야하는 부분
		e.innerText = " " + --number+" "
		$.ajax({
			url: url,
			type: "post",
			data: data,
			async:false,
			success: function () {},
			error: function () {}
		})
	} else { 
		//db에 추가
		e.innerText = " "+ ++number+" "
		$.ajax({
			url: url,
			type: "post",
			data: data,
			async:false,
			success: function () {},
			error: function () {}
		})
	}

}
//안이 차있으면 비워진 마크를 띄우고 비워져있으면 차있는 마크를 띄운다
function changeMark(e, cate, seq) {
	//fas == 안이 차있다 far==안이 비어있다
	//true false로 반환받음
	if (e.classList.contains('fas')) {
		//이미 누른거기때문에 비워야한다
		e.classList.remove('fas')
		e.classList.remove('text')
		e.classList.add('far')
		calculNumber(e, true, cate, seq)
	} else {
		//안누른거기 때문에 채워야한다
		e.classList.add('fas')
		e.classList.add('text')
		e.classList.remove('far')
		calculNumber(e, false, cate, seq)
	}
}
</script>
