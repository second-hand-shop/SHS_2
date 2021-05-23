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
		
			<h1>insert product</h1>
			
			<form action="./productInsert" method="post" enctype="multipart/form-data" id="upFrm">
			
			
			kinds<input id="kinds" type="text" name="kinds">
			contents<input id="contentss" type="text" name="contents">
			price<input id="price" type="text" name="price">
			productName<input id="productName" type="text" name="productName">
			amount<input id="amount" type="text" name="amount">
			
			<input type="button" value="생성" id="upButton">
			
			<div>
				 <input type="file" id="gdsImg" name="files" multiple/>
				 <%=request.getRealPath("/") %>			 
			</div>
			
		
			</form>
			
			
			
			
			
			
			
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


$("#upButton").click(function(){
	
 	if(
	($("#kinds").val()!="")&&
	($("#contentss").val()!="")&&
	($("#price").val()!="")&&
	($("#productName").val()!="")&&
	($("#amount").val()!="")&&
	($("#gdsImg").val()!="")
	){
		$("#upFrm").submit();
		alert("상품 생성 성공");
	}else{
		alert("항목들을 모두 채워주십시오");
	}
	
	
});


</script>
</html>
