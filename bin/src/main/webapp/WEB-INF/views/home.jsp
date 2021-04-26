<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<c:import url="./template/bootStrap.jsp"></c:import>
<title>SHS</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="./template/header.jsp"></c:import>
		</div>
		<!-- header END -->
		<div id="container">
			<div id="contents">
				<div class="main_img">
					<ul>
						<img src="./resources/images/popcat.png" />
					</ul>
				</div>
				<title>OUT OF LINE 아웃오브라인</title>
			</div>
			<!-- footer -->
			<c:import url="./template/footer.jsp"></c:import>
		</div>
	</div>
</body>
<!------------------------------- CSS & JavaScript -------------------------------------->
<link rel="stylesheet" href="./resources/css/common.css">
<script type="text/javascript" src="./resources/js/common.js"></script>
<script type="text/javascript" src="./resources/js/main.js"></script>
<script type="text/javascript" src="./resources/jquery/dropdown.js"></script>
</html>

