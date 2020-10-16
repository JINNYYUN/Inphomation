<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인포메이션 : 지도로 보기</title>


<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script src="https://kit.fontawesome.com/6ac784f4b9.js" crossorigin="anonymous"></script>

<style>
	.root{
		width : 100%;
		height: 100vh;
	}
	
	.map-container{
		display: flex;
	    min-width: 1280px;
	    height: 100vh;
	    /*height: calc(100% - 134px);*/
	    position: relative;
	}

	.map{
		position: relative;
		width : 100%;
		height:100vh;
	}
	
	<!--  -->
	.map-info-wrapper{
		position: relative;
		flex: 0 0 auto;
	    width: 512px;
	    height: 100vh;
	    border-right: 1px solid rgb(205, 205, 205);
	}
	
	.map-info-nav{
		position: relative;
		padding : 30px 30px;
		display : flex;
		border-bottom: 1px solid rgb(225, 225, 225);
	}
	
	.map-card-wrapper{
		height: calc(100vh - 82.5px);
		overflow:scroll;
		padding : 0 30px;
	}
	
	.map-card-box{
		cursor: pointer;
		border : 1px solid rgb(225, 225, 225);
		border-radius: 3px;
		position: relative;
		padding : 10px;
		margin-bottom : 20px;
		overflow: hidden;
	}
	
	.map-card-image-wrapper{
		position: relative;
		cursor: pointer;
		overflow: hidden;
		width : 100%;
   		backface-visibility: hidden;
	}
	
	.map-info-image{
		width : 100%;
		transform: scale(1);
		 -webkit-transform: scale(1);
		 -moz-transform: scale(1);
		 -ms-transform: scale(1);
		 -o-transform: scale(1);
		 transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
	}
	
	.map-info-image:hover{
		transform: scale(1.1);
		-webkit-transform: scale(1.1);
		-moz-transform: scale(1.1);
		-ms-transform: scale(1.1);
		-o-transform: scale(1.1);
	}
	
	.map-card-content-wrapper{
		padding-top : 10px;
	}
	
	.map-card-content-wrapper h4{
		margin-top : 0.05em;
		margin-bottom : 0.3em;
	}
	
	.map-card-box p{
		width: 100%;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		
		white-space: normal;
		max-height : 3em;
		text-align: left;
		word-wrap: break-word;
		display: -webkit-box;
		-webkit-line-clamp: 2;
		-webkit-box-orient: vertical;
	}
	
	.nocard-alert-wrapper{
		
	}
	
	.alert-primary{
		color: #CC3B49;
		background-color: #FFF3F4;
		border-color: #FA5F6E;
	}
	
	.nocard-alert-message{
		display: flex;
		align-items: center;
		justify-content: space-between;
		padding: 12px 12px;
	}
	
	.nocard-alert-message .close{
		color: #CC3B49;
		font-size: inherit;
	}
	
	.nocard-alert-message span{
		margin-left: 5px;
	}
	
	.map-search{
		width: 100%;
	    height: 100%;
	    color: rgb(34, 34, 34);
	    font-size: 25px;
	    border: none;
	    background-color: transparent;
	    outline: none;
	}
	
	.map-search-icon{
		position: relative;
		
	}
	
	.map-result-wrapper{
		margin : 25px 0;
		display : flex;
		align-items: center;
    	justify-content: space-between;
	}
	
	/*sorting*/
	.map-dropdown-menu{
		min-width : 0;
	}
	
	.map-sorting-wrap{
	    display: flex;
    	align-items: center;
    	cursor : pointer;
	}
	
	.map-sorting{
		margin-right : 5px;
	}
	
	.map-sorting-list{
		
	}
	
	.map-dropdown-menu li{
		cursor : pointer;
	}
	
	.map-camera-info:hover{
		color: white;
   	 	background: #F27405;
	}
</style>
</head>

<body>
	<div class="root">
		<div class="map-container">
			<div class="map-info-wrapper">
				<nav class="map-info-nav">
					<input placeholder="신논현역" autocomplete="off" type="text" name="keyword" class="map-search" id="map-search-input">
					<svg width="30" height="30" viewBox="0 0 18 18" class="map-search-icon" id="map-search-icon">
						<g fill="none" fill-rule="evenodd" stroke="#222">
							<circle cx="7.5" cy="7.5" r="6.5"></circle>
							<path d="M12 12l5 5"></path>
						</g>
					</svg>
				</nav>
				<div class="map-card-wrapper">
					<div class = "map-result-wrapper" id="map-result-wrapper">
						<div id = "map-result-message"></div>
						<div class="dropdown">
	                        <div class="map-sorting-wrap" data-toggle="dropdown">
	                            <div id="map-sorting" class="text text-color-gray200 map-sorting">인기순</div>
	                            <i for="map-sorting" class="fas fa-caret-down map-sorting-button"></i>
	                        </div>
	                        <ul class="dropdown-menu dropdown-menu-right map-dropdown-menu" aria-labelledby="dropdownMenuButton">
	                            <li class="dropdown-item map-sorting-list">인기순</li>
	                            <li class="dropdown-item map-sorting-list">최신순</li>
	                        </ul>
	                    </div>
					</div>
					
				</div>
			</div>
			<div id="map" class="map"></div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
	<!-- kakao map -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4c98224a9eaf1ce4016decd3afe2f45&libraries=clusterer,services"></script>
	
	
	<!-- 지도 불러오기 -->
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
				type:"post",
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
	        var mapInfo = map.getBounds();
	    	
	        //정렬 순서의 정보를 가져온다
	        let sortingOption = $("#map-sorting").text();
	        	
	        //console.log(bounds);
	        getMapInfo(mapInfo, sortingOption);
	    });
		
	    /* 정도 가져오기 셀렉트 박스 옵션 선택 */
		$(".map-sorting-list").on("click", function () {
		  	let sortingOption = $(this).html();
		    console.log("셀렉트 바 확인 : " + sortingOption);
		    $("#map-sorting").html(sortingOption);
		    $("#consultation-state-ul").toggle();
		    
			 // 지도 영역정보를 얻어옵니다 
	        var mapInfo = map.getBounds();
		    getMapInfo(mapInfo, sortingOption);
		})

		 /*
			현재 지도에 보여지고 있는 위치에 대한 사진 정보를 가져온다.
		 */
		 function getMapInfo(bounds, sortingOption) {
						 
			 $.ajax({
					url:"getMapInfo",
					type:"post",
					async : false,
					/*contentType: 'application/json',*/
					data : { "mapInfo" : bounds.toString(), "sortingOption" : sortingOption},
					success:function( data ){
						
						$(".map-card-box").remove();
						$(".map-result-message-component").remove();
						$(".nocard-alert-message").remove();
						
						if(data.length!=0){
							let result = `<div class="map-result-message-component text h4 text-color-gray100 text-weight-regular">
    										이 지역에 <b class="text text-color-orange text-weight-bold">${'${data.length}'}개</b>의 사진이 있습니다
						                   </div> `;
							$('#map-result-message').append(result);
							
							$.each(data, function(i, val){
								let content = `<div class="map-card-box" onclick="location.href='../detail.do?post_seq=${'${val.post_seq}'}'">
												<div class="map-card-image-wrapper">
													<img class="map-info-image" src="https://storage.googleapis.com/boomkit/${'${val.post_filepath}'}"}/>
												</div>
												<div class="map-card-content-wrapper">
													<span class="badge badge-neutral map-camera-info">${'${val.camera_serial}'}</span>
													<h4 class="text text-color-gray100 text-weight-medium">${'${val.post_position_name}'}</h4>
													<p class="text">${'${val.post_content}'}</p>
												</div>
											</div`;
											
								
								$(".map-card-wrapper").append(content);
								
							});
						}else{
							/*
							content = `<div class="bs-component nocard-alert-wrapper">
										<div class="alert alert-primary nocard-alert-message">
					            			<p class="text text-weight-regular">검색한 위치에 사진이 존재하지 않습니다.😭 </p>
											<button type="button" class="close" data-dismiss="alert">×</button>
										</div>
										</div>`;
							*/
							let result = `<div class="map-result-message-component text h4 text-color-gray100 text-weight-regular">
											이 지역에 <b class="text text-color-orange text-weight-bold"> 0개</b>의 사진이 있습니다😭
						                  </div>`;
			                   
							$("#map-result-message").append(result);
						}
						
					},
					error:function(){
						alert("error");
					}			
				});
		 }
		
		/*검색 버튼 클릭 시*/
		 document.getElementById('map-search-icon').addEventListener("click",function (){
			 let searchMapKeyword = getSearchKeyword();
			 searchMapLocation(searchMapKeyword);
			 
			//div 영역 스크롤 올리기
			$( '.map-card-wrapper' ).scrollTop(0);
			
		 });
		
		/*검색 창에서 enter 클릭 시*/
		document.getElementById('map-search-input').addEventListener("keypress", function (){
	        if(event.keyCode == 13){
	        	
	        	let searchMapKeyword = getSearchKeyword();
				searchMapLocation(searchMapKeyword);
				
				//div 영역 스크롤 올리기
				$( '.map-card-wrapper' ).scrollTop(0);
				
	        }
		});
		
		function getSearchKeyword(){
			//검색 키워드 가져오기
			 let searchMapKeyword = document.getElementById('map-search-input').value;
			 if(searchMapKeyword==""){
				searchMapKeyword="신논현역";
			 }
			 
			return searchMapKeyword;
		}
		
		/* 지도 내 검색 */
		function searchMapLocation(searchMapKeyword) {
			// 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places(); 
			
			// 키워드로 장소를 검색합니다
			 ps.keywordSearch(searchMapKeyword, placesSearchCB); 
	
			 // 키워드 검색 완료 시 호출되는 콜백함수 입니다
			 function placesSearchCB (data, status, pagination) {
				//alert("이 함수 호출되나 혹쉬~?");
			     if (status === kakao.maps.services.Status.OK) {
	
			         // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			         // LatLngBounds 객체에 좌표를 추가합니다
			         var bounds = new kakao.maps.LatLngBounds();
	
			         for (var i=0; i<data.length; i++) {
			             //displayMarker(data[i]);  지도에 마커를 표시하는 함수 > 지도에 클러스터를 표시하는 함수로 변경 예정
			             bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
			         }       
	
			         // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			         map.setBounds(bounds);
			     } 
			 }
		}
	</script>
</body>
</html>