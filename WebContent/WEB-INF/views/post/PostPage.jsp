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
.verticalLines {
    border-right: 2px solid #F25C05;
    width: 116%;
    min-height: 115%;
}
.postCamStyle {
	width: 100%;
}

#mylmg:hover {
	box-shadow: 0px 0px 15px 0px #d0d0d0;
	outline: 2px dashed #9bc7c1;
}

.postpf {
	float: left;
	margin-top: 2%;
}

.postwb {
	float: right;
	padding: 1.2%;
	margin-right: 4%;
}

.postContainer {
	margin-top: 5%;
	margin-bottom: 12%;
}

.postwr {
    margin-top: 13%;
	margin-bottom: 3%;
	width: 100%;
	display: inline-block;
	position: relative;
	box-shadow: 2px 2px 2px 2px #E6E6E6;
	border-radius: 24px;
	overflow: hidden;
}

#thumbnailImg {
	width: 545px;
}

.state-thumb {
    padding-left: 9%;
   /*  max-height: 100%; */
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
    margin: -5%;
}

.posttexxt {
	min-height: 374px;
	resize: none;
}

#disnone {
	visibility: hidden;
}

#disnone1 {
	visibility: hidden;
}

#disnone2 {
	visibility: hidden;
}

#disnone3 {
	visibility: hidden;
}

.postCamStyle:hover {
	box-shadow: 0px 0px 15px 0px #d0d0d0;
	background-color: transparent;
}

.imgg {
	width: 100%;
   	max-height: 721px;
}

.imageSection {
	width: 100%;
}

.sizeUpdic {
	width: 105px;
	height: 50;
}

.imagehide {
	opacity: 0;
}

.postImageContent {
	color: ff4D00;
}
.wkrhtlvek{
    height: 148px; 
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
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDufBnGzI2ttp_WOvh83H8BgH6nT9HJLLc&callback=initAutocomplete&libraries=places&v=weekly"
		defer>
	</script>
	<div class="container postContainer">
		<div id="thumbnailUrl"></div>
		<div class="postrow">
			<form id="frm" class="frmst" method="POST" action="Upload"
				encType="multipart/form-data">
				<section id="photo-gallery">
					<div class="mr-1">
						<div class="postwr">

							<div class="photo-frame postpf">
								<div class="state-thumb verticalLines">

									<div id="thumbnailImg" class="photo-frame img-fluid">
									<label class="imageSection postImageContent" for="upImgFile">*이미지를
											클릭하거나 드래그앤 드랍으로 업로드해주세요!*</label>
										<label class="imageSection" for="upImgFile"> <img
											class="imgg" alt="Please image"
											src="https://storage.googleapis.com/boomkit/%E1%84%82%E1%85%A2%E1%84%81%E1%85%A9.png">
										</label>
										<div class="wkrhtlvek">
											<input type="file" class="imagehide" id="upImgFile"
												name="upImgFile" accept=".jpg, .jpeg, .png"
												multiple="multiple">
										</div>
									</div>
								</div>
							</div>
							<div class="card-body postwb">
								<div class="postwrite"></div>
								<div class="md-form"></div>
								
								<div class="md-form">
									<label class="text" for="inputLGEx">촬영장소를 알려주세요!</label> <input
										id="autocomplete" name="location" value="${location}"
										class="form-control form-control-lg"> <span
										id="disnone">* 촬영장소를 입력해 주세요 *</span>
								</div>

								<div class="md-form">
									<label class="text" for="inputLGEx">사진을 소개해 주세요!</label>
									<textarea id="conent" name="content"
										class=" form-control form-control-lg posttexxt">${content}</textarea>
									<span id="disnone1">* 글을 작성해 주세요 *</span>
								</div>
								<div class="md-form">
									<div style="width: 100%;margin-bottom: 4px;">
										<div class="cameraSection">
											<label class="text" for="inputLGEx">촬영기기를 알려주세요!</label> <select
												class="text custom-select custom-select-sm camera-list postCamStyle"
												id="cameraSelect" onchange="camInfo(this);">
												<option value="">--CAMERA--</option>
												<c:forEach var="i" items="${cam }">
													<option class="body2 text text-weight-light postCamStyle"
														value="${i.camera_serial }">${i.camera_serial }</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<input id="cam" name="camera_serial" value="${oneCamera}"
										class="form-control form-control-lg"> <span
										id="disnone2">* 촬영기기를 입력해 주세요 *</span>
								</div>
								<div class="md-form">
									<label class="text" for="inputLGEx">나만의 해쉬태그를 보여주세요.</label> <input
										id="hashtag" name="hashtag" value="${hashtag}"
										class="form-control form-control-lg"> <span
										id="disnone3">* 해쉬태그를 입력해 주세요 *</span>
								</div>

								<div class="float-right">
									<input id="done" class="sizeUpdic btn btn-primary btn-sm"
										type="button" value="Write">
								</div>

							</div>

						</div>
					</div>

				</section>

			</form>
		</div>

	</div>

	<script type="text/javascript">
		
		let address = document.querySelector('#autocomplete').value;
		let input = document.querySelector('input');
		let preview = document.querySelector('.previews');
		let exifLat;
		let exifLong;
    	let autocomplete;
		let files;
		let reader;
		let fileInfo;
		let wtmY;
		let wtmX;
		let nullcheck;
		
		
		// 구글 라이브러리로 주소 자동완성 기능
    function initAutocomplete() {
        autocomplete = new google.maps.places.Autocomplete(
          document.getElementById("autocomplete"),
          { types: ["geocode"] }
        );
      };
	//메타데이터가 담긴 사진의 EXIF라이브러리를 통하여 위치정보를 가져온다...  
	//가져와서 위도경도 롱랫값 도분초로 보내와지니 소수단위로변환하여 좌표값을만들어낸후 업로드시 이값과함께 경유한다..
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
			             url:"https://maps.googleapis.com/maps/api/geocode/json?latlng="+wtmXx+","+wtmYy+"&key=AIzaSyDufBnGzI2ttp_WOvh83H8BgH6nT9HJLLc",
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
		$(".imageSection").on("dragover", dragOver).on("dragleave", dragOver).on(
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
		// 드래그앤드랍 구현 로직..
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
				document.querySelector('.imgg').src=window.URL.createObjectURL(files[0]);
						
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
		//드래그앤드랍 이미지 변경되었을시 해쉬태그 값을가져와 tagInput 폼에 넣어준다..
		$(function() {
			$(".imagehide").change(
					function(e) {
						files = e.target.files || e.dataTransfer.files;
						document.querySelector('.imgg').src=window.URL.createObjectURL(files[0]);
								
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
			  //장소,소개,태그,기기 미입력시 널값체크후 자동포커싱이동하여 모든값을 입력하게한다.
			 var postLocation = document.querySelector('#autocomplete').value;
			 var postContent = document.querySelector('#conent').value;
			 var postCam = document.querySelector('#cam').value;
			 var postHashtags = document.querySelector('#hashtag').value;
			 var dragimg = document.querySelector('.imagehide').value;
			 var postLocations = NullCheck(postLocation);
			 postContent = NullCheck(postContent);
			 postHashtags = NullCheck(postHashtags);
			 postCam = NullCheck(postCam);
			 if(postLocations === true){
				 var beforeStyle={
							'color': '#ff4D00',
							'visibility': 'visible'
						}
				 var afterStyle={
						 	'visibility': 'hidden'
						}
						$("#autocomplete").focus();
						$('#autocomplete').next().css(beforeStyle);
						setTimeout(function() {
							$('#autocomplete').next().css(afterStyle);
								}, 5000);
						return 0;
			 };
			 if(postContent === true){
				 var beforeStyle={
							'color': '#ff4D00',
							'visibility': 'visible'
						}
				 var afterStyle={
						 	'visibility': 'hidden'
						}
						$("#conent").focus();
						$('#conent').next().css(beforeStyle);
						setTimeout(function() {
							$('#conent').next().css(afterStyle);
								}, 5000);
						return 0;
			 };
			 if(postCam === true){
				 var beforeStyle={
							'color': '#ff4D00',
							'visibility': 'visible'
						}
				 var afterStyle={
						 	'visibility': 'hidden'
						}
						$("#cam").focus();
						$('#cam').next().css(beforeStyle);
						setTimeout(function() {
							$('#cam').next().css(afterStyle);
								}, 5000);
						return 0;
			 };
			 if(postHashtags === true){
				 var beforeStyle={
							'color': '#ff4D00',
							'visibility': 'visible'
						}
				 var afterStyle={
						 	'visibility': 'hidden'
						}
				 
						$("#hashtag").focus();
						$('#hashtag').next().css(beforeStyle);
						setTimeout(function() {
						$('#hashtag').next().css(afterStyle);
							}, 5000);
						return 0;
			 };
			 
			if(typeof dragimg == "undefined" || dragimg == null || dragimg == ""){
				alert('이미지가 업로드되지 않았습니다 다시시도해 주세요');
				return 0;
				}
			if(typeof files == "undefined" || files == null || files == ""){
				alert('이미지를 올려주세요!');
				return 0;
			}
			
			  $.ajax({
			         url:'https://dapi.kakao.com/v2/local/search/address.json?query='+encodeURIComponent(postLocation),
			         type:'GET',
			         headers: {'Authorization' : 'KakaoAK f0e07a82a957e4d2580b19df431ebeb3'},
					 success:function(result){
						 console.log(result);
						 if(result.documents.length == 0){
							alert('정확한 주소를 입력해 주세요');
							return 0; 
						 }
						 nullcheck = NullCheck(result.documents[0].road_address);
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
				$("#autocomplete").value('');
				 var beforeStyle={
							'color': '#ff4D00',
							'visibility': 'visible'
						}
				 var afterStyle={
						 	'visibility': 'hidden'
						}
				    $("#autocomplete").focus();
					$('#autocomplete').next().css(beforeStyle);
					setTimeout(function() {
						$('#autocomplete').next().css(afterStyle);
							}, 5000);
					return 0;
			
			}else{
				console.log('Ok');
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
	    function NullCheck(str){
	         
	        if(typeof str == "undefined" || str == null || str == ""){
	            return true;
	        }
	        else{
	            return false ;
	        }
	    }
	</script>

</body>
</html>