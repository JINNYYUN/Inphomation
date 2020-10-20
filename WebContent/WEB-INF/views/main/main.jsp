<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css">

<div class="screen-up" id="screen-up"><i class="fas fa-angle-up"></i></div>
<div class="main-back-ground" id="back-img">
    <div class="search-bar" style="position:relative;top:200px;width:50%;margin:0 auto;min-width:250px;">
      <input type="text" name="searchKeyword" id="main-search-keyword" style="width:100%;" />
      <i class="fas fa-search text" onclick="searchKeywordMain();"></i>
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
