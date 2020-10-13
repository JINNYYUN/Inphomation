<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/MyPage/MyPageEditMem.css">

</head>
<body>

<div class="container">

	<div class="content" align="center">
		<p class="title">비밀번호 변경</p>
		<form id="frm" action="" method="post">
		<table class="table">
			<tr>
				<td><p>현재 비밀번호</p></td><td><input type="password" class="form-control form-control-lg" id="inputPwd"></td>
			</tr>
			<tr>
				<td><p>새 비밀번호</p></td><td><input type="password" class="form-control form-control-lg" id="newPwd"></td>
			</tr>
		 	<tr>
		 		<td colspan="2"><input class="btn btn-outline-danger" type="button" value="확인" id="pwdCheck"></td>
		 	</tr>
		
		</table>
		</form>
	</div>
</div>

<script type="text/javascript">

$("#pwdCheck").click(function(){
	if($("#inputPwd").val() == "" || $("#newPwd").val() == ""){
		alert('비밀번호를 입력해주세요');
	}else{
		
		$.ajax({
			url:'checkPwd',
			type:'post',
			data:{ user_seq:'${mem.user_seq}', user_password:$("#inputPwd").val(), newPwd:$("#newPwd").val()},
			success:function(data){
				alert('success');
				if(data == 'yes'){
					alert('비밀번호가 변경되었습니다');
					location.href="mypage?user_seq=" + ${mem.user_seq};
				}
				else if(data == 'no'){
					alert('비밀번호 변경에 실패했습니다');
					$("#newPwd").val("");
				}
				else{
					alert('입력하신 현재 비밀번호가 일치하지 않습니다');
					$("#inputPwd").val("");
				}
			},
			error:function(){
				alert('error');
			}
		
				
			});
		
	
	}
	
});

</script>

</body>
</html>