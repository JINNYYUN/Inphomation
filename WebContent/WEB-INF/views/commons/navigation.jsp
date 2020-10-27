<%@page import="bit.com.inpho.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
	MemberDto member = null;
	member = (MemberDto)session.getAttribute("login");
%>
<style>


</style>

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/navi.css" />
<nav class="navbar navbar-default">
  <div class="container">
  	<div class="moveSite">
  		<div class="logo-wrapper">
			<img src="${pageContext.request.contextPath}/img/Inphomation-logo.svg" alt="인포메이션 로고입니다" class="inphomation-logo" onclick="location.href='../main'"/>
  		</div>
  		<div class="nav-left-wrapper">
	  		<a class="goSite" onclick="goMap();">지도로 보기</a>
	  		<div></div>
	  		<a class="goSite" onclick="goHotFeed();">이달의 사진</a>
  		</div>
  	</div>
    <div class="menu">
      
    </div>
	<div id="modal-container"></div>
    <div class="user-content">
	    <div class="nav-search-box">
	        <input type="text" name="searchKeyword" id="navi-search-keyword" placeholder="위치·카메라를 검색해보세요" />
	        <div onclick="searchKeyword('navi')">
		        <svg width="23" height="23" viewBox="0 0 18 18" class="nav-search-icon" id="nav-search-icon">
					<g fill="none" fill-rule="evenodd">
						<circle cx="7.5" cy="7.5" r="6.5"></circle>
						<path d="M12 12l5 5"></path>
					</g>
				</svg>
			</div>
	      </div>
      <!-- Guest -->
     <%if(member==null){%>
      <div class="guestMode">
      	<a href="javascript:goLogin()" class="body1 nav-login-text"> 
  			회원가입 <span>·</span> 로그인
      	</a>
      </div>
      <%}else if(member!=null && member.getAuth()==0){ %>
      <!-- user login -->
      <!-- admin login -->
      <div class="loginMode">
	      <ol>
	      	<li>
	      		<div class="text">
		      		<i class="far fa-comment-dots nav-chat-icon" onclick="goMsg()"></i>
		      		<i class="fas fa-circle"></i>
	      		</div>
	      	</li>
	      	<li><div class="text nav-gowrite" onclick="goWrite();">글쓰기</div></li>
	      	<li>
	      		<%if(member.getProfile_image()==null||member.getProfile_image().equals("default")){ %>
		        	<img src="https://ssl.pstatic.net/static/pwe/address/img_profile.png" alt="UserProfileImage" id="drop-btn" /><!-- 이미지로 나중에 변경할 예정 -->
		        <%}else{ %>
		        	<img src="<%=member.getProfile_image() %>" alt="UserProfileImage" id="drop-btn">
		        <%} %>
	      	</li>
	      </ol>
          
          <!-- DropBox만들기 -->
	      <div class="dropbox" id="drop-menu">
	      	<h3><%=member.getUser_nickname() %></h3><!-- 로그인 백엔드 구현하고 정보 받아오면 수정하기 -->
	      	<ul>
				<li class="text body1 text-weight-medium"><a href="<%=request.getContextPath() %>/mypage?user_seq=<%=member.getUser_seq()%>">내 프로필</a></li>
	      		<li class="text body1 text-weight-medium"><a href="<%=request.getContextPath() %>/mypageedit">개인정보수정</a></li>
	      		<li class="text body1 text-weight-medium"><a href="javascript:doLogout();">로그아웃</a></li>	
			</ul>
	      	<input type="hidden" value="<%=member.getUser_email()%>" id="userEmail">
	      </div>      
      </div>
	<%} %>
    </div>
  </div>
</nav>
<script src="<%=request.getContextPath() %>/js/navigation.js" ></script>
<%if(member==null){ %>
<script src="<%=request.getContextPath() %>/js/member.js" ></script>
<%}else{ %>
<script src="<%=request.getContextPath() %>/js/login.js" ></script>
<%} %>


<script>
$('#navi-search-keyword').focus(function(){
	//$('#main-search-keyword').focus();
	$('#nav-search-icon').css("stroke", "#F27405");	
}); 

$('#navi-search-keyword').blur(function(){
	//$('#main-search-keyword').focus();
	$('#nav-search-icon').css("stroke", "#989799");	
}); 

</script>