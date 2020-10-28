<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<div class="modal-body" >
  <form action="#" method="post" id="modal-form">
    <div class="form-group">
      <i class="fa fa-user"></i>
      <input type="email" class="form-control" placeholder="email" id="regi-id" required="required" onblur="confirmId(this);"/>
    </div>
    <div class="form-group">
      <i class="fa fa-lock"></i>
      <input type="password" class="form-control pwd user-pwd" placeholder="Password 8~10글자" id="regi-pw" required="required" />
      <i class="fas fa-eye control-password" id="control-password" onclick="lookPw(this);"></i>
    </div>
    <div class="form-group">
      <i class="fas fa-id-card"></i>
      <input type="text" class="form-control" placeholder="NickName" id="regi-nickname" required="required" />
    </div>
    <div class="form-group">
      <span class="result-msg"></span>
    </div>
    <div class="form-group btn-group">
      <input type="button" value="Cancel" class="cancel-btn btn btn-danger" id="cancel-btn" onclick="modalClose()"> 
      <input type="button" value="Regeiester" class="regeister-btn btn btn-primary" id="regeister-btn" disabled onclick="submitRegi();">
    </div>
  </form>
</div>