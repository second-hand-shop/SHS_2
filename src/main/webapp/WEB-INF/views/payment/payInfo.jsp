<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<title>SHS</title>
				<title>OUT OF LINE 아웃오브라인</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../template/header.jsp"></c:import>
		</div>
		<!-- header END -->
		<div id="container">
			<div id="contents">
		
		
		
<%-- <h1>payInfo</h1>



<p>${dto.productNum}</p>
<p>주문번호 : ${dto.orderNum}</p>
<p>${dto.name}님의 상품 구매가 완료되었습니다.</p> --%>
		
<div style="text-align: center;">
<h1>payInfo</h1><br>
<p>주문번호 : ${dto.orderNum}</p>
<span>${dto.name}님의</span>
<span> ${dto.products[0].productName}</span>
<span> 상품 구매가 완료되었습니다.</span><br>
<a href="../"> 홈으로 </a>		
</div>
		
		
		
		
		
		
			</div>
			<!-- footer -->
			<c:import url="../template/footer.jsp"></c:import>
		</div>
	</div>
</body>
<!------------------------------- CSS & JavaScript -------------------------------------->
<link rel="stylesheet" href="../resources/css/common.css">
<script type="text/javascript" src="../resources/js/common.js"></script>
<script type="text/javascript" src="../resources/js/main.js"></script>
<script type="text/javascript" src="../resources/jquery/dropdown.js"></script>
</html>

