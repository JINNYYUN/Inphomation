<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인포메이션 : 지도로 보기</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
	.map{
	
	}
</style>
</head>

<body>
	<div id="map" class="map" style="width:100%;height:100vh;"></div>
	
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

					// 클러스터러에 마커들을 추가한다.
			        clusterer.addMarkers(markers);
					
				},
				error:function(){
					alert("error");
				}			
			});
	    });

	</script>
</body>
</html>