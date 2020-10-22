<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container main-container">
	<div class="text h3 text-color-gray100 text-weight-regular detail-bottom-message">
			최근 게시물
	    </div> 
	<div class="grid">
		<c:if test="${empty postList }">
		<h1 class="text h3 text-weight-medium nothing" title="bring me to main page!!!" onclick="location.href='main'">
			<a href="main">FIND MORE <i class="fas fa-search"></i>
		</a></h1>
		</c:if>
		<c:forEach items="${postList }" var="post" varStatus="i">
			<div class="item">
				<img src="https://storage.googleapis.com/boomkit/${post.post_filepath }" onclick="movePage(${post.post_seq})" >
			</div>
		</c:forEach>
	</div>
</div>

<script type="text/javascript">
function SetGridItemHeight() {
	let grid = document.getElementsByClassName('grid')[0];
	let rowHeight = parseInt(window.getComputedStyle(grid).getPropertyValue('grid-auto-rows'));
	let rowGap = parseInt(window.getComputedStyle(grid).getPropertyValue('grid-row-gap'));

	let item = grid.getElementsByClassName('item');
	for (let i = 0; i < item.length; ++i) {
		let a = Math.floor((item[i].children[0].offsetHeight) / 25)
		//item[i].style.gridRowEnd = `span ${Math.floor((item[i].children[0].offsetHeight) / 25)}`
		item[i].style.gridRowEnd = `span ` + a
	}
}

window.addEventListener("load", SetGridItemHeight);
window.addEventListener("resize", SetGridItemHeight);

function movePage(seq){
	location.href="detail?post_seq="+seq;
};
</script>