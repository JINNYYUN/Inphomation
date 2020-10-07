
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/modalPage.css">
<!-- Button HTML (to Trigger Modal)
<div class="text-center">
  <a href="#myModal" class="trigger-btn" data-toggle="modal">Login</a>
</div>
 -->
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
            <div class="form-group">
              <a href="#" class="text">Forgot Password?</a>
            </div>
            <div class="social-login">
              <input type="button" class="kakao-login" style="background-image:url('<%=request.getContextPath()%>/img/login/kakao.png')"/>
              <input type="button" class="naver-login" style="background-image:url('<%=request.getContextPath()%>/img/login/naver.png')"/>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>