<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/navi.css" />
<nav class="navbar navbar-default">
  <div class="container">
    <a href="<%=request.getContextPath() %>/main">
      <div class="brand-logo"></div>
      <p class="text text-weight-black">Inphomation</p>
    </a>
    <div class="menu">
      <h1>
        <i class="fas fa-map-marked-alt text" onclick="goMap();"></i>
        <i class="fas fa-user-friends text" onclick="goFollow();"></i>
      </h1>
      <div class="search-bar">
        <input type="text" name="searchKeyword" id="search-keyword" />
        <i class="fas fa-search text" onclick="searchKeyword();"></i>
      </div>
    </div>

    <div class="user-content">
      <!-- Guest -->
      <div class="guestMode">
        <h1>
	          <i class="fas fa-sign-in-alt text" onclick="goLogin();"></i>
        </h1>
        <div id="modal-container"></div>
      </div>
      <!-- user login -->
      <!-- admin login -->
     
      <div class="loginMode">
	      <h1>
	        <i class="fas fa-pencil-alt text" onclick="goWrite();"></i>
	        <i class="fas fa-user text" id="drop-btn"></i><!-- 이미지로 나중에 변경할 예정 -->
	      </h1>
          
          <!-- DropBox만들기 -->
	      <div class="dropbox" id="drop-menu">
	      	<h3>아무개님 Login</h3><!-- 로그인 백엔드 구현하고 정보 받아오면 수정하기 -->
	      	<ul>
	      		<li class="body1"><a href="/profile">내 프로필</a></li>
	      		<li class="body1"><a href="/bookmark">북마크 게시물</a></li>
	      		<li class="body1"><a href="/logout">로그아웃</a></li>	
	      	</ul>
	      </div>      
      </div>

    </div>
  </div>
</nav>
<script src="<%=request.getContextPath() %>/js/navigation.js"></script>