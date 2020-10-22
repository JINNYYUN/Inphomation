<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<meta charset="UTF-8">
<title>Inphomation</title>

<style type="text/css">
.footer {
       position : absolute;
       bottom : 0;
       width: 100%;
       height:170px;
}

.basic-layout{
	position : relative;
	min-height :100vh;
}

.main-wrapper{
	padding-bottom : 200px;
}
</style>

<tiles:insertAttribute name="header"/>
	
</head>
<body>

<div class="basic-layout">

 	<div>
		<tiles:insertAttribute name="global_navigation" />
	</div> 
	
	<div class="main-wrapper">	
		<tiles:insertAttribute name="main"/>	
		
	</div>	
	<footer class="footer">
		<tiles:insertAttribute name="footer"/>
	</footer>	
</div>
	

</body>
</html>









