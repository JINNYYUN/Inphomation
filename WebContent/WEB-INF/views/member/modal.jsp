<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/modalPage.css">
<!-- Modal HTML -->
<div id="myModal" class="modal fade">
  <div class="modal-dialog modal-login">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="text modal-title select" id="modal-login-btn" onclick="changeClass(this);">로그인</h4>
        <h4 class="text modal-title select-no" id="modal-regeister-btn" onclick="changeClass(this);">회원가입</h4>
      </div>
      <div class="body-container" id='body-container'>
        <div class="modal-body" >
          <form action="#" method="post" id="modal-form">
            <div class="form-group">
              <i class="fa fa-user"></i>
              <input type="email" class="form-control" placeholder="email" name="user_email" id="login-id" required="required" onkeydown="enterKeyEvent(event)" />
            </div>
            <div class="form-group">
              <i class="fa fa-lock"></i>
              <input type="password" class="form-control pwd user-pwd" placeholder="Password" id="login-pw" required="required" onkeydown="enterKeyEvent(event)" />
              <i class="fas fa-eye control-password" id="control-password" onclick="lookPw(this);"></i>
            </div>
            <div class="form-group">
              <span class="result-msg"></span>
            </div>
            <div class="form-group">
              <input type="button" class="btn btn-primary btn-block btn-lg" id="login-btn" value="로그인" onclick="submitLogin();"/>
              <input type="button" class="btn btn-info btn-block btn-lg" value="비밀번호 찾기" onclick="location.href='http://'+location.host+'/resetPassword'"/>
            </div>
            <div class="social-login">
              <button type="button" class="kakao-login" onclick="loginWithKakao();" >카카오로 시작</button>
              <button type="button" class="naver-login" onclick="loginWithNaver();">네이버로 시작</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div> 