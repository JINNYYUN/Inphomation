<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>
<script type="text/javascript"
    src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    
    
<style type="text/css">
html, div, body, h3 {
    margin: 0;
    padding: 0;
}
 
h3 {
    display: inline-block;
    padding: 0.6em;
}
</style>
<script type="text/javascript">
    $(document).ready(function() {
        var name = ${result}.response.name;
        var email = ${result}.response.profile_image;
        $("#name").html("환영합니다. "+name+"님");
        $("#email").html(email);
        console.log(${result}.response)
      });

</script>
 
 <div style="background-color: #15a181; width: 100%; height: 50px; text-align: center; color: white;">
     <h3>SIST Naver_Login Success</h3>
 </div>
 <br>
 <h2 style="text-align: center" id="name"></h2>
 <h4 style="text-align: center" id="email"></h4>

