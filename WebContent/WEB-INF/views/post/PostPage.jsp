<%@page import="bit.com.inpho.dto.PostDto"%>
<%@page import="bit.com.inpho.dto.MemberDto"%>
<%@page import="bit.com.inpho.dto.MyPageMemberDto"%>
<%@page import="io.opencensus.common.ServerStatsFieldEnums.Size"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberDto login = (MemberDto) request.getSession().getAttribute("login");
	int seq = login.getUser_seq();
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>hello</title>


<style type="text/css">

.hashtag {
	    width:  100%;
		height:  100%;
	   	margin-left:  auto; 
 		margin-right :  auto;
	    padding:  5px;
	    text-align:  center;
	    line-height:  300px;
		vertical-align: middle;
}

#thumbnailImg {
	height: 566px;
	background-repeat: no-repeat;
	background-image: url("https://storage.googleapis.com/boomkit/image-not-found.jpg");
	outline : none;
	background-size : 100% 100%;
}

.postContent {
	outline: 2px dashed #92b0b3;
	outline-offset: -10px;
	text-align: center;
	transition: all .15s ease-in-out;
	width: 100%;
	background-color: F2F2F2;
	padding-top: 5%;
}

.postrow {
	display: flex;
	flex-wrap: nowrap;
	margin-right: -16px;
	margin-left: -16px;
}


/* image hover */
#photo-gallery {
	padding: 20px 0px 40px;
}

#photo-gallery .state-thumb {
	overflow: hidden;
	border-radius: 10px;
}

#photo-gallery .state-thumb img {
	width: 100%;
	transition: 0.5s;
}

#photo-gallery .photo-frame:hover img {
	transform: scale(1.3, 1.3);
}

#photo-gallery h4 {
	margin: 10px 0px 0px;
	text-align: right;
}

#photo-gallery h4 a {
	color: #9c27b0;
	font-size: 20px;
}

#photo-gallery .photo-frame {
	border: 1px solid #cecece;
	padding: 15px;
	border-radius: 10px;
	transition: 0.3s;
	background-color: #fff;
}

#photo-gallery .photo-frame:hover {
	box-shadow: 0px 0px 15px 0px #d0d0d0;
	border-color: #9c27b0;
}
#disnone{
  display: none;
}
.postCamStyle{
    color: #F25C05;
    background-color: transparent;
    background-image: none;
    border-color: #ea6213;
}
</style>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/exif-js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="js/ajaxForm/jquery.form.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAzh5ul0Fhtb8HKscRuS8zuGYD-3VKlUF4&callback=initAutocomplete&libraries=places&v=weekly"
		defer>
	</script>
	<div class="container">
		<br>
		<div id="thumbnailUrl"></div>
		<!-- Heading Row -->
		<div class="postrow align-items-center my-5">
			<form id="frm" class="frmst" method="POST" action="Upload"
				encType="multipart/form-data">
				<div class="postContent rounded mb-4 mb-lg-0" id="mylmg">

					<label for="upImgFile">이미지를 드래그 하거나 여기를 클릭하여 파일을 선택해주세요!
						(PNG, JPG,JEPG)</label> <input type="file" class="imagehide"
						id="upImgFile" name="upImgFile" accept=".jpg, .jpeg, .png"
						multiple="multiple">
					<div class="previews">
						<label class="label"></label>
					</div>
				</div>

				<section id="photo-gallery">
			
					<div class="photo-frame">
						<div class="state-thumb">
							<div id="thumbnailImg" src="#" class="photo-frame img-fluid">
								<div class="member-info">
									<div class="hashtag"></div>
								</div>

							</div>  
						</div>
					</div>
				</section>

				<!-- </form>
			<form> -->
				<div class="mr-1">
					<div class="card h-100">

						<div class="card-body">

							<div class="postwrite"></div>
							<div class="md-form">

							
							</div>
							<c:forEach var="i" items="${cam }">
								<div style="display: inline-block;">
									<input class="postCamStyle"type="button" value="${i.camera_serial }"
										onclick="camInfo(this);">
								</div>
							</c:forEach>
							<div class="md-form">
								<label class="text" for="inputLGEx">촬영장소를 알려주세요!</label> <input
									id="autocomplete" name="location" value="${location}"
									class="form-control form-control-lg">
									<span id="disnone">* 촬영장소를 입력하여주십시오 *</span>
							</div>

							<div class="md-form">
								<label class="text" for="inputLGEx">사진을 소개해 주세요!</label>
								<textarea id="conent" name="content"
									class="form-control form-control-lg">${content}</textarea>
							</div>
							<div class="md-form">
								<label class="text" for="inputLGEx">촬영기기를 알려주세요!</label> <input
									id="cam" name="camera_serial" value="${oneCamera}"
									class="form-control form-control-lg">
							</div>
							<div class="md-form">
								<label class="text" for="inputLGEx">나만의 해쉬태그를 보여주세요.</label> <input
									id="hashtag" name="hashtag" value="${hashtag}"
									class="form-control form-control-lg">
							</div>

							<div class="float-right">
								<input id="done" class="btn btn-primary btn-sm" type="button"
									value="Write">
							</div>

						</div>
					</div>
				</div>
			</form>
		</div>

	</div>
	
	<script type="text/javascript">
	
		let address = document.querySelector('#autocomplete').value;
		let exifLat;
		let exifLong;
		let input = document.querySelector('input');
		let preview = document.querySelector('.previews');
    	let autocomplete;
		let files;
		let reader;
		let fileInfo;
		let wtmY;
		let wtmX;
		let nullcheck;
    function initAutocomplete() {
        autocomplete = new google.maps.places.Autocomplete(
          document.getElementById("autocomplete"),
          { types: ["geocode"] }
        );
      };
	
	const componentForm = {
			street_number: "short_name",
			route: "long_name",
			locality: "long_name",
			administrative_area_level_1: "short_name",
			country: "long_name",
			postal_code: "short_name",
	};
	
		var latestLocaction;
		function EXIFutil() {
			EXIF.getData(files[0], function() {
				exifLong = EXIF.getTag(files[0], "GPSLongitude");
				exifLat = EXIF.getTag(files[0], "GPSLatitude");
				imgnullCheck(exifLong);
				var exifLongRef = EXIF.getTag(this, "GPSLongitudeRef");
		        var exifLatRef = EXIF.getTag(this, "GPSLatitudeRef");
				 if (exifLatRef == "S") {
			            var latitude = (exifLat[0]*-1) + (( (exifLat[1]*-60) + (exifLat[2]*-1) ) / 3600);						
			        } else {
			            var latitude = exifLat[0] + (( (exifLat[1]*60) + exifLat[2] ) / 3600);
			        }

			        if (exifLongRef == "W") {
			            var longitude = (exifLong[0]*-1) + (( (exifLong[1]*-60) + (exifLong[2]*-1) ) / 3600);						
			        } else {
			            var longitude = exifLong[0] + (( (exifLong[1]*60) + exifLong[2] ) / 3600);
			        }

			         wtmXx = latitude,
			       	 wtmYy = longitude; 
			         
			         $.ajax({
			             url:"https://maps.googleapis.com/maps/api/geocode/json?latlng="+wtmXx+","+wtmYy+"&key=AIzaSyAzh5ul0Fhtb8HKscRuS8zuGYD-3VKlUF4",
			             type:'GET',
			    		 success:function(data){
			    			 
			    			 $('#autocomplete').val(data.results[0].formatted_address);
			    	    	 },
			    		 error : function(e){
			    		     console.log(e);
			    		 }
			    			}); 
				
			});

		}

		$(".content").on("dragover", dragOver).on("dragleave", dragOver).on(
				"drop", dragFiles);
		function dragOver(e) {
			e.stopPropagation();
			e.preventDefault();
			if (e.type == "dragover") {
				$(e.target).css * ({
					"background-color" : "black",
					"outline-offset" : "-20px"

				});

			} else {
				$(e.target).css({
					"background-colr" : "gray",
					"outline-offset" : "-10px"

				});
			}
		}

		function dragFiles(e) {
   
			e.stopPropagation();
			e.preventDefault();
			dragOver(e);
			e.dataTransfer = e.originalEvent.dataTransfer;

			files = e.target.files || e.dataTransfer.files;
			addFileFromLastInput(files);
			console.log(files);
			if (files.length > 1) {
				arlert("하나만 올려");
				return;
			}
			if (files[0].type.match(/image.*/)) {
				$('#thumbnailImg').css(
						{
							"background-image" : "url("
									+ window.URL.createObjectURL(files[0])
									+ ")",
							"outline" : "none",
							"background-size" : "100% 100%"
						});
				 $.ajax({
						url : "beforeImg",
						type : "POST",
						data : new FormData($("#frm")[0]),
						enctype : 'multipart/form-data',
						processData : false,
						contentType : false,
						cache : false,
						datatype : "json",
						success : function(data) {
							$('#hashtag').val(data);
							console.log(data[0]);
							 var tags ={
								data
							} ;
							console.log(tags);
							

						},
						error : function() {

						}
					});

			} else {
				console.log("not image!");
				return;
			}
			console.log("파일 이름" + files[0].name);
			
			EXIFutil();

		}
		$(function() {
			$(".imagehide").change(
					function(e) {
						files = e.target.files || e.dataTransfer.files;
						$('#thumbnailImg').css(
								{
									"background-image" : "url("
											+ window.URL
													.createObjectURL(files[0])
											+ ")",
									"outline" : "none",
									"background-size" : "100% 100%"
								});
						EXIFutil();
						 $.ajax({
								url : "beforeImg",
								type : "POST",
								data : new FormData($("#frm")[0]),
								enctype : 'multipart/form-data',
								processData : false,
								contentType : false,
								cache : false,
								datatype : "json",
								success : function(data) {
									$('#hashtag').val(data);
									console.log(data[0]);
									 var tags ={
										data
									} ;
									console.log(tags);
									

								},
								error : function() {

								}
							});
						
					});

		});
		  $("#done").on("click",function(e){
			  var locat = document.querySelector('#autocomplete').value;
			 e.preventDefault();
			  $.ajax({
			         url:'https://dapi.kakao.com/v2/local/search/address.json?query='+encodeURIComponent(locat),
			         type:'GET',
			         headers: {'Authorization' : 'KakaoAK f0e07a82a957e4d2580b19df431ebeb3'},
					 success:function(result){
						 console.log(result);
						 nullcheck = loadNameNullCheck(result.documents[0].road_address);
						 upLoadNullCheck(result.documents[0]);
						 
				    	 },
					 error : function(e){
					     alert("error");
					 }
						});
		  });
		function upLoadNullCheck(str){

			if(str==null || str==undefined || str=="null"){
				alert('정확한주소를 입력해주세요');
			}else{
				wtmX=str.x;
				wtmY=str.y;
				console.log("첫번째"+str.x);
	    		console.log(str.y);
	    		
	    		 var onecam = $('#cam').value;
				 var formm = new FormData($("#frm")[0]);
				 if(nullcheck===false){
				 road=str.road_address.building_name;
				 formm.append("roadname",road);
				 }
				 formm.append("exifLat", wtmX);
				 formm.append("exifLong", wtmY);
				 formm.append("onecam",onecam);
				 formm.append("upImgFile", files[0]);
				 console.log(files[0]);
	 $.ajax({
			url : "Upload",
			/* async: false, */
			type : "POST",
			data : formm,
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			cache : false,
			datatype : "json",
			success : function(data) {	
			 	
				  window.location.href="detail?post_seq="+data; 
			},
			error : function() {

			}
		});
	    		
			}

			return str;

		}
		function imgnullCheck(str){
		
			if(str==null || str==undefined || str=="null"){
				var styleobj={
					'color':'#ff4D00',
					'display':'block'
				}
				$("#autocomplete").focus();
				$('#autocomplete').next().css(styleobj).fadeOut(10000);
			
			}else{
				console.log("두번쨰"+str.x);
	    		console.log(str.y);
			}

			return str;
			

		}
		function addFileFromLastInput(file){
		    var a = $('#upImgFile');
		    a[a.length-1].files = file;
		}
		function camInfo(data){
			$('#cam').val(data.value);
		}
	    function loadNameNullCheck(str){
	         
	        if(typeof str == "undefined" || str == null || str == ""){
	        	console.log('투르');
	            return true;
	        }
	        else{
	        	console.log('펄스');
	            return false ;
	        }
	    }


	</script>

</body>
</html>
