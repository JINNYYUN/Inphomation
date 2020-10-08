<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인포메이션 : 지도로 보기</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">

<style>
	.root{
		width : 100%;
		height: 100vh;
	}
	
	.map-container{
		display: flex;
	    min-width: 1280px;
	    height: calc(100% - 134px);
	    position: relative;
	}

	<!--  -->
	.map-info-wrapper{
		position: relative;
		flex: 0 0 auto;
	    width: 512px;
	    height: 100vh;
	    border-right: 1px solid rgb(205, 205, 205);
	    overflow: hidden;
	}
	
	.map-info-nav{
		padding : 25px 20px;
		border-bottom: 1px solid rgb(225, 225, 225);
	}
	
	.map{
		position: relative;
		width : 100%;
		height:100vh;
	}
	
</style>
</head>

<body>
	<div class="root">
		<div class="map-container">
			<div class="map-info-wrapper">
				<nav class="map-info-nav">
					<h3 class="text text-weight-regular">이 지역 사진 보기</h3>
				</nav>
			</div>
			<div id="map" class="map"></div>
		</div>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4c98224a9eaf1ce4016decd3afe2f45&libraries=clusterer"></script>
	<script>
		var container = document.getElementById('map'); // 지도를 표시할 div 
		var options = {
			center: new kakao.maps.LatLng(37.504801,127.025369), // 지도의 중심좌표
			level: 3 //지도의 확대 레벨
		};
		
		//지도생성
		var map = new kakao.maps.Map(container, options);
		
		// 마커 클러스터러를 생성합니다 
	    var clusterer = new kakao.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 1 // 클러스터 할 최소 지도 레벨 
	    });
		
	    $(document).ready(function() {
	    	
	    	console.log("페이지 로딩");
	    	
	    	$.ajax({
				url:"getMapLocation",
				type:"get",
				success:function( data ){
					console.log(data);
					
					var markers = $(data).map(function(i, position) {
						return new kakao.maps.Marker({
			                position : new kakao.maps.LatLng(position.latitude, position.longitude)
			            });
					});

					// 클러스터러에 마커들 추가
			        clusterer.addMarkers(markers);
					
				},
				error:function(){
					alert("error");
				}			
			});
	    });
	    
		// 지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 이벤트 발생 
	    kakao.maps.event.addListener(map, 'tilesloaded', function() {
	        // 지도 영역정보를 얻어옵니다 
	        var bounds = map.getBounds();
	    	
	        console.log(bounds);
	        
	        
	        getMapInfo(bounds);
	        /*
	        setTimeout(function () {
	        	 getMapInfo(bounds);
	        }, 3000);
	        */
	    });
		
		
		 
		 function getMapInfo(bounds) {
						 
			 $.ajax({
					url:"getMapInfo",
					type:"post",
					async : false,
					/* contentType: 'application/json', */
					data : { "mapInfo" : bounds.toString()},
					success:function( data ){
						console.log(data);
					},
					error:function(){
						alert("error");
					}			
				});
		 }

	</script>
</body>
</html>