<%@page import="bit.com.inpho.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인포메이션 : 지도로 보기</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/navi.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/map/map.css">

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://kit.fontawesome.com/6ac784f4b9.js" crossorigin="anonymous"></script>
</head>

<body>
<%
	MemberDto member = null;
	member = (MemberDto)session.getAttribute("login");
%>
<nav class="navbar navbar-default">
  <div class="container">
  	<div class="moveSite">
  		<div class="logo-wrapper">
			<img src="${pageContext.request.contextPath}/img/Inphomation-logo.svg" alt="인포메이션 로고입니다" class="inphomation-logo" onclick="location.href='../main'"/>
  		</div>
  		<div class="nav-left-wrapper">
	  		<a class="gosite" onclick="goMap();">지도로 보기</a>
	  		<div></div>
	  		<a class="gosite" onclick="goHotFeed();">이달의 사진</a>
  		</div>
  	</div>
    <div class="menu">
      
    </div>
	<div id="modal-container"></div>
    <div class="user-content">
	    <div class="nav-search-box">
	        <input type="text" name="searchKeyword" id="navi-search-keyword" placeholder="위치·카메라를 검색해보세요" />
	        <div onclick="searchKeyword('navi')">
		        <svg width="23" height="23" viewBox="0 0 18 18" class="nav-search-icon" id="nav-search-icon">
					<g fill="none" fill-rule="evenodd">
						<circle cx="7.5" cy="7.5" r="6.5"></circle>
						<path d="M12 12l5 5"></path>
					</g>
				</svg>
			</div>
	      </div>
      <!-- Guest -->
     <%if(member==null){%>
      <div class="guestMode">
      	<a href="javascript:goLogin()" class="body1 nav-login-text"> 
  			회원가입 <span>·</span> 로그인
      	</a>
      </div>
      <%}else if(member!=null && member.getAuth()==0){ %>
      <!-- user login -->
      <!-- admin login -->
      <div class="loginMode">
	      <ol>
	      	<li>
	      		<div class="text">
		      		<i class="far fa-comment-dots nav-chat-icon" onclick="goMsg()"></i>
		      		<i class="fas fa-circle"></i>
	      		</div>
	      	</li>
	      	<li><div class="text nav-gowrite" onclick="goWrite();">글쓰기</div></li>
	      	<li>
	      		<%if(member.getProfile_image()==null||member.getProfile_image().equals("default")){ %>
		        	<img src="https://ssl.pstatic.net/static/pwe/address/img_profile.png" alt="UserProfileImage" id="drop-btn" /><!-- 이미지로 나중에 변경할 예정 -->
		        <%}else{ %>
		        	<img src="<%=member.getProfile_image() %>" alt="UserProfileImage" id="drop-btn">
		        <%} %>
	      	</li>
	      </ol>
          
          <!-- DropBox만들기 -->
	      <div class="dropbox" id="drop-menu">
	      	<h3><%=member.getUser_nickname() %></h3><!-- 로그인 백엔드 구현하고 정보 받아오면 수정하기 -->
	      	<ul>
				<li class="text body1 text-weight-medium"><a href="<%=request.getContextPath() %>/mypage?user_seq=<%=member.getUser_seq()%>">내 프로필</a></li>
	      		<li class="text body1 text-weight-medium"><a href="<%=request.getContextPath() %>/mypageedit">개인정보수정</a></li>
	      		<li class="text body1 text-weight-medium"><a href="javascript:doLogout();">로그아웃</a></li>	
			</ul>
	      	<input type="hidden" value="<%=member.getUser_email()%>" id="userEmail">
	      </div>      
      </div>
	<%} %>
    </div>
  </div>
</nav>
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
			<div id="map" class="main-map" style="width:100%;"></div>
		</div>
	</div>
	<script src="<%=request.getContextPath() %>/js/navigation.js" ></script>
	<%if(member==null){ %>
	<script src="<%=request.getContextPath() %>/js/member.js" ></script>
	<%}else{ %>
	<script src="<%=request.getContextPath() %>/js/login.js" ></script>
	<%} %>
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
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