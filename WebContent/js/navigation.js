//지도맵으로 링크
function goMap(){
	location.href= 'http://'+location.host+"/map"
}

/* Follow Look Feed */
function goFollow(){
	//친구글 보는페이지..어...근데....없...네? 이게...아니었...나?대화하기였...나?
	location.href='http://'+location.host+"/main#"
}

/* 검색function */
function searchKeyword(page){
	//1.get으로 보내기
	let keywordInput=''
	if(page=='navi'){
		keywordInput = document.getElementById('navi-search-keyword')
	}else{
		keywordInput = document.getElementById('main-search-keyword')		
	}
	let keyword = keywordInput.value.trim()
	if(keyword==''){
		//공백인 경우
		keywordInput.value=''
		keywordInput.focus()
	}else{
		location.href= 'http://'+location.host+"/keywordSearch?keywordId="+keyword
	}
}


// WEBSOCKET 설정 ========================================
	var ws;
		
	function connect() {

		//웹소켓 객체 생성하는 부분
		//핸들러 등록(연결 생성, 메시지 수신, 연결 종료)

		//url 연결할 서버의 경로
		ws = new WebSocket('ws://192.168.0.201:8090/echo.do/websocket');	

		ws.onopen = function() {
			console.log('연결 생성');
			//alert('연결 생성');
			register();
		};
				
		ws.onmessage = function(e) {
			console.log('메시지 받음');
			var data = e.data;
			addMsg(data);
		};
		ws.onclose = function() {
			//console.log('연결 끊김');
			//alert('연결 끊김');
		};
	}

	function register() { //메시지 수신을 위한 서버에 id 등록하기
		var myemail = document.getElementById("userEmail").value;
		
		var msg = {
			type : "register", //메시지 구분하는 구분자 - 상대방 아이디와 메시지 포함해서 보냄
			userid : myemail
		};
		ws.send(JSON.stringify(msg));
	}
	// 메시지 수신 시 알림 표시
	function addMsg(data){
		$('.fa-circle').css('opacity','100');
	}
