<%@page import="bit.com.inpho.dto.LocationDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/map/detailMap.css"> 
<style>

.detail-map-message{
	margin-bottom : 20px
}

.detailMap-container .grid {
  display: grid;
  max-width: 1600px;
  width: 90%;
  min-width: 770px;
  min-height: 400px;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  grid-auto-rows: 20px;
  grid-gap: 5px;
}

.detailMap-container .grid .item {
  width: 100%;
  overflow: hidden;
  position: relative;
}

.detailMap-container .grid .item>img {
  width: 100%;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  z-index: 1;
}

.detailMap-container .grid .item>img:hover {
	
}

.grid>.item:hover .bottom-icon-bar {
	display : block;
}

.grid>.item .bottom-icon-bar {
	width: 100%;
	height: 100%;
	top: 0px;
	left: 0px;
	display: none;
	position: absolute;
	background-color: black;
	opacity: 0.6;
	z-index: 2;
}

.grid>.item .map-detail-icon-wrapper{
	display : none;
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0px;
	left: 0px;
	z-index: 5;
}

.grid>.item:hover .map-detail-icon-wrapper{
	display : flex;
	justify-content : center;
  	align-items: center;
}

.grid>.item .map-detail-icon-wrapper div{
	display : flex;
	align-items: center;
	font-size : 20px;
	color : white;
}

.map-detail-icon:nth-child(1){
	margin-right : 5px;
}

.map-detail-icon i{
	padding-right : 3px;
	font-size : 22px;
	color : white;
}

.map-detail-icon:nth-child(2) i{
	padding-right : 5px;
}

.map-detail-icon p{
	padding-right : 3px;
}



</style>

<div class="detailMap-root">
	<div class="detailMap-container">
		<div id="map" class="detail-map" style="width:100%;height:400px;"></div>
	</div>


	<div class = "container detailMap-container">
		<div class="text h3 text-color-gray100 text-weight-regular detail-map-message">
			<b class="text text-color-orange text-weight-bold">${postLocationInfo.post_position_name}</b> 주변 사진입니다
	    </div> 
	   
		<div class="grid">
			<c:forEach items="${detailMapPostList }" var="post" varStatus="i">
				<div class="item" onclick="location.href='../detail?post_seq=${post.post_seq}'">
					<img src="https://storage.googleapis.com/boomkit/${post.post_filepath }">
			        <div class="bottom-icon-bar icon-absoulte"></div>
			        <div class="map-detail-icon-wrapper">
			        	<div >
				            <div class="map-detail-icon">
				            	<i class="fas fa-heart"></i><p class="text text-weight-regular">${post.count_like }</p>
				            </div>
				            <div class="map-detail-icon">
				            	<i class="fas fa-bookmark"></i><p class="text text-weight-regular">${post.count_book }</p>
				            </div>
			            </div>
		            </div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>


<!-- kakao map -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4c98224a9eaf1ce4016decd3afe2f45&libraries=clusterer,services"></script>
<script>

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
	
	/**/
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${postLocationInfo.latitude},${postLocationInfo.longitude}), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	/*마커생성*/
	var imageSrc = '${pageContext.request.contextPath}/img/map/detail-map-marker.svg', // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(37, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	      
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	    markerPosition = new kakao.maps.LatLng(${postLocationInfo.latitude},${postLocationInfo.longitude}); // 마커가 표시될 위치입니다

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition, 
	    image: markerImage // 마커이미지 설정 
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);  
	
	/*주변 범위 설정*/
	// 지도에 표시할 원을 생성합니다
	var circle = new kakao.maps.Circle({
	    center : new kakao.maps.LatLng(${postLocationInfo.latitude},${postLocationInfo.longitude}),  // 원의 중심좌표 입니다 
	    radius: 420, // 미터 단위의 원의 반지름입니다 
	    strokeWeight: 1, // 선의 두께입니다 
	    strokeColor: '#F27405', // 선의 색깔입니다
	    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid', // 선의 스타일 입니다
	    fillColor: '#F27405', // 채우기 색깔입니다
	    fillOpacity: 0.1  // 채우기 불투명도 입니다   
	}); 

	// 지도에 원을 표시합니다 
	circle.setMap(map); 
</script>

<script>

</script>
