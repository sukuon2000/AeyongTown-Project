<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>애용타운~ 당신의 애용품을 거래해보아요~</title>

<!-- Favicon -->
<link rel="icon" href="${pageContext.request.contextPath}/img/core-img/aeyong.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<!-- ##### All Javascript Files ##### -->
<!-- jQuery-2.2.4 js -->
<script
	src="${pageContext.request.contextPath}/js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script
	src="${pageContext.request.contextPath}/js/bootstrap/popper.min.js" defer></script>
<!-- Bootstrap js -->
<script
	src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js" defer></script>
<!-- All Plugins js -->
<script src="${pageContext.request.contextPath}/js/plugins/plugins.js" defer></script>
<!-- Active js -->
<script src="${pageContext.request.contextPath}/js/active.js" defer></script>
</head>
<body>
	<!-- Tiles header 영역 -->
	<tiles:insertAttribute name="header" />
	<!-- Tiles banner 영역 -->
	<tiles:insertAttribute name="main" />
	<!-- Tiles footer 영역 -->
	<tiles:insertAttribute name="footer" />
</body>
</html>
