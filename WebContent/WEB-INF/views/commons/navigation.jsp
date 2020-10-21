<%@page import="bit.com.inpho.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
	MemberDto member = null;
	member = (MemberDto)session.getAttribute("login");
%>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/navi.css" />
<nav class="navbar navbar-default">
  <div class="container">
  	<ul class="moveSite">
  		<li class="main">
 			<a href="<%=request.getContextPath() %>/main">
	      		<p class="text text-weight-black">
	      			<h1 class="text-weight-bold">Inphomation</h1>
      			</p>
	    	</a>
  		</li>
  		<li class="goSite"><div class="text" onclick="goMap();">지도</div></li>
  		<li class="goSite"><div class="text" onclick="goFollow();">팔로우</div></li>
  	</ul>
    <div class="menu">
      <div class="search-bar">
        <input type="text" name="searchKeyword" id="search-keyword" />
        <button type="button" class="btn btn-primary btn-block btn-1g" onclick="searchKeyword('navi');">검색</button>
      </div>
    </div>
	<div id="modal-container"></div>
    <div class="user-content">
      <!-- Guest -->
     <%if(member==null){%>
      <div class="guestMode">
      	<a href="javascript:goLogin()" class="body1"> 
  			회원가입<span style="user-select: auto;">·</span>로그인
      	</a>
      </div>
      <%}else if(member!=null && member.getAuth()==0){ %>
      <!-- user login -->
      <!-- admin login -->
      <div class="loginMode">
	      <ol>
	      	<li>
	      		<div class="text">
		      		<i class="far fa-envelope" onclick="goMsg()"></i>
		      		<i class="fas fa-circle"></i>
	      		</div>
	      	</li>
	      	<li><div class="text" onclick="goWrite();">글 쓰기</div></li>
	      	<li>
	      		<%if(member.getProfile_image()==null||member.getProfile_image().equals("default")){ %>
		        <i class="fas fa-user text" id="drop-btn"></i><!-- 이미지로 나중에 변경할 예정 -->
		        <%}else{ %>
		        <img src="<%=member.getProfile_image() %>" alt="UserProfileImage" id="drop-btn">
		        <%} %>
	      	</li>
	      </ol>
          
          <!-- DropBox만들기 -->
	      <div class="dropbox" id="drop-menu">
	      	<h3><%=member.getUser_nickname() %></h3><!-- 로그인 백엔드 구현하고 정보 받아오면 수정하기 -->
	      	<ul>
	      		<li class="body1"><a href="<%=request.getContextPath() %>/mypage">내 프로필</a></li>
	      		<li class="body1"><a href="<%=request.getContextPath() %>/bookmark">북마크 게시물</a></li>
	      		<li class="body1"><a href="<%=request.getContextPath() %>/mypageedit">개인정보수정</a></li>
	      		<li class="body1"><a href="javascript:doLogout();">로그아웃</a></li>	
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
