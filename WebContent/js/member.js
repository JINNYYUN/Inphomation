

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
			console.log(result)
			if(result=='success'){
				//로그인성공
				window.location.reload()
			}else if(result=='fail'){
				//실패알람 html에 실패알람 넣기
				console.log('fail')
			}else{
				location.href='http://'+location.host+'/Inphomation/noHaveAuth'
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
	
	let pw=$("#regi-pw")
	if(!isPassword(pw.val())){
		return pw.focus()
	}
	let name=$('#regi-nickname')
	if(name.val().trim()==''){
		return name.focus()
	}
	
	$.ajax({
		url:"register",
		type:"post",
		data:{
			user_email:id.val().trim(),
			user_password:pw.val().trim(),
			user_nickname:name.val().trim(),
			provider:"homepage"
		},
		success:function(data){
			console.log(data)
			//회원가입 성공
			if(data){
				alert('regiSuccess')
				location.href='http://'+location.host+'/Inphomation/noHaveAuth'
			}else{
				alert('fail')
			}
		},
		error:function(){
			//회원가입 실패 알람 html 출력
			alert('exception')
		}
	})
}
//아이디 중복 확인

function confirmId(e){
	let inputId =  document.getElementById('regi-id')
	let result = isEmail(inputId.value.trim())
	if (result){
		$.ajax({
			url:"confirmId",
			type:"post",
			data:{
				user_email:inputId.value.trim()
			},
			success:function(data){
				console.log('confirmid:'+data)
				if(data){
					console.log('안중복')
					document.getElementById('regeister-btn').disabled = false
					$('.form-group .result-msg').text('이미 가입된 이메일 입니다')
				}else{
					console.log('중복')
					document.getElementById('regeister-btn').disabled = true
				} 
			},error:function(){
				alert('exception')
			}
		})
	}else{
		$('.form-group .result-msg').text('아이디를 정상적으로 입력해 주세요')
	}
}
//패스워드확인
function isPassword(asValue) {
	var regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/
	return regExp.test(asValue) // 8~16글자 정규식 형식맞으면 true
}
//이메일 정규식
function isEmail(asValue) {
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
	return regExp.test(asValue) // email정규식 맞으면 true
}
//kakao 로그인 처리
function loginWithKakao() {
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
	        	/*data:{
	        		user_email:obj.id,
	        		user_nickname:obj.properties.nickname,
	        		profile_image:obj.properties.profile_image,
	        		provider:"Kakao"
	        	},*/
	        	data:makeKakaoData(obj),
	        	success:function(data){
	        		if(data){
	        			window.location.reload()
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

        //실패
      }
    })
  }
 function makeKakaoData(obj){
 	if(!obj.properties.profile_image){
	 	console.log('empty')
	 	let data = {
	 		user_email:obj.id,
			user_nickname:obj.properties.nickname,
			provider:"Kakao"
	 	}
	 	console.log('empty ho')
 		return data
 	}else{
 		let data = {
	 		user_email:obj.id,
			user_nickname:obj.properties.nickname,
			provider:"Kakao"
	 	}
	 	return data
 	}
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
	로그인버튼 클릭시에 Modal html을 가져오는 역할을 함
*/
var modal = document.getElementById('modal-container')
function goLogin(){
	//1. login 에서 container 가져와야함.
	//2. modal #modal-container 에 html 넣어야함
	// ajax구현하기
	$.ajax({
		url:"loginModal",
		type:'GET',
		dataType:'html',
		success:function(data){
			document.getElementById('modal-container').innerHTML=data
			$('#myModal').modal('show');
			$('.modal-backdrop').css('z-index',2)
		},
		error:function(){
			alert('삐뽀삐뽀')
		}
	})
}
/*
	로그인 모달에서 상단의 회원가입과 로그인을 서로 클릭하였을 경우에
	서로간에  css를 변경하기 위한 function
*/
function changeClass(e){
	let modalLoginBtn = document.getElementById('modal-login-btn')
	let modalRegiBtn = document.getElementById('modal-regeister-btn')
	
	if(e===modalLoginBtn){
		//모달에서 로그인을 클릭했을 경우
		modalLoginBtn.classList.remove('select-no')
		modalLoginBtn.classList.add('select')
		modalRegiBtn.classList.remove('select')
		modalRegiBtn.classList.add('select-no')
		changeModal(e)
	}else{
		//모달에서 회원가입을 클릭했을 경우
		modalRegiBtn.classList.remove('select-no')
		modalRegiBtn.classList.add('select')
		modalLoginBtn.classList.remove('select')
		modalLoginBtn.classList.add('select-no')
		changeModal(e)
	}
}

//비밀번호 보이고 숨기기
function lookPw(e){
	$('.form-group .user-pwd').toggleClass('active'); 
	if( $('.form-group .user-pwd').hasClass('active') == true ){ 
		$(e).parents('.form-group').find('.user-pwd').attr('type',"text") 
	} else{ 
		$(e).parents('.form-group').find('.user-pwd').attr('type',"password") 
	}
}

/*
	Modal의 버튼이 어떤 버튼인지 구분하고 그에따른 form파일을 가져오기 위한
	function 하단의 modalAjax function역시 그에따른 기능이다.
*/
function changeModal(e){
	if(e===document.getElementById('modal-login-btn')){
		//로그인버튼을 클릭할 경우
		modalAjax('loginForm')
	}else{
		//회원가입을 클릭한 경우
		modalAjax('regiForm')
	}
}

function modalAjax(url){
	let modalbody = document.getElementById('body-container')
	$.ajax({
		url:url,
		type:'GET',
		dataType:'html',
		success:function(data){
			modalbody.innerHTML=data
		},
		error:function(){
			alert('삐뽀삐뽀')
		}
	})
}
function  modalClose(){
	$('#myModal').modal('hide');
}