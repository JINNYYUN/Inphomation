	/*
		지도맵으로 링크
	*/
	function goMap(){
		//지명씨 필요한 정보
		location.href= 'http://'+location.host+"/Inphomation/map"
	}

	/*
		Follow Look Feed
	*/
	function goFollow(){
		//친구글 보는페이지..어...근데....없...네? 이게...아니었...나?대화하기였...나?
		location.href='http://'+location.host+"/Inphomation/main#"
	}
	
	/*
		글쓰기로 이동
	*/
	function goWrite(){
		//성보형한테 토스 필요한 정보... 이거일단 적어놓기만한거임. POST로 보낼지 그런거 확인한기
		location.href= 'http://'+location.host+"/Inphomation/write"
	}
	
	/*
		검색function
	*/
	function searchKeyword(){
		//1.get으로 보내기
		keywordInput = document.getElementById('search-keyword')
		let keyword = keywordInput.value.trim()
		if(keyword==''){
			//공백인 경우
			keywordInput.value=''
			keywordInput.focus()
		}else{
			location.href= 'http://'+location.host+"/Inphomation/keywordSearch?keyworld="+keyword
		}
	}
	
	/*
		dropBox의 활성화 비활성화를 위한 function
	*/
	var dropBtn = document.getElementById('drop-btn')
	var dropDownMenu = document.getElementById('drop-menu')
	dropBtn.addEventListener('click',function(event){
		if(this.active){
			dropDownMenu.classList.remove('active')
		}else{
			dropDownMenu.classList.add('active')
			}
		this.active = !this.active
	})
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
				modal.innerHTML=data
				$('#myModal').modal();
				$('.modal-backdrop').css('z-index',2)
			},
			error:function(){
				alert('삐뽀삐뽀')
			}
		})
	}
	//헤더가 없는상황일때 로그인클릭
	function goImgLogin(){
		$('.navbar').css('display','block')
		goLogin()
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