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
			<h1> 상세페이지</h1>
			<a href="./productUpdate?productNum=${dto.productNum}"><button type="button" class="btn btn-primary">상품 수정</button></a>
			
			
			
			<a href="#" id="del" class="btn btn-danger">상품 삭제</a>
			
			
			
			
			<h5>${dto.kinds}</h5>
			<h5>${dto.contents}</h5>
			<h5>${dto.price}</h5>
			<h5>${dto.productName}</h5>
			<h5>${dto.amount}</h5>	
			
				
			<form action="./productDelete" id="frm">
				<input type="hidden" name="productNum" value="${dto.productNum}">
			</form>
			
			
			
			
				<div>
	<c:forEach items="${dto.productImages}" var="file">
		<%-- <a href="../resources/upload/images/${file.fileName}">${file.ogName}</a> --%>
		<img src="../resources/upload/images/${file.thumbnail}">
	</c:forEach>
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
<script type="text/javascript">

	$("#del").click(function(){
		
		let result = confirm("지우시겠습니까!");
		

		if(result=true){
			$("#frm").attr("method","post");
			$("#frm").submit();
			
		}
		
	});
	
	
	


</script>
</html>
