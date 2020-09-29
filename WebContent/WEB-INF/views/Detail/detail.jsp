<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
<div>
	<a href="#none"><i class="far fa-arrow-alt-circle-left"></i></a>
</div>
<form>
	<div>
		<table border="1">
		<tr>
			<td>
				<table border="1">
				<tr>
					<td>
					<!-- 사진 -->
					<div class="text">사진</div>
					</td>
				</tr>
				<tr>
					<td>
						<a href="#none"><i class="far fa-heart"></i></a>
					</td>
					<td>
						<a href="#none" id="bookmark"><i class="far fa-bookmark"></i></a>
					</td>
				</tr>
				</table>
			</td>
			<td>
				<!-- 내용 -->
				<div>
				<table border="1">
				<tr>
					<td rowspan="1">프로필 사진</td>
					<td>
						<table>
						<tr>
							<td>아이디</td>
						</tr>
						<tr>
							<td>위치</td>
						</tr>
						</table>	
					</td>
					<td>
					<a href="#none">···</a> 
					</td>
				</tr>
				<tr>
					<td colspan="3">내용</td>
				</tr>
				<tr>
					<td colspan="3">댓글</td>
				</tr>
				</table>
			</div>
			</td>
		</tr>
		</table>
	</div>
</form>
</div> 

<script type="text/javascript">
$(document).ready(function(){
	
});
</script>   

</body>
</html>






