<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link rel="stylesheet" type="text/css" href="css/Detail/Detail.css">
<script src="./js/detail/detail.js"></script>



<!-- url복사 -->
<form name="clipboard">
	<input type="hidden" name="shareUrl">
</form>
<input type="hidden" name="post_seq" id="post_seq"
	value="${post.post_seq }">
<input type="hidden" name="writer" id="writer" value="${post.user_seq }">
<input type="hidden" name="user_seq" id="user_seq" value="${user_seq }">

<div class="container all">
	
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
					<!-- modal Menu -->
					<div>
						<div class="modalMenu">
							<a href="#ex1" rel="modal:open">···</a>
						</div>
						<div id="ex1" class="modal">
							<c:if test="${post.user_seq eq user_seq }">
								<button type="button" id="editDetail" onclick="editDetail()"
									class="btn modalBtn">수정하기</button>
								<hr>
								<button type="button" id="deleteDetail" onclick="deleteDetail()"
									class="btn modalBtn">삭제하기</button>
								<hr>
							</c:if>
							<button type="button" id="sh-link" class="btn modalBtn">공유하기</button>
							<hr>
						</div>
					</div>
					<!-- 프로필 -->
					<div class="tableProfile">
						<div class="proflBox">
							<img class="profImg" src="${profile.profile_image }" onclick="profile(${profile.user_seq })">
						</div>
						<div>
							<div>
								<div>
								<!-- follow 가 true면 팔로우 상태 한번 더 클릭하면 언팔 -->
									<c:if test="${follow eq true }">
										<button type="button" id="followBtn"
											class="text btn btn-primary followBtn" value="Unfollow">
											Following</button>
									</c:if>
									<c:if test="${follow eq false  }">
										<button type="button" id="followBtn"
											class="text btn btn-outline-primary unfollowBtn" value="Follow">
											Follow</button>
									</c:if>
								</div>
								<div class="nickLoca">
									<!-- 멤버 닉네임 가져오기 -->
									<div>
										<a href="javascript:void(0)"
											onclick="profile(${profile.user_seq })"
											class="text text-weight-medium body1 post">
											${profile.user_nickname} </a>
									</div>
									<div>
										<!-- 위치 -->
										<a href="map?post_seq=${post.post_seq }"
											class="text body2 post"> ${post.post_position_name } </a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="cmtCls">
						<div class="content">
							<div class="contHash">
								<p class="text body1 post" style="line-height: 1.9">
									${post.post_content } <br>
									<c:forEach items="${tag }" var="i">
										<a href="javascript:void(0)" class="text body1 post">${i.hashtag }</a>
									</c:forEach>
								</p>
							</div>
	
							<div id="cmt" class="cmtTbl">
								<hr>
								<c:if test="${empty reply }">
									<div class="text body2 post reply">
										<p class="replyInfo">첫 댓글을 남겨보세요!</p>
									</div>
								</c:if>
	
								<c:forEach items="${reply }" var="i">
									<div class='text reply'>
										<div class="replyImgBox">
											<img class="replyImg" src="${i.profile_image }"
												onclick="profile(${i.user_seq })">
										</div>
										<div class="replyNick">
											<a href="javascript:void(0)"
												class="text-weight-bold body1 post replyNick"
												onclick="profile(${i.user_seq})"> ${i.user_nickname } </a>
											&emsp;
											<div class="body1 post replyCont">${i.reply_content }</div>
										</div>
										<c:if
											test="${i.user_seq eq user_seq || post.user_seq eq user_seq}">
											<div id="replyMenu" style="position: relative;"
												class="replyMenu">
												<a href="#ex2" rel="modal:open"
													onclick="replyMenu(${i.user_seq},${i.reply_seq })"> ···
												</a>
											</div>
										</c:if>
										<br>
										<div class="body2 post replyDate">
											${date } <input type="hidden" name="reply_seq"
												value=" ${i.reply_seq }">
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
						<a href="#none"> <span class="badge badge-pill badge-neutral">
								${post.camera_serial } </span>
						</a>
					</div>
	
					<hr>
					<div class="heartBook">
						<c:if test="${user_seq eq 0  }">
							<i id="heart" class="far fa-heart" onclick="addLikeBook(this.id)"></i>
						</c:if>
						<c:if test="${cLike eq 0  }">
							<a href="javascript:void(0)"> <i id="heart"
								class="far fa-heart" onclick="addLikeBook(this.id)"></i>
							</a>
						</c:if>
						<c:if test="${cLike eq 1  }">
							<a href="javascript:void(0)"> <i id="heart"
								class="fas fa-heart" onclick="addLikeBook(this.id)"></i>
							</a>
						</c:if>
					</div>
					<div class="heartBook">
						<c:if test="${user_seq eq 0  }">
							<i id="addBookmark" class="far fa-bookmark"
								onclick="addLikeBook(this.id)"></i>
						</c:if>
						<c:if test="${cBook eq 0  }">
							<i id="addBookmark" class="far fa-bookmark"
								onclick="addLikeBook(this.id)"></i>
						</c:if>
						<c:if test="${cBook eq 1  }">
							<i id="addBookmark" class="fas fa-bookmark"
								onclick="addLikeBook(this.id)"></i>
						</c:if>
	
					</div>
	
					<div>
						<div class="likeModal">
							<h5>
								<a id="heartCount" href="#ex3" class="text post" rel="modal:open" onclick="likeList()"></a>
							</h5>
						</div>
						<div id="modalList likeList">
							<div id='ex3' class='containaer modal likeList' style="overflow:scroll; overflow-x:hidden">
							<table class="like-table">
							<col width="50px"><col width="200px"><col width="50px">
							<c:forEach items="${likeList }" var="i">
								<tr>
									<td>
										<a href='#none' class='modal-like'> 
											<img class='replyImg' src='${i.profile_image } ' onclick='profile(${i.user_seq })'>
										</a>
									</td>
									<td>
										<span class='text modal-like' onclick='profile(${i.user_seq })' style="color: black">${i.user_nickname }</span>
									</td>
								</tr>
							</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<hr>
				<div class="cmtBox">
					<textarea id="comment" class="text post body1 comment"
						onKeypress="if(event.keyCode==13) {addComment()}"
						placeholder="댓글 달기"></textarea>
					<input type="button" id="addCmt" onclick="addComment()"
						class="text btn btn-reply" value="입력">
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){

	$.ajax({
		url:"countLikeAll",
		type:"get",
		data:{"post_seq": $("#post_seq").val()},
		success:function(data){

			if(data == '0'){
				$("#heartCount").html("&emsp;");
			}else{
				if(data == '1'){				

					$("#heartCount").html(data + " Like");
				}else{

					$("#heartCount").html(data + " Likes");					
				}
			}

			
		},
		error:function(){
			alert("error");
	
		}
	});	
});

</script>
<br><br>
<hr>
<br><br>

<jsp:include page="./detail_bottom.jsp"></jsp:include>
