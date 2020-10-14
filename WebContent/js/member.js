
//로그인버튼 유효성검사
function submitLogin(){
	let id=$("#login-id")
	if(!isEmail(id.val())){
		return id.focus()
	}
	let pw=$("#login-pw")
	if(!isPassword(pw.val())){
		return pw.focus()
	}
	$("#modal-form").submit()
}


//회원가입 유효성검사
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
//비밀번호 8-10확인
function isPassword(asValue) {
	var regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/
	return regExp.test(asValue) // 형식에 맞는 경우 true 리턴
}
//이메일 양식확인
function isEmail(asValue) {
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
	return regExp.test(asValue) // 형식에 맞는 경우 true 리턴	
}

//카카오로그인
function loginWithKakao() {
    Kakao.init('146852e4936968362989a8647123c65d')
    Kakao.Auth.login({
      success: function(authObj) {
        console.log(authObj)
        console.log(authObj.access_token)
        //성공ajax넣기
      },
      fail: function(err) {
        alert(JSON.stringify(err))

        //실패 ajax넣기
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
			alert('문제발생')
		}
	})
}
function doPopup(url,name,option){
	window.open(url, name, option)
}
  /*
  카카오 데이터
{access_token: "vVI2xZGn7Xefdr3GSiamwYlKbKS0qbzW5puCgQopyV8AAAF1GC47PA", token_type: "bearer", refresh_token: "nm9t-rQiwRrr4OcD2BDCQm6aiNXyJAow35yvGwopyV8AAAF1GC47Og", expires_in: 7199, scope: "account_email profile", …}
access_token: "vVI2xZGn7Xefdr3GSiamwYlKbKS0qbzW5puCgQopyV8AAAF1GC47PA"
expires_in: 7199
refresh_token: "nm9t-rQiwRrr4OcD2BDCQm6aiNXyJAow35yvGwopyV8AAAF1GC47Og"
refresh_token_expires_in: 5183999
scope: "account_email profile"
token_type: "bearer"
__proto__: Object
  */