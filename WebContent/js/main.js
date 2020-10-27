/**
 * 
 */

function SetGridItemHeight() {
	let grid = document.getElementsByClassName('grid')[0];
	let rowHeight = parseInt(window.getComputedStyle(grid).getPropertyValue('grid-auto-rows'));
	let rowGap = parseInt(window.getComputedStyle(grid).getPropertyValue('grid-row-gap'));

	let item = grid.getElementsByClassName('item');
	for (let i = 0; i < item.length; ++i) {
		let a = Math.floor((item[i].children[0].offsetHeight) / 25)
		//item[i].style.gridRowEnd = `span ${Math.floor((item[i].children[0].offsetHeight) / 25)}`
		item[i].style.gridRowEnd = `span ` + a
	}
}

window.addEventListener("load", SetGridItemHeight);
window.addEventListener("resize", SetGridItemHeight);

function movePage(seq) {
	location.href = "http://"+location.host+"/detail?post_seq="+seq
}

//우측 하단의 상단방향 화살표를 클릭시 실행되는 함수로 최상단페이지로 올려주는 역할 
$('#screen-up').click(function () {
	window.scrollTo({
		top: 0,
		left: 0
	})
})


//좋아요 클릭시
function clickLike(e, seq) {
	changeMark(e, 'like', seq)
}
//북마크 클릭시
function clickBookMark(e, seq) {
	changeMark(e, 'book', seq)
}


//좋아요와 북마크를 클릭했을시 숫자를 증감시키는 역할과 비동기를 통해서 DB에 추가 삭제작업함
function calculNumber(e, b, cate, seq) {
	let number = Number(e.innerText)
	let url=''
	var data=""
	if(cate=='like'){
		url= "./addLike"
		if(b){
			data={
				post_seq:seq,
				dolike:true
			}
		}else{
			data={
				post_seq:seq,
				dolike:false
			}
		}
	}else{
		url= './addBookmark'
		if(b){
			data={
				post_seq:seq,
				dobook:true
			}
		}else{
			data={
				post_seq:seq,
				dobook:false
			}
		}
	}
	
	//비동기로 DB에 갈때 필요한것 post_seq, true/ false
	if (b) { 
		//db에서 삭제해야하는 부분
		e.innerText = " " + --number+" "
		$.ajax({
			url: url,
			type: "post",
			data: data,
			async:false,
			success: function () {},
			error: function () {}
		})
	} else { 
		//db에 추가
		e.innerText = " "+ ++number+" "
		$.ajax({
			url: url,
			type: "post",
			data: data,
			async:false,
			success: function () {},
			error: function () {}
		})
	}

}
//안이 차있으면 비워진 마크를 띄우고 비워져있으면 차있는 마크를 띄운다
function changeMark(e, cate, seq) {
	//fas == 안이 차있다 far==안이 비어있다
	//true false로 반환받음
	if (e.classList.contains('fas')) {
		//이미 누른거기때문에 비워야한다
		e.classList.remove('fas')
		e.classList.remove('text')
		e.classList.add('far')
		calculNumber(e, true, cate, seq)
	} else {
		//안누른거기 때문에 채워야한다
		e.classList.add('fas')
		e.classList.add('text')
		e.classList.remove('far')
		calculNumber(e, false, cate, seq)
	}
}

//메인의 searchBar
/*
function searchKeywordMain() {
	//1.get으로 보내기
	keywordInput = document.getElementById('main-search-keyword')
	let keyword = keywordInput.value.trim()
	if (keyword == '') {
		//공백인 경우
		keywordInput.value = ''
		keywordInput.focus()
	} else {
		location.href = 'http://' + location.host + "/keywordSearch?keyworld=" + keyword
	}
}
*/
function moveUserPage(e){
	location.href = 'http://' + location.host + "/mypage?user_seq="+e
}

 /*
메인페이지에서 헤더의 인터렉트를 구현하는 함수 300의 고정값을 준 이유는 
현재 메인페이지의 상단에서의 이미지의 크기를 400px로 고정을 해놨기 때문
*/
var getMoreFeed = 0
function mainScrollEvent(choice){
	$(window).scroll(function (e) {
		var window = $(this).scrollTop()
		
		// if (400 >= window) {
		// 	$('.navbar .container .menu .search-bar').css('display', 'none')
		// }else {
		// 	$('.navbar .container .menu .search-bar').css('display', 'block')
		// }
		
		//우측 하단의 상단방향 화살표가 400px이상 내려가면 화살표가 보이고 이하로 내려가면 안보이게 하는 역할 
		if(400 >= window){
			$('#screen-up').css('display','none')
		}else{
			$('#screen-up').css('display','block')	
		}
		
		var scrollHeight = $(document).height();
		var scrollPosition = $(this).height() + window -500;		
	
		if (scrollHeight <= scrollPosition) {
			getMoreFeed++
			$.ajax({
				url:'/newMoreFeed',
				type:'GET',
				async:false,
				data:{
					moreFeedNum:getMoreFeed
				},success:function(data){
						if(data){
							if(choice){
								addPostNoLogin(data)
							}else{
								addPostLogin(data)
							}
					} 
				}
			})
		} 
	})
}
//검색페이지 스크롤
function searchScrollEvent(choice, keywordId){
	$(window).scroll(function (e) {
		var window = $(this).scrollTop()
		
		// if (400 >= window) {
		// 	$('.navbar .container .menu .search-bar').css('display', 'none')
		// }else {
		// 	$('.navbar .container .menu .search-bar').css('display', 'block')
		// }
		
		//우측 하단의 상단방향 화살표가 400px이상 내려가면 화살표가 보이고 이하로 내려가면 안보이게 하는 역할 
		if(400 >= window){
			$('#screen-up').css('display','none')
		}else{
			$('#screen-up').css('display','block')	
		}
		
		var scrollHeight = $(document).height();
		var scrollPosition = $(this).height() + window -500;		
		
		if (scrollHeight <= scrollPosition) {
			getMoreFeed++
			$.ajax({
				url:'/searchMoreFeed',
				type:'GET',
				async:false,
				data:{
					moreFeedNum:getMoreFeed,
					keywordId:keywordId
				},success:function(data){
					if(data){
						if(choice){
							addPostNoLogin(data)
						}else{
							addPostLogin(data)
						}
					} 
				}
			})
		} 
	})
}

function addPostLogin(item){
	$.each(item,function(key,value){
		let str = '<div class="item">'
			+ '<img onclick="movePage('+value.postSeq+')" src="https://storage.googleapis.com/boomkit/'+value.filePath+'">'
			+ '<div class="bottom-icon-bar icon-absoulte">'
			+ 	'<h4 onclick="moveUserPage('+value.userSeq+');">'+value.userNickName+'</h4>'
			if(value.postLike == 1){
				str +=	'<h4><i class="fas fa-heart" onclick="clickLike(this,'+value.postSeq+');">'+value.postLike+'</i></h4>'
			}else{
				str +=	'<h4><i class="far fa-heart" onclick="clickLike(this,'+value.postSeq+');">'+value.postLike+'</i></h4>'
			}
			if(value.userBookMark ==1){
				str +=	'<h4><i class="fas fa-star" onclick="clickBookMark(this,'+value.postSeq+');">'+value.postBookmark+'</i></h4>'
			}else{
				str +=	'<h4><i class="far fa-star" onclick="clickBookMark(this,'+value.postSeq+');">'+value.postBookmark+'</i></h4>'
			}
			str += '</div></div>'
			$('.main-container .content .grid').append(str)
	})
	SetGridItemHeight()
}


function addPostNoLogin(item){
	$.each(item,function(key,value){
		let str = '<div class="item">'
			+ '<img onclick="movePage('+value.postSeq+')" src="https://storage.googleapis.com/boomkit/'+value.filePath+'">'
			+ '<div class="bottom-icon-bar icon-absoulte">'
			+ 	'<h4 onclick="moveUserPage('+value.userSeq+');">'+value.userNickName+'</h4>'
			+		'<h4><i class="far fa-heart" onclick="goLogin();">'+value.postLike+'</i></h4>'
			+		'<h4><i class="far fa-star" onclick="goLogin();">'+value.postBookmark+'</i></h4>'
			+ '</div></div>'
			$('.main-container .content .grid').append(str)
	})
	SetGridItemHeight()
}
