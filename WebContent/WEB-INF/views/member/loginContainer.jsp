<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<div class="modal-body">
  <form action="#" method="post" id="modal-form">
    <div class="form-group">
      <i class="fa fa-user"></i>
      <input type="email" class="form-control" placeholder="email" id="login-id" required="required" />
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
    </div>
    <div class="social-login">
       <input type="button" class="kakao-login" style="background-image:url('<%=request.getContextPath()%>/img/login/kakao.png')"/>
       <input type="button" class="naver-login" style="background-image:url('<%=request.getContextPath()%>/img/login/naver.png')"/>
    </div>
  </form>
</div>
<div class="modal-footer">
  <a href="#">Forgot Password?</a>
</div>