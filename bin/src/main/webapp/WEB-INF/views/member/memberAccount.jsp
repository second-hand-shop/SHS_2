<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../template/header.jsp"></c:import>
		</div>

	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4" style="text-align:center">		
			<h2> MY ACCOUNT </h2>
			
			<a href="#">ORDER</a>
			<a href="#">CART</a>
			<a href="#">POINT</a>
			
			<p>
				<a href="#">주문내역조회</a>
				<a href="${pageContext.request.contextPath}/member/memberModify">내 정보수정</a>	
				<a href="#">관심상품</a>
				<a href="#">내가쓴글</a>	
				<a href="#">적립금</a>
			</p>
		</div>
	</div>	
		<!-- footer -->
		<c:import url="../template/footer.jsp"></c:import>
	</div>
</body>
<!------------------------------- CSS & JavaScript -------------------------------------->
<link rel="stylesheet" href="../resources/css/common.css">
<script type="text/javascript" src="../resources/js/common.js"></script>
<script type="text/javascript" src="../resources/js/main.js"></script>
<script type="text/javascript" src="../resources/jquery/dropdown.js"></script>
</html>