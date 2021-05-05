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
		
		
		


<div style="text-align: center;">
<h1>payInfo</h1><br>
<p>주문번호 : ${list.get(0).orderNum}</p>
<span>${list.get(0).name}님의</span>
<c:forEach items="${list}" var="dto">
<span> ${dto.products[0].productName}</span>
</c:forEach>
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

