/*
	지도맵으로 링크
*/
function goMap(){
	//지명씨 필요한 정보
	location.href= 'http://'+location.host+"/Inphomation/map"
}

/* Follow Look Feed */
function goFollow(){
	//친구글 보는페이지..어...근데....없...네? 이게...아니었...나?대화하기였...나?
	location.href='http://'+location.host+"/Inphomation/main#"
}


/* 검색function */
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
	


	



	
	
