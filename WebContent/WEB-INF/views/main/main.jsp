<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css">

<div class="screen-up" id="screen-up"><i class="fas fa-angle-up"></i></div>
<div class="main-back-ground" id="back-img">
	<div class="sentence">
		<p class="display-4 text-weight-regular">당신의 <span class="text display-4 text-weight-bold">소중한 순간</span>을</p>
		<p class="display-4 text-weight-regular">간직하세요</p>
		 
	</div>
    <div class="search-bar">
    	<h1><svg width="30" height="30" viewBox="0 0 18 18" class="map-search-icon" id="map-search-icon">
			<g fill="none" fill-rule="evenodd" stroke="#222">
				<circle cx="7.5" cy="7.5" r="6.5"></circle>
				<path d="M12 12l5 5"></path>
			</g>
		</svg></h1>
        <input type="text" name="searchKeyword" id="search-keyword" />
        <button type="button" class="btn btn-primary btn-block btn-1g" onclick="searchKeyword('main');">검색</button>
    </div>
   	<hr>
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
