<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
<style type="text/css">
.preview{
	height: 400px;
	width: 400px;
	overflow: hidden;
	border-radius: 50%;
}
.preview img{
	display: inline-block;
	width: 400px;
	min-height: 100%;
}
</style>
</head>
<body>
<div class="container">
	<p>프로필 사진 선택</p>
	<form id="frm" method="post" enctype="multipart/form-data">
	<input type="file" name="fileload" id="upload">
	</form>
	
	<div class="preview" id="_preview">
	</div>
	<br>
	<button class="btn" id="writebtn">등록</button>
	<button class="btn" id="cancelbtn">취소</button>

</div>



<!-- 파일 프리뷰 함수 -->
<script type="text/javascript">
var upload = document.querySelector('#upload');
var preview = document.querySelector('#_preview');
upload.addEventListener('change',function (e) {
    var get_file = e.target.files;
    var image = document.createElement('img');
    /* FileReader 객체 생성 */
    var reader = new FileReader();
    /* reader 시작시 함수 구현 */
    reader.onload = (function (aImg) {
        console.log(1);
        return function (e) {
            console.log(3);
            /* base64 인코딩 된 스트링 데이터 */
            aImg.src = e.target.result
        }
    })(image)
    if(get_file){
        /* 
            get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
            onload 에 설정했던 return 으로 넘어간다.
       	     이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
        */
        reader.readAsDataURL(get_file[0]);
        console.log(2);
    }
    preview.appendChild(image);
})
</script>

<script type="text/javascript">
$("#writebtn").click(function(){
	
	if( $("#upload").val().trim() == "" ){
		alert("이미지를 등록해주세요.");
		return false;
	}
	else{
		$("#frm").attr("action", "MyPageUploadAf").submit();
	}
});
$("#cancelbtn").click( function() {
	self.close(); 
});
</script>

</body>
</html>