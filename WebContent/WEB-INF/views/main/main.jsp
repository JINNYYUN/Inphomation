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
	<div class="grid">
		<c:forEach items="${postList }" var="post" varStatus="i">
			<div class="item">
				<img onclick="movePage(${post.postSeq})" src="https://storage.googleapis.com/boomkit/${post.filePath }">
				
				<div class="white-circle">
		            <i class="fas fa-bars menu" onclick="test();"></i>
		        </div>
		        <div class="bottom-icon-bar icon-absoulte">
		            <!-- Back 작성하면 변경하기 해당작성자 프로필로 이동으로 -->
		            <h4 onclick="moveUserPage(${post.userSeq});">${post.userNickName }</h4>
		            
		             <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
		            <!-- 나중에 1대신에 POST_SEQ기입 -->
		            <h4><i class="far fa-heart" onclick="clickLike(this,1);">${post.postLike }</i></h4>
		
		            <!-- BookMark 위와 동일  -->
		            <h4><i class="far fa-star" onclick="clickBookMark(this,1);">${post.postBookmark }</i></h4>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<script src="<%=request.getContextPath() %>/js/main.js"></script>

<script>

//input 검색 박스 focus시 css변경 이벤트
$('.search-bar').click(function(){
	$('#main-search-keyword').focus();
	$('.search-bar').css("border", "1px solid #F27405");
	$('#main-search-icon g').css("stroke", "#F27405");
	
}); 

$('#main-search-keyword').blur(function(){
	$('.search-bar').css("border", "1px solid #D9D9D9");
	$('#main-search-icon g').css("stroke", "#8c8c8c");
});

</script>
