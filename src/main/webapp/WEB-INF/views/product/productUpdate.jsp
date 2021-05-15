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
			
			<h1>상품 수정 페이지- 관리자</h1>
			
			
			<form action="./productUpdate" method="post">
			
			<input type="hidden" name="productNum" value="${dto.productNum}">
			kinds<input type="text" name="kinds" value="${dto.kinds}">
			contents<input type="text" name="contents" value="${dto.contents}">
			price<input type="text" name="price" value= "${dto.price}">
			productName<input type="text" name="productName" value="${dto.productName}">
			amount<input type="text" name="amount" value="${dto.amount}">
			
			<button>상품수정</button>
			</form>
			
			
							<div style="display: flex; flex-flow : row wrap;">
	<c:forEach items="${dto.productImages}" var="file">
		<%-- <a href="../resources/upload/images/${file.fileName}">${file.ogName}</a> --%>
		<form action="./productFileDelte" method="post">
		<div>
		<img src="../resources/upload/images/${file.thumbnail}">
		<input type="hidden" value="${file.imageNum}" name="imageNum">
		<button>이미지 삭제</button>
		</div>
		</form>
	</c:forEach>
			</div>
			
			
			
			<!-- footer -->
			<c:import url="../template/footer.jsp"></c:import>
		</div>
	</div>
	</div>
</body>
<!------------------------------- CSS & JavaScript -------------------------------------->
<link rel="stylesheet" href="../resources/css/common.css">
<script type="text/javascript" src="../resources/js/common.js"></script>
<script type="text/javascript" src="../resources/js/main.js"></script>
<script type="text/javascript" src="../resources/jquery/dropdown.js"></script>
</html>
