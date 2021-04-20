<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<title>SHS</title>

<style type="text/css">

#description{


float :right;

}



</style>
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
			
			<div>
			<a href="./productUpdate?productNum=${dto.productNum}"><button type="button" class="btn btn-outline-dark">상품 수정</button></a>
			<a href="#" id="del" class="btn btn-danger">상품 삭제</a>
			</div>
			
			
			
			
			
			
			<div id="description" >
			<h5>${dto.kinds}</h5>
			<h5>${dto.contents}</h5>
			<h5>${dto.price}</h5>
			<h5>${dto.productName}</h5>
			<h5>${dto.amount}</h5>	
			<div> </div>
			<a href="#" id="buy" class="btn btn-outline-dark">buy</a>
			<a href="#" id="wish" class="btn btn-outline-dark">wish</a>
			<a href="#" id="cart" class="btn btn-outline-dark">cart</a>
			</div>
			
			
				
			<form action="./productDelete" id="delfrm">
				<input type="hidden" name="productNum" value="${dto.productNum}">
			</form>
			
			
			<form action="" id="cartfrm">
			
			</form>
			
			
			
			
			
				<div>
	<c:forEach items="${dto.productImages}" var="file">
		<%-- <a href="../resources/upload/images/${file.fileName}">${file.ogName}</a> --%>
		
		<div>
		<img src="../resources/upload/images/${file.thumbnail}">
		</div>
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
			$("#delfrm").attr("method","post");
			$("#delfrm").submit();
			
		}
		
	});
	
	$("#cartfrm").click(function(){
		
		let result = confirm("카트에 담으시겠습니까");
		
		if(result=true){
			
			$.post("setCartInsert",
					
			{
				//매개변
			},
			function(data){
				
				if(data>0){
					alert("상품을 장바구니에 담았습니다.");
				}else{
					alert("장바구니 담기 실패");
				}
				
			}
			
			
			
			);
				
				
			
			
			//디비에 저장되고, 카트jsp에서 보여야된다
			//세션을 이용해서 해당 멤버 아이디에 해당하는걸 보여주면 될듯,,
			
			
		}
		
	})
	
	
	
	


</script>
</html>
