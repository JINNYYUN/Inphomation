<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hello</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/exif-js"></script>
<link href="css/mdb.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  	<!-- Bootstrap JS -->
  	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<style type="text/css">
.content {
	outline: 2px dashed #92b0b3;
	outline-offset: -10px;
	text-align: center;
	transition: all .15s ease-in-out;
	width: 100%;
	background-color: F2F2F2;
}

div {
	border-color: F2F2F2;
	border-size: 2px;
}

.row {
	display: flex;
	flex-wrap: nowrap;
	margin-right: -16px;
	margin-left: -16px;
}

html {
	font-family: sans-serif;
}

form {
	width: 600px;
	background: #ccc;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid black;
}

form ol {
	padding-left: 0;
}

form li, div>p {
	background: #eee;
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
	list-style-type: none;
	border: 1px solid black;
}

form img {
	height: 64px;
	order: 1;
}

form p {
	line-height: 32px;
	padding-left: 10px;
}

,
button {
	background-color: #F27405;
	padding: 5px 10px;
	border-radius: 5px;
	border: 1px ridge black;
	font-size: 0.8rem;
	height: auto;
}

button:hover {
	background-color: #25C05;
	color: white;
}

,
button:active {
	background-color: #D3F8F;
	color: white;
}

.markup {
	position: relative;
	top: 40%;
	left: 43%;
}

.my-5 {
	margin-top: 5rem !important;
	background-color: #F2F2F2F2;
}

.text-weight-medium {
	background-color: #F2F2F2F2;
}
/* image hover */
#photo-gallery {
	padding: 40px 0px 40px;
}

#photo-gallery .state-thumb {
	max-height: 170px;
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
	margin-bottom: 30px;
	border-radius: 10px;
	transition: 0.3s;
	background-color: #fff;
}

#photo-gallery .photo-frame:hover {
	box-shadow: 0px 0px 15px 0px #d0d0d0;
	border-color: #9c27b0;
}
</style>
</head>
<body>

	<div class="container">
		<div id="thumbnailUrl"></div>
		<!-- Heading Row -->
		<div class="row align-items-center my-5">
			<div class="">
				<div class="content rounded mb-4 mb-lg-0" id="mylmg">
					<br> <label for="upImgFile">이미지를 드래그 하거나 여기를 클릭하여 파일을
						선택해주세요! (PNG, JPG,JEPG)</label> <input type="file" class="imagehide"
						id="upImgFile" name="upImgFile" accept=".jpg, .jpeg, .png"
						multiple onChange="uploadImgPreview()">
					<div class="preview">
						<label class="label">NOT FOUND FILE</label>
					</div>
				</div>
				
				<img style="width: 100%; height: 300px" id="thumbnailImg"
					class="photo-gallery content rounded mb-4 mb-lg-0"
					src="#"
					alt="not">
					
			</div>

			<div class="mb-5">
				<div class="card h-100">
					<div class="card-body">
						<div class="postwrite">

							<h2 class="text fas text-weight-medium">
								<i class="fas fa-pencil-alt text"></i>게시글 작성
							</h2>
						</div>
						<form name="frm" action="postUpdate.do" method="post"
							enctype="multipart/form-data">

							<div class="md-form">
								<input type="text" id="inputLGEx"
									class="form-control form-control-lg" placeholder="자신을 소개해 주세요!">
								<label for="inputLGEx"></label>
							</div>
							<div class="md-form">
								<input type="text" id="inputLGEx"
									class="form-control form-control-lg"> <label
									for="inputLGEx">촬영장소를 작성 해주세요!</label>
							</div>
							<div class="md-form">
								<input type="text" id="inputLGEx"
									class="form-control form-control-lg"> <label
									for="inputLGEx">나만의 해쉬 태그 입력해주세요!</label>
							</div>
							<div class="md-form">
								<input type="text" id="inputLGEx"
									class="form-control form-control-lg"> <label
									class="text" for="inputLGEx">촬영기기는 어떻게 되나요?</label>
							</div>



							<a href="#" class="btn btn-primary btn-sm">More Info</a> <input
								class="btn btn-primary btn-sm" type="submit" value="글쓰기">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<section id="photo-gallery">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-4">
					<div class="photo-frame">
						<div class="state-thumb">
							<img id="thumbnailImg1"src="#" class="img-fluid">
						</div>
						<h4>
							<a href="#">#fillDragon</a>
							<a href="#">#bitcamp</a>
							<a href="#">#null</a>
							<a href="#">#hashtag</a>
						</h4>
					</div>
				</div>
			</div>
		</div>
	</section>

				<script type="text/javascript">
			function EXIFutil(){
				EXIF.getData(files[0], function() {
					var exifLong = EXIF
							.getTag(files[0], "GPSLongitude");
					var exifLat = EXIF.getTag(files[0], "GPSLatitude");
					var exifLongRef = EXIF.getTag(files[0],
							"GPSLongitudeRef");
					var exifLatRef = EXIF.getTag(files[0],
							"GPSLatitudeRef");

					console.log("E:" + exifLong[2])
					console.log("N:" + exifLat[2])

				});
				
			}
			
					let files;

					var input = document.querySelector('input');
					var preview = document.querySelector('.preview');
					input.style.opacity = 0;

					$(".content").on("dragover", dragOver).on("dragleave",
							dragOver).on("drop", dragFiles);
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
						if (files.length > 1) {
							arlert("하나만 올려");
							return;
						}
						if (files[0].type.match(/image.*/)) {
							$(e.currentTarget )
									.css(
											{
												"background-image" : "url("
														+ window.URL
																.createObjectURL(files[0])
														+ ")",
												"outline" : "none",
												"background-size" : "100% 100%"
											});

						} else {
							console.log("not image!");
							return;
						}
						console.log("파일 내용" + files.EXIF);
						EXIFutil();
						
					}
					$("#btnwrite").click(function() {
						$(".frm").attr({
							"target" : "self",
							"action" : "postUpdate.do"
						}).submit();

					});

					function uploadImgPreview() {
						let fileInfo = document.getElementById("upImgFile").files[0];
						let reader = new FileReader();

						reader.onload = function() {
						
							document.getElementById("thumbnailImg").src = reader.result;
							document.getElementById("thumbnailImg1").src = reader.result;
						};

						if (fileInfo) {

							reader.readAsDataURL(fileInfo);
							EXIFutil();
						}

					}
				</script>
</body>
</html>
