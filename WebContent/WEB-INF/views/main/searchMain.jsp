<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String keyword = request.getParameter("keywordId");%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css">
<div class="searchResult display-4" style="margin-top:100px;text-align: center;">
	검 색 결 과
</div>
<div class="main-container">
	<div class="content">
		<c:choose>
			<c:when test="${not empty postList }">
				<div class="grid">
					<c:forEach items="${postList }" var="post" varStatus="i">
						<div class="item">
							<img onclick="movePage(${post.postSeq})" src="https://storage.googleapis.com/boomkit/${post.filePath }">
								
					        <div class="bottom-icon-bar icon-absoulte">
					            <!-- Back 작성하면 변경하기 해당작성자 프로필로 이동으로 -->
					            <h4 onclick="moveUserPage(${post.userSeq});">${post.userNickName }</h4>
						            
					            <!-- 좋아요 -->
					            <c:choose>
					            	<c:when test="${empty login }">
					            		<h4><i class="far fa-heart" onclick="goLogin();">${post.postLike }</i></h4>
					            	</c:when>
					            	<c:when test="${post.userLike eq 1 }">
					            		<h4><i class="fas fa-heart" onclick="clickLike(this,${post.postSeq});">${post.postLike }</i></h4>
					            	</c:when>
					            	<c:otherwise>
					            		<h4><i class="far fa-heart" onclick="clickLike(this,${post.postSeq});">${post.postLike }</i></h4>
					            	</c:otherwise>
					            </c:choose>
						            
						            
					            <!-- 북마크 -->
								<c:choose>
									<c:when test="${empty login  }">
										<h4><i class="far fa-star" onclick="goLogin();">${post.postBookmark }</i></h4>
									</c:when>
					            	<c:when test="${post.userBookMark eq 1 }">
					            		<h4><i class="fas fa-star" onclick="clickBookMark(this,${post.postSeq});">${post.postBookmark }</i></h4>
					            	</c:when>
					            	<c:otherwise>
					            		<h4><i class="far fa-star" onclick="clickBookMark(this,${post.postSeq});">${post.postBookmark }</i></h4>
					            	</c:otherwise>
					            </c:choose>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:otherwise>
				<div class="result display-4">
					검색 결과가 없습니다
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<script src="<%=request.getContextPath() %>/js/main.js"></script>
<script>
<%if(session.getAttribute("login")==null){%>
	searchScrollEvent(true,"<%=keyword%>")
<%}else{%>
	searchScrollEvent(false,"<%=keyword%>")
<%}%>
	
</script>
