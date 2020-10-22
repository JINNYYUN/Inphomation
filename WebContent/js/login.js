//로그인을 했을때만 실행함
//웹소켓 연결
connect()
checkMsg()

/*글쓰기로 이동 인자값 노필요	*/
	function goWrite(){
		location.href= 'http://'+location.host+"/post"
	}
	
/* dropBox의 활성화 비활성화를 위한 function */
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
	
	function doLogout(){
		$.ajax({
			url:"logout",
			type:"get",
			success:function(){
				alert('Do Logout')
				window.location.reload()
			},error:function(){
				alert('err')
			}
		})
	
	}
/* 안읽은 메시지 확인 */
function checkMsg(){
	$.ajax({
		url:"getUnread",
		type:"post",
		success:function(hasMsg){
			if(hasMsg){
				$('.fa-circle').css('display','inline');
			}
		},
		error:function(){
			alert('error');
		}
	});
}	
	
/* 메시지 페이지로 이동*/
function goMsg(){
	location.href="goMessage"
}