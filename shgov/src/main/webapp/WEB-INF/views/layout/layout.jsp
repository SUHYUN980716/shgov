<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdn.amcharts.com/lib/4/core.js"></script> 
<script src="//cdn.amcharts.com/lib/4/charts.js"></script> 
<script src="//cdn.mywebsite.com/libs/amcharts/core.js"></script> 
<script src="//cdn.mywebsite.com/libs/amcharts/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@200;400;600;700&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<style>
body{
font-weight: 200;
font-family: 'IBM Plex Sans KR', sans-serif;
}
</style>
</head>
<body>
	<header id="header">
		<tiles:insertAttribute name="header"/>
	</header>

	<div id="content" class="container" style="padding:50px" >
		<tiles:insertAttribute name="content"/>
	</div>
 
	<footer id="footer">
		<tiles:insertAttribute name="footer"/>
	</footer>
</body>
</html>