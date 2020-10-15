/**
 * 
 */
 
 //ID  확인
function confirmID(){
	let userID = $(".form-group #regi-id")
	if(isEmail(userID.val().trim())){
		$.ajax({
			url:"confirmId",
			type:'post',
			data:{user_email:userID.val().trim()},
			success:function(data){
				console.log(data)
				//true는 데이터없슴ㄴ
			},
			error:function(){
				console.log('err')
			}
		})
	}else{
		userID.focus()
	}
}


//로그인확인
function submitLogin(){
	let id=$("#login-id")
	if(!isEmail(id.val())){
		return id.focus()
	}
	let pw=$("#login-pw")
	if(!isPassword(pw.val())){
		return pw.focus()
	}
	ajaxLogin(id.val().trim(),pw.val().trim())
}
function ajaxLogin(id,pw){
	$.ajax({
		url:"login",
		type:"post",
		data:{
			user_email:id,
			user_password:pw
		},
		success:function(result){
			if(result){
				//로그인성공으로 이동시키ㅣ기
				console.log('�α��μ���')
			}else{
				//실패알람
				console.log('�α��ν���')
			}
		},
		error:function(){
			alert('err')
		}
	})
}



//회원가입
function submitRegi(){
	let id=$("#regi-id")
	if(!isEmail(id.val())){
		return id.focus()
	}
	let pw=$("#regi-pw")
	if(!isPassword(pw.val())){
		return pw.focus()
	}
	let name=$('#regi-nickname')
	if(name.val().trim()==''){
		return name.focus()
	}
	

	$("#modal-form").submit()
	
}
//비밀번호 확인
function isPassword(asValue) {
	var regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/
	return regExp.test(asValue) // ���Ŀ� �´� ��� true ����
}
//이메일
function isEmail(asValue) {
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
	return regExp.test(asValue) // ���Ŀ� �´� ��� true ����	
}

//kakao로그인
function loginWithKakao() {
    Kakao.init('146852e4936968362989a8647123c65d')
    Kakao.Auth.login({
      success: function(authObj) {
        console.log(authObj)
        console.log(authObj.access_token)
       
        Kakao.Auth.setAccessToken(authObj.access_token)
        Kakao.API.request({
		    url: '/v2/user/me',
		    success:function(obj){
		    	console.log(obj)
		    	/*
		    	access token refreshtoken만 있으면 될듯 db저장은 안해도 될듯
		    	*/
		    }
		});
        
      },
      fail: function(err) {
        alert(JSON.stringify(err))

        //���� ajax�ֱ�
      },
    })
  }
  
//naver로그인
function loginWithNaver(){
	$.ajax({
		url:"getNaverLink",
		type:"get",
		success:function(url){
			let name="naverLogin"
			let option = "width=600,height=500,top=400,left=400,location=no"
			doPopup(url,name,option)
		},
		error:function(){
			alert('err')
		}
	})
}
function doPopup(url,name,option){
	window.open(url, name, option)
}
  /*
 	카카오 json
{access_token: "vVI2xZGn7Xefdr3GSiamwYlKbKS0qbzW5puCgQopyV8AAAF1GC47PA", token_type: "bearer", refresh_token: "nm9t-rQiwRrr4OcD2BDCQm6aiNXyJAow35yvGwopyV8AAAF1GC47Og", expires_in: 7199, scope: "account_email profile", ��}
access_token: "vVI2xZGn7Xefdr3GSiamwYlKbKS0qbzW5puCgQopyV8AAAF1GC47PA"
expires_in: 7199
refresh_token: "nm9t-rQiwRrr4OcD2BDCQm6aiNXyJAow35yvGwopyV8AAAF1GC47Og"
refresh_token_expires_in: 5183999
scope: "account_email profile"
token_type: "bearer"
__proto__: Object
  */