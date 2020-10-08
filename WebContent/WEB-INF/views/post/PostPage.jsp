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



<style type="text/css">
.content {
	outline: 2px dashed #92b0b3;
	outline-offset: -10px;
	text-align: center;
	transition: all .15s ease-in-out;
	width: 100%;
	background-color: gray;
}


div {
	border-color: gray;
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

form label, form button {
	background-color: #7F9CCB;
	padding: 5px 10px;
	border-radius: 5px;
	border: 1px ridge black;
	font-size: 0.8rem;
	height: auto;
}

form label:hover, form button:hover {
	background-color: #2D5BA3;
	color: white;
}

form label:active, form button:active {
	background-color: #0D3F8F;
	color: white;
}

.markup {
	position: relative;
	top: 40%;
	left: 43%;
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
					
				<img id="thumbnailImg"class="content rounded mb-4 mb-lg-0"
					src="https://storage.googleapis.com/boomkit/mypic.jpg" alt="not">
					<i class="fas fa-eye markup"></i>
					<i class="fas fa-expand-arrows-alt markup"></i>
					
			</div>
		
			<div class="mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">PostWrite</h2>

						<form name="frm" action="postUpdate.do" method="post"
							enctype="multipart/form-data">


							<div>
								<span>장소는 어디서 찍으셧나요? <input type="text" id="space"
									name="space" readonly>
								</span> <br> <span>카메라 기종을 입력해주세요 <input type="text"
									id="camara" name="camara" readonly>
								</span> <br> <span>나만의 해쉬태그를 만들어봅니다 <input type="text"
									id="hashtag" name="hashtag" readonly>
								</span> <br> <span> <a href="#none" id="btnwrite"
									title="저장"> </a>
								</span>
							</div>



							<a href="#" class="btn btn-primary btn-sm">More Info</a> <input
								class="btn btn-primary btn-sm" type="submit" value="글쓰기">
						</form>
					</div>
				</div>
			</div>
		 </div>
	</div>
	



	<script type="text/javascript">
		// upload file GPSLongitude/GPSLongitudeRef
		let files;

		var input = document.querySelector('input');
		var preview = document.querySelector('.preview');
		input.style.opacity = 0;

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
			if (files.length > 1) {
				console.log("하나만 올려");
				return;
			}
			if (files[0].type.match(/image.*/)) {
				$(e.target).css(
						{
							"background-image" : "url("
									+ window.URL.createObjectURL(files[0])
									+ ")",
							"outline" : "none",
							"background-size" : "100% 100%"
						});

			} else {
				console.log("not image!");
				return;
			}
			console.log("파일 내용" + files.EXIF);

			EXIF.getData(files[0], function() {
				var exifLong = EXIF.getTag(files[0], "GPSLongitude");
				var exifLat = EXIF.getTag(files[0], "GPSLatitude");
				var exifLongRef = EXIF.getTag(files[0], "GPSLongitudeRef");
				var exifLatRef = EXIF.getTag(files[0], "GPSLatitudeRef");

				console.log("E:" + exifLong[2])
				console.log("N:" + exifLat[2])

			});
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
				document.getElementById("thumbnailUrl").innerText = reader.result;
				};

			if (fileInfo) {

				reader.readAsDataURL(fileInfo);

			}

		}
	</script>
</body>
</html>
