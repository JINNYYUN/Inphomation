<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Inphomation / 로그인권한이 없습니다.</title>
	<meta charset="UTF-8" />
	 <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	 <link rel="stylesheet" href="<%=request.getContextPath() %>/css/default.css">
	 <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css">
	 <script src="https://kit.fontawesome.com/6ac784f4b9.js" crossorigin="anonymous"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	 <style>
	 body{
	 	background-color: #d8d8d8;
	 }
	 .inphomation-logo{
		max-width: 50%;
    	min-width: 270px;
    	display: block;
    	margin: auto;
 	}
 	.alert-box{
 		position: absolute;
 		top:50%;
 		left:50%;
 		transform:translate(-50%, -50%);
 		width:100%;
 		margin:0 auto;
 		max-width: 600px;
 		padding:30px;
 		background-color: #f2f2f2;
 		border-radius: 10px;
 		box-shadow: 3px 3px #5a5a77;
 	}
	.alert-msg{
		text-align: center;
	}
	div.msg{
		width:100%;
		padding:20px;
		white-space: nowrap;
	}
	.alert-box input.btn.btn-primary{
		width:80%;
		margin:20px auto 0;
	}
	 </style>
</head>
<body>
	<div class="container">
		<div class="alert-box">
			<img src="/img/Inphomation-logo.svg" alt="인포메이션 로고입니다" class="inphomation-logo">
			<div class="alert-msg text-weight-light">
				<div class="msg">
					<p class="text">현재 로그인하신 계정은 <strong class="text-primary text-weight-black">미인증 계정 혹은 비활성화 계정</strong>입니다.</p>
					이메일을 통한 <strong class="text-primary text-weight-black">인증을 한 이후에 서비스를 이용</strong>해 주시기 바랍니다.
				</div>
			</div>
			<input type="button" value="메인으로" class="btn btn-primary btn-block btn-lg" onclick="location.href='../main'">
		</div>
	</div>
</body>
</html>