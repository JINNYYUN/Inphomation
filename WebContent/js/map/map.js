		
		
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
	        var bounds = map.getBounds();
	    	
	        console.log(bounds);
	        
	        getMapInfo(bounds);
	    });

		 /*
			현재 지도에 보여지고 있는 위치에 대한 사진 정보를 가져온다.
		 */
		 function getMapInfo(bounds) {
						 
			 $.ajax({
					url:"getMapInfo",
					type:"post",
					async : false,
					/* contentType: 'application/json', */
					data : { "mapInfo" : bounds.toString()},
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
													<span class="badge badge-neutral">${'${val.camera_serial}'}</span>
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