<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css">

<div class="screen-up" id="screen-up"><i class="fas fa-angle-up"></i></div>
<div class="main-back-ground" id="back-img">
      <div class="search-bar" style="position:relative;top:200px;width:50%;margin:0 auto;">
        <input type="text" name="searchKeyword" id="main-search-keyword" style="width:100%;" />
        <i class="fas fa-search text" onclick="searchKeywordMain();"></i>
      </div>
</div>
<div class="main-container">
	<div class="grid">
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
<script type="text/javascript">
	/*
		메인페이지에서 헤더의 인터렉트를 구현하는 함수 400의 고정값을 준 이유는 
		현재 메인페이지의 상단에서의 이미지의 크기를 400px로 고정을 해놨기 때문
	*/
	$(window).scroll(function(e){
	 	var window = $(this).scrollTop()
	 	if(400>=window){
			$('.navbar').css('display','none')
	 	}else{
	 		$('.navbar').css('display','block')
	 	}
	})
	
	//우측 하단의 상단방향 화살표를 클릭시 실행되는 함수로 최상단페이지로 올려주는 역할 
	$('#screen-up').click(function(){
		window.scrollTo({top:0,left:0})
	})
	
	//좋아요 클릭시
	function clickLike(e,seq){
		changeMark(e,'like',seq)
	}
	//북마크 클릭시
	function clickBookMark(e,seq){
		changeMark(e,'book',seq)
	}


	//좋아요와 북마크를 클릭했을시 숫자를 증감시키는 역할과 비동기를 통해서 DB에 추가 삭제작업함
	function calculNumber(e,b,cate,seq){
		let number = Number(e.innerText)
		let p = 'plus'
		let m = 'minus'
		//비동기로 DB에 갈때 필요한것 post_seq, 링크주소(pluslike, plusbook, minuslike, minusbook)	, 아이디
		if(b){//빼줘야함
			e.innerText = --number
			$.ajax({
				url:m+cate,
				type:post,
				data:{
					postSeq : seq,
					//userSeq : 유저시퀀스번호
				},
				success:function(){
					alert('삭제 성')
				},
				error:function(){
					alert('삭제 삐뽀삐뽀')	
				}
			})
		}else{//채우기
			e.innerText = ++number
			$.ajax({
				url:p+cate,
				type:post,
				data:{
					postSeq : seq,
					//userSeq : 유저시퀀스번호
				},
				success:function(){
					alert('추가 성')
				},
				error:function(){
					alert('추가 삐뽀삐뽀')	
				}
			})
		}
	
	}
	//안이 차있으면 비워진 마크를 띄우고 비워져있으면 차있는 마크를 띄운다
	function changeMark(e,cate,seq){
		//fas == 안이 차있다 far==안이 비어있다
		//true false로 반환받음
		if(e.classList.contains('fas')){
			//이미 누른거기때문에 비워야한다
			e.classList.remove('fas')
			e.classList.remove('text')
			e.classList.add('far')
			calculNumber(e,true,cate,seq)
		}else{
			//안누른거기 때문에 채워야한다
			e.classList.add('fas')
			e.classList.add('text')
			e.classList.remove('far')
			calculNumber(e,false,cate,seq)
		}
	}
	
	//메인의 searchBar
	function searchKeywordMain(){
		//1.get으로 보내기
		keywordInput = document.getElementById('main-search-keyword')
		let keyword = keywordInput.value.trim()
		if(keyword==''){
			//공백인 경우
			keywordInput.value=''
			keywordInput.focus()
		}else{
			location.href= 'http://'+location.host+"/Inphomation/keywordSearch?keyworld="+keyword
		}
	}
</script>