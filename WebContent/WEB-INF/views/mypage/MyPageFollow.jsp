<%@page import="bit.com.inpho.dto.MyPageMemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
List<MyPageMemberDto> list = (List<MyPageMemberDto>)request.getAttribute("list");
boolean[] follow = (boolean[])request.getAttribute("follow");
MyPageMemberDto login = (MyPageMemberDto)request.getSession().getAttribute("login");
%>
<div class="container">
	<%
	for(int i=0; i<list.size(); i++){
	%>
	<div class="list">
		<%
		if(list.get(i).getProfile_image() == null || list.get(i).getProfile_image().equals("")){
		%>
			<img alt="" src="./image/2017070900603_4.jpg" onclick="goMyPage(<%=list.get(i).getUser_seq()%>)">
		<%	
		}else{ 
		%>
			<img src="http://localhost:8090/Inphomation/upload/profileImage/<%=list.get(i).getProfile_image()%>"
				onclick="goMyPage(<%=list.get(i).getUser_seq()%>)">
		<%	
		}
		%>
		<span onclick="goMyPage(<%=list.get(i).getUser_seq()%>)"><%=list.get(i).getUser_nickname() %></span>
		<%if(list.get(i).getUser_seq() != login.getUser_seq()){
			if(follow[i]){
			%>
				<input type="button" class="btn modal-btn" value="Unfollow" onclick="goFollow(<%=follow[i]%>, <%=list.get(i).getUser_seq()%>)" id="f<%=list.get(i).getUser_seq()%>">
			<%	
			}else{
			%>
				<input type="button" class="btn modal-btn" value="Follow" onclick="goFollow(<%=follow[i]%>, <%=list.get(i).getUser_seq()%>)" id="f<%=list.get(i).getUser_seq()%>">
			<%	
			}
		}
		%>
	</div>
	<%
	}
	%>
</div>

<script type="text/javascript">
function goMyPage(user_seq){

	location.href="mypage?user_seq=" + user_seq;
	
}

//팔로우/언팔로우 함수
function goFollow(isFollowing, userSeq){

	//alert(isFollowing);
	//alert(userSeq);
	if(isFollowing){
		var value = 'Unfollow';
	}else{
		var value = 'Follow';
	}
	
	    $.ajax({
		url:'follow?user_seq=' + userSeq,
		type:'post',
		data:{"work":value},
		success:function(data){ 
			var fid = "#f"+userSeq;
			if(value == 'Follow'){
				$(fid).val('Unfollow');
				$(fid).removeAttr("onclick");	// 온클릭 속성을 삭제
				$(fid).attr("onclick", "goFollow(true," + userSeq + ")");
			}else{
				$(fid).val('Follow');
				$(fid).attr( "onclick", "goFollow(false," + userSeq + ")" );
			}
		},
		error:function(){
			alert('error');
		}
	});  
		
}
</script>
