<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css">
<style>
	.main-back-ground .login{
		position: absolute;
		right:30px;
		top:20px;
		width:32px;
		height:32px;
		border:none;
		border-radius:50%;
		background-color:#f28705;
	}
</style>
<div class="screen-up" id="screen-up"><i class="fas fa-angle-up"></i></div>
<div class="main-back-ground" id="back-img">
	  <!-- 로그인이 안되있으면 실행되는 로직 추가하기 -->
	  <div class="login" onclick="goImgLogin();">
	  	<!-- 로그인 넣기  -->
	  </div>

      <div class="search-bar" style="position:relative;top:200px;width:50%;margin:0 auto;min-width:250px;">
        <input type="text" name="searchKeyword" id="main-search-keyword" style="width:100%;" />
        <i class="fas fa-search text" onclick="searchKeywordMain();"></i>
      </div>
</div>
<div class="main-container">
	<div class="grid">
	    <div class="item">
			<!-- 나중에 POST_SEQ넣기 -->
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 해당작성자 프로필로 이동으로 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <!-- 나중에 1대신에 POST_SEQ기입 -->
	            <h4><i class="far fa-heart" onclick="clickLike(this,1);">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="clickBookMark(this,1);">0</i></h4>
	        </div>
	    </div>
	
	    <div class="item">
	        <img src="https://i.pinimg.com/564x/bc/c9/34/bcc93488a9d00e84605e0cc576f8cdf4.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4>작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img src="https://i.pinimg.com/564x/fa/75/9d/fa759d039faa25afe7e38b9ceae72aee.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4>작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img src="https://i.pinimg.com/236x/ac/91/ef/ac91ef6fd45a60d08ff9de98d8e4be8a.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4>작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img src="https://i.pinimg.com/236x/8c/98/ae/8c98aed1c2e176521c5037b8069608d4.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4>작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img src="https://storage.googleapis.com/boomkit/mypic.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4>작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	    <div class="item">
	        <img onclick="movePage(1);" src=" https://i.pinimg.com/564x/12/0e/cf/120ecf5d602bb22fa3bfde129ba223d5.jpg">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	
	    <div class="item">
	        <img onclick="movePage(1);" src="    https://i.pinimg.com/originals/22/0b/b9/220bb93ed82bd9cba466e193e92f722f.png
	        ">
	        <div class="white-circle">
	            <i class="fas fa-bars menu" onclick="test();"></i>
	        </div>
	        <div class="bottom-icon-bar icon-absoulte">
	            <!-- Back 작성하면 변경하기 -->
	            <h4 onclick="test();">작성자</h4>
	
	            <!-- 
	                아래 두개의 경우에는 좋아요와 북마크를 선택한 경우가 있음. 그걸 확인하는 로직 추가하기
	                만약 했다면 far => fas
	             -->
	            <!-- 좋아요 일단 0 작성후 Back 구현시에  가져오기 -->
	            <h4><i class="far fa-heart" onclick="test();">0</i></h4>
	
	            <!-- BookMark 위와 동일  -->
	            <h4><i class="far fa-star" onclick="test();">0</i></h4>
	        </div>
	    </div>
	</div>
</div>

<script src="<%=request.getContextPath() %>/js/main.js"></script>
