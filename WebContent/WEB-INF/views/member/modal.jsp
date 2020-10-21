<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/modalPage.css">
<!-- Modal HTML -->
<div id="myModal" class="modal fade">
  <div class="modal-dialog modal-login">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="text modal-title select" id="modal-login-btn" onclick="changeClass(this);">Login</h4>
        <h4 class="text modal-title select-no" id="modal-regeister-btn" onclick="changeClass(this);">Regeister</h4>
      </div>
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
        &times;
      </button>
      <div class="body-container" id='body-container'>
        <div class="modal-body" >
          <form action="#" method="post" id="modal-form">
            <div class="form-group">
              <i class="fa fa-user"></i>
              <input type="email" class="form-control" placeholder="email" name="user_email" id="login-id" required="required" />
            </div>
            <div class="form-group">
              <i class="fa fa-lock"></i>
              <input type="password" class="form-control pwd user-pwd" placeholder="Password" id="login-pw" required="required" />
              <i class="fas fa-eye control-password" id="control-password" onclick="lookPw(this);"></i>
            </div>
            <div class="form-group">
              <span class="result-msg"></span>
            </div>
            <div class="form-group">
              <input type="button" class="btn btn-primary btn-block btn-lg" value="Login" onclick="submitLogin();"/>
              <input type="button" class="btn" value="테스트" onclick="confirmID();">
            </div>
            <div class="social-login">
              <input type="button" class="kakao-login" onclick="loginWithKakao();" style="background-image:url('<%=request.getContextPath()%>/img/login/kakao.png')"/>
              <input type="button" class="naver-login" onclick="loginWithNaver();" style="background-image:url('<%=request.getContextPath()%>/img/login/naver.png')"/>
            </div>
          </form>
        </div>
        <div class="modal-footer">
		  <a href="#">Forgot Password?</a>
		</div>
      </div>
    </div>
  </div>
</div>