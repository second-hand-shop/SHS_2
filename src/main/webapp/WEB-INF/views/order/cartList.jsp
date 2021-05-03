<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<title>SHS</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../template/header.jsp"></c:import>
		</div>
		<!-- header END -->
		<div id="container">
			<div id="contents">
			
			<h1>cart list</h1>
			
			<c:if test="${not empty list}">
			
			<form action="./orderForm" method="post">
			
			
			<c:forEach items="${list}" var="dto">
			
			<label><input type="checkbox" name="productNum" value="${dto.productNum}">
			<span>${dto.id}</span>
			<span>${dto.productNum}</span>
			<span>${dto.addDate}</span>
		
			</label>
			<br>
			
			</c:forEach>
		
			
			<button>선택상품 주문</button>
			<button>전체상품 주문</button>
			
			</form>
			
			</c:if>
			
			
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
