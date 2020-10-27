<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>비밀번호 재설정</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/default.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css">
		<script src="https://kit.fontawesome.com/6ac784f4b9.js" crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/member.js"></script>
		<style>
			body{
		 		background-color: #d8d8d8;
		 	}
	 	 	.inphomation-logo{
				max-width: 50%;
		    	min-width: 270px;
		    	display: block;
		    	margin: 0 auto 30px;
		 	}
		 	.container .box{
		 		position: absolute;
		 		top:50%;
		 		left:50%;
		 		transform:translate(-50%, -50%);
		 		width:100%;
		 		margin:0 auto;
		 		max-width: 450px;
		 		padding:30px 50px;
		 		background-color: #f2f2f2;
		 		border-radius: 10px;
		 		box-shadow: 3px 3px #5a5a77;
		 	}
		 	.box .form-group{
		 		position: relative;
		 	}
		 	.form-group i {
			  position: absolute;
			  font-size: 18px;
		      top: 50%;
    		  transform: translateY(-50%);
			}
			.form-group .left-icon{
		 	  left: 13px;
		 	}
		 	.form-group .form-control {
			  padding-left: 40px;
			}
			.form-group input.btn{
			  padding-top:0;
			  padding-bottom:0;
			}
			.result-msg.alert{
			  color:red;
			}
			.form-group .control-password {
			  right: 10px;
			}
			.form-control.pwd {
			  padding-left: 40px;
			  padding-right: 40px;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="box">
				<img src="/img/Inphomation-logo.svg" alt="인포메이션 로고입니다" class="inphomation-logo">
				<c:choose>
					<c:when test="${page eq '0' }">
						<div class="form-group">
			            	<i class="fa fa-user left-icon"></i>
			            	<input type="email" class="form-control" placeholder="가입시 기입한 E-mail을 적어주세요" name="user_email" id="login-id" required="required" />
			            </div>
					</c:when>
					<c:when test="${page eq '1' }">
						<div class="form-group">
			              	<i class="fa fa-lock left-icon"></i>
			              	<input type="password" class="form-control pwd user-pwd" placeholder="Password" id="login-pw" required="required" />
			              	<i class="fas fa-eye control-password" id="control-password" onclick="lookPw(this);"></i>
		           		</div>
					</c:when>
					<c:otherwise>
						<div class="form-group" style="text-align: center">
							<span class="text text-primary text-weight-black">잘못된 접근입니다</span>
						</div>
					</c:otherwise>
				</c:choose>

	            <div class="form-group" id="msg-box" style="display:none;">
	            	<span class="result-msg alert"></span>
	            </div>
	            <div class="form-group">
	            	<c:choose>
	            		<c:when test="${page eq '0' }">
	            			<input type="button" class="btn btn-primary btn-block btn-lg" value="확인" onclick="confirm();">
	            		</c:when>
	            		<c:when test="${page eq '1' }">
	            			<input type="button" class="btn btn-primary btn-block btn-lg" value="확인" onclick="resetPwd();">
	            		</c:when>
	            	</c:choose>
	            	
	            	<input type="button" class="btn btn-info btn-block btn-lg" value="메인으로" onclick="location.href='../main'">
	            </div>
			</div>
		</div>
		
	<script type="text/javascript">
		function confirm(){
			let id=$("#login-id")
			if(!isEmail(id.val())){
				wakeUpResultMsg()
				$('.form-group .result-msg').text('이메일 형식이 맞지 않습니다')
				return id.focus()
			}else{
				mailSubmit(id.val().trim())
			}
		}
		function mailSubmit(id){
			$.ajax({
				url:"confirmId",
				type:"post",
				data:{
					user_email:id
				},
				async:false,
				success:function(data){
					if(data){ //계정이 없슴
						wakeUpResultMsg()
						$('.form-group .result-msg').text('가입되지 않은 계정입니다.')
					}else{
						sendMail(id)
					}
				}
			})
		}
		function sendMail(id){
			$.ajax({
				url:"sendResetPwd",
				type:"post",
				data:{
					user_email:id
				},
				async:false,
				success:function(){
					alert('입력하신 메일을 확인해주시기 바랍니다')
					//location.href="../main"
				}
			})
		}
		function wakeUpResultMsg(){
			$('#msg-box').css('display','block')
		}

		function resetPwd(){
			let pwd = $('#login-pw')
			if(!isPassword(pwd.val())){
				wakeUpResultMsg()
				$('.form-group .result-msg').text('비밀번호 형식이 맞지 않습니다')
				return pw.focus()
			}
			
			let data={
				user_email:'${info.user_email }',
				user_password:pwd.val(),
				authKey:'${param.authKey }'
			}
			$.ajax({
				url:"changePwd",
				type:"post",
				data:data,
				async:false,
				success:function(data){
					if(data){
						alert('변경이 완료되었습니다')
						location.href="../main"
					}else{
						alert('다시 시도해 주세요')
					}
				}
			})			
		}

	</script>
	</body>
</html>