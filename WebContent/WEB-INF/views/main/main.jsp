<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css">

<div class="screen-up" id="screen-up"><i class="fas fa-angle-up"></i></div>
<div class="container main-back-ground" id="back-img">
	<div class="sentence-search-bar">
		<div class="main-sentence">
			<h1 class="main-text"><span class="text text-color-orange text-weight-regular">사진</span>의 정보가</h1>
			<h1 class="main-text">궁금하신가요?</h1>
		</div>
		<div class="search-bar">
	        <input type="text" name="searchKeyword" id="main-search-keyword" placeholder="위치, 카메라, 보정법"/>
	        <svg width="25" height="25" viewBox="0 0 18 18" class="main-search-icon" id="main-search-icon">
				<g fill="none" fill-rule="evenodd">
					<circle cx="7.5" cy="7.5" r="6.5"></circle>
					<path d="M12 12l5 5"></path>
				</g>
			</svg>
	        <button type="button" class="btn btn-primary" onclick="searchKeyword('main');"><h4>검색</h4></button>
   	 	</div>
	</div>
</div>
<div class="main-container">
	<div class="content">
		<div class="grid">
			<c:forEach items="${postList }" var="post" varStatus="i">
				<div class="item">
					<img onclick="movePage(${post.postSeq})" src="https://storage.googleapis.com/boomkit/${post.filePath }">
					
			        <div class="bottom-icon-bar icon-absoulte">
			            <!-- Back 작성하면 변경하기 해당작성자 프로필로 이동으로 -->
			            <h6 onclick="moveUserPage(${post.userSeq});">${post.userNickName }</h6>
			            
			            <!-- 좋아요 -->
			            <c:choose>
			            	<c:when test="${empty login }">
			            		<h6><i class="far fa-heart" onclick="goLogin();"> ${post.postLike }</i> Likes</h6>
			            	</c:when>
			            	<c:when test="${post.userLike gt 0 }">
			            		<h6><i class="fas fa-heart" onclick="clickLike(this,${post.postSeq});"> ${post.postLike }</i> Likes</h6>
			            	</c:when>
			            	<c:otherwise>
			            		<h6><i class="far fa-heart" onclick="clickLike(this,${post.postSeq});"> ${post.postLike }</i> Likes</h6>
			            	</c:otherwise>
			            </c:choose>
			            
			            
			            <!-- 북마크 -->
						<c:choose>
							<c:when test="${empty login  }">
								<h6><i class="far fa-bookmark" onclick="goLogin();"> ${post.postBookmark }</i> Book</h6>
							</c:when>
			            	<c:when test="${post.userBookMark gt 0 }">
			            		<h6><i class="fas fa-bookmark" onclick="clickBookMark(this,${post.postSeq});"> ${post.postBookmark }</i> Book</h6>
			            	</c:when>
			            	<c:otherwise>
			            		<h6><i class="far fa-bookmark" onclick="clickBookMark(this,${post.postSeq});"> ${post.postBookmark }</i> Book</h6>
			            	</c:otherwise>
			            </c:choose>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<script src="<%=request.getContextPath() %>/js/main.js"></script>

<script>

//input 검색 박스 focus시 css변경 이벤트
$('.main-back-ground .search-bar').click(function(){
	//$('#main-search-keyword').focus();
	$('.main-back-ground .search-bar').css("border", "1px solid #F27405");
	$('#main-search-icon g').css("stroke", "#F27405");
	
}); 

$('#main-search-keyword').blur(function(){
	$('.main-back-ground .search-bar').css("border", "1px solid #D9D9D9");
	$('#main-search-icon g').css("stroke", "#8c8c8c");
});
var mainSearch = document.getElementById('main-search-keyword')
mainSearch.onkeydown = function(event){
	if(event.keyCode==13){
		searchKeyword('main')
	}
}
<%if(session.getAttribute("login")==null){%>
	mainScrollEvent(true)
<%}else{%>
	mainScrollEvent(false)
<%}%>
</script>
