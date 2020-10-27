<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


 <style>
 	body{
 		background-color: #d8d8d8;
 	}
 	.main-wrapper{
 		padding-bottom: 0;
 	}
	.basic-layout{
		min-height: calc(100vh - 81px)
	}
 	.login-container{
 		width: 100%;
	    height: calc(100vh - 250px);
	    min-height: 500px;
	    position: relative;
	    margin-top:80px;
	    margin-bottom:170px;
 	}
 	.login-container .inphomation-logo{
		max-width: 50%;
    	min-width: 270px;
    	display: block;
    	margin: auto;
    	cursor: pointer;
 	}
 	.login-container .modal-login{
 		position: absolute;
 		top:50%;
 		left:50%;
 		transform:translate(-50%, -50%);
 		width:100%;
 		margin: 0 auto;
 		max-width: 450px;
 		padding:30px;
 		background-color: #f2f2f2;
 		border-radius: 10px;
 		box-shadow: 3px 3px #5a5a77;
 	}
	.login-container .login-header {
	  display: flex;
	  border-bottom: none;
	  position: relative;
	  justify-content: center;
	  padding: 20px 0 10px;
	}
	
	.login-container .login-header h4 {
	  text-align: center;
	  font-size: 26px;
	  font-weight: 600;
	  width: 50%;
	  color: white;
	  cursor: pointer;
	}
	
	.login-container .login-header h4.select {
	  background-color: #F27405;
	}
	
	.login-container .login-header h4.select-no {
	  background-color: gray;
	}
	.login-container .login-form .form-group {
	  position: relative;
	}
	
	.login-container .form-group i {
	  position: absolute;
	  top: 11px;
	  font-size: 18px;
	}
 	.login-container .form-group .left-icon{
 	  left: 13px;
 	}
	.login-container .form-group .control-password {
	  right: 10px;
	}
	
	.login-container .modal-login .form-control {
	  padding-left: 40px;
	}
	
	.login-container .modal-login .form-control.pwd {
	  padding-left: 40px;
	  padding-right: 40px;
	}
	
	.login-container .modal-login .form-control,
	.login-container .modal-login .btn {
	  min-height: 40px;
	  border-radius: 3px;
	 } 
	.login-container .modal-login .btn,
	.login-container .modal-login .btn:active {
		  border: none;
		  color: white;
		  line-height: normal;
	}
	.login-container .modal-body .social-login{
		width:100%;
	}
	.login-container button.kakao-login{
	    width: calc(50% - 5px);
	    height: 50px;
	    color: rgb(34, 34, 34);
	    font-size: 20px;
	    font-weight: 700;
	    border: 0px;
	    background-color: rgb(247, 229, 6);
	    margin-right:5px;
	}
	.login-container button.naver-login{
		width: calc(50% - 5px);
		height: 50px;
		color:white;
	    font-size: 20px;
	    font-weight: 700;
		border: 0px;
		background-color:rgb(4,207,92);
	}
	.login-container .form-group span.result-msg{
		color:red;
	}
	.login-container .modal-login .form-group.btn-group{
		width:100%;
	}
	
	.login-container .cate.no-select{
		display:none;
	}
	.login-container .cate.select{
		display:block;
	}
 </style>
  <div class="login-container">

	<div class="modal-login">
		<img src="/img/Inphomation-logo.svg" alt="인포메이션 로고입니다" class="inphomation-logo" onclick="javascript:location.href='../main'" >
		<div class="login-header">
			<h4 class="text modal-title select" id="modal-login-btn" onclick="categoryChange(this);">로그인</h4>
			<h4 class="text modal-title select-no" id="modal-regeister-btn" onclick="categoryChange(this);">회원가입</h4>
		</div>
		<div id="login-window" class="cate select">
	  		<form action="#" method="post" class="login-form" id="login-form">
	            <div class="form-group">
	            	<i class="fa fa-user left-icon"></i>
	            	<input type="email" class="form-control" placeholder="email" name="user_email" id="login-id" required="required" onkeydown="enterKeyEvent(event)" />
	            </div>
	            <div class="form-group">
	              	<i class="fa fa-lock left-icon"></i>
	              	<input type="password" class="form-control pwd user-pwd" placeholder="Password" id="login-pw" required="required" onkeydown="enterKeyEvent(event)" />
	              	<i class="fas fa-eye control-password" id="control-password" onclick="lookPw(this);"></i>
	            </div>
	            <div class="form-group">
	              	<span class="result-msg"></span>
	            </div>
	            <div class="form-group">
	              	<input type="button" class="btn btn-primary btn-block btn-lg" value="로그인" onclick="pageLogin();"/>
	              	 <input type="button" class="btn btn-info btn-block btn-lg" value="비밀번호 찾기" onclick="location.href='http://'+location.host+'/resetPassword'"/>
	            </div>
	            <div class="social-login">
	            	<button type="button" class="kakao-login" onclick="pageWithKakao();" >카카오로 시작</button>
	              	<button type="button" class="naver-login" onclick="loginWithNaver();">네이버로 시작</button>
	            </div>
	 		</form>
 		</div>
 		
 		<div id="register-window" class="cate no-select">
 			<form action="#" method="post" class="login-form" id="register-form">
 				<div class="form-group">
			    	<i class="fa fa-user left-icon"></i>
			    	<input type="email" class="form-control" placeholder="email" id="regi-id" required="required" onblur="confirmId(this);"/>
			    </div>
			    
			    <div class="form-group">
			    	<i class="fa fa-lock left-icon"></i>
			    	<input type="password" class="form-control pwd user-pwd" placeholder="Password 8~10글자" id="regi-pw" required="required" />
			    	<i class="fas fa-eye control-password" id="control-password" onclick="lookPw(this);"></i>
			    </div>
			    
			    <div class="form-group">
			    	<i class="fas fa-id-card left-icon"></i>
			    	<input type="text" class="form-control" placeholder="NickName" id="regi-nickname" required="required" />
			    </div>
			    
			    <div class="form-group">
			    	<span class="result-msg"></span>
			    </div>
			    
			    <div class="form-group btn-group">
			    	<input type="button" value="Cancel" class="cancel-btn btn btn-danger" id="cancel-btn" onclick="location.href='../main'"> 
			    	<input type="button" value="Regeister" class="regeister-btn btn btn-primary" id="regeister-btn" disabled onclick="submitRegi();">
			    </div>
 			</form>
 		</div>
	</div>
  </div>

   <script type="text/javascript">
	var loginBtn = document.getElementById('modal-login-btn')
	var regiBtn = document.getElementById('modal-regeister-btn')
	var loginWindow = document.getElementById('login-window')
	var regiWindow = document.getElementById('register-window')
	function categoryChange(e){
		if(e==loginBtn){ //로그인 버튼을 클릭했을때
			loginBtn.classList.remove('select-no')
			loginBtn.classList.add('select')
			regiBtn.classList.remove('select')
			regiBtn.classList.add('select-no')

			loginWindow.classList.add('select')
			loginWindow.classList.remove('no-select')
			regiWindow.classList.add('no-select')
			regiWindow.classList.remove('select')
			$('.form-group .result-msg').html()
		}else{
			loginBtn.classList.remove('select')
			loginBtn.classList.add('select-no')
			regiBtn.classList.remove('select-no')
			regiBtn.classList.add('select')

			loginWindow.classList.add('no-select')
			loginWindow.classList.remove('select')
			regiWindow.classList.add('select')
			regiWindow.classList.remove('no-select')
			$('.form-group .result-msg').html('')
		}
	} 
	
	//로그인확인
	function pageLogin(){
		let id=$("#login-id")
		if(!isEmail(id.val())){
			$('.form-group .result-msg').text('아이디를 정상적으로 입력해 주세요')
			return id.focus()
		}
		let pw=$("#login-pw")
		if(!isPassword(pw.val())){
			$('.form-group .result-msg').text('패스워드가 형식에 맞지 않습니다')
			return pw.focus()
		}
		Login(id.val().trim(),pw.val().trim())
	}
	//로그인
	function Login(id,pw){
		
		$.ajax({
			url:"login",
			type:"post",
			data:{
				user_email:id,
				user_password:pw
			},
			success:function(result){
				console.log(result)
				if(result=='success'){//로그인성공 URL변경하기
					location.href='http://'+location.host+'${goPage }'
				}else if(result=='fail'){//실패알람 html에 실패알람 넣기
					$('.form-group .result-msg').text('로그인 정보가 일치하지 않습니다')
				}else{
					location.href='http://'+location.host+'/noHaveAuth'
				}
			},
			error:function(){
				alert('err')
			}
		})
		
	}
	function pageWithKakao() {
		var access_token=''
	    Kakao.init('146852e4936968362989a8647123c65d')
	    Kakao.Auth.login({
	      success: function(authObj) {
	        access_token = authObj.access_token
	        Kakao.Auth.setAccessToken(access_token)
		    Kakao.API.request({
		      url: '/v2/user/me',
		      success:function(obj){
		        console.log(obj)
		        $.ajax({
		        	url:"socialLogin",
		        	type:"post",
		        	data:makeKakaoData(obj),
		        	success:function(data){
		        		if(data){
		        			location.href='http://'+location.host+'${goPage }'
		        		}else{
		        			alert('로그인실패')
		        		}
		        	},
		        	error:function(){
		        		alert('err')
		        	}
		        })		        
		      },
		      fail:function(){
		        console.log('kakao err')
		      }
		    })
	      },
	      fail: function(err) {
	        alert(JSON.stringify(err))
	      }
	    })
	  }
   </script>
