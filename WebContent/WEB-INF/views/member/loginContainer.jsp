<div class="modal-body">
  <form action="#" method="post">
    <div class="form-group">
      <i class="fa fa-user"></i>
      <input type="email" class="form-control" placeholder="email" required="required" />
    </div>
    <div class="form-group">
      <i class="fa fa-lock"></i>
      <input type="password" class="form-control pwd" placeholder="Password" required="required" />
      <i class="fas fa-eye control-password" id="control-password"></i>
    </div>
    <div class="form-group">
      <span class="result-msg"></span>
    </div>
    <div class="form-group">
      <input type="submit" class="btn btn-primary btn-block btn-lg" value="Login" />
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