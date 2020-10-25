<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>
<script type="text/javascript"
    src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<%
Object movePage = session.getAttribute("goPage");
%>
    
<script type="text/javascript">
    $(document).ready(function() {
		$.ajax({
			url:"socialLogin",
			type:"post",
			data:{
				user_email:${result}.response.id,
				user_nickname:${result}.response.nickname,
				profile_image:${result}.response.profile_image,
				provider:"Naver"
			},
			success:function(data){
				if(data){
					<%if(movePage==null){%>
						//로그인성공
						opener.location.reload()
					<%}else{%>
						opener.location.href='http://'+location.host+'${goPage }'
					<%}%>
						window.close()
				}else{
					alert('로그인에 실패하였습니다')
					//로그인실패
					window.close()
				}
			},error:function(){
				alert('err')
			}
		})
      });
</script>
 