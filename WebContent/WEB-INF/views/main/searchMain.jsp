<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css">
<div class="searchResult" style="margin-top:100px;margin-left:20%;">
	<h2><strong class="text text-color-orange text-weight-bold display-4">'${param.keywordId }'</strong>에 대한 검색결과 입니다.</h2>
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
			</c:when>
			<c:otherwise>
				<div class="result display-4" style="text-align: center;">
					검색 결과가 없습니다
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<script src="<%=request.getContextPath() %>/js/main.js"></script>
<script>
<%if(session.getAttribute("login")==null){%>
	searchScrollEvent(true,"${param.keywordId }")
<%}else{%>
	searchScrollEvent(false,"${param.keywordId }")
<%}%>
	
</script>
