<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<title>SHS</title>

<style type="text/css">

/* #description{


float :right;

} */

.col{
display:flex;
justify-content: space-evenly;
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
			
			
			<div id="productModify" style="display: none;">
			<input type="hidden" value="${member.id}" id="mId">
			<a href="./productUpdate?productNum=${dto.productNum}"><button type="button" >상품 수정</button></a>
			<a href="#" id="del" type ="button">상품 삭제</a>
			</div>
			
			<div class="col">
			
			
			
			
			
			
			
				<div style="text-align: center;">
	<c:forEach items="${dto.productImages}" var="file">
		<%-- <a href="../resources/upload/images/${file.fileName}">${file.ogName}</a> --%>
		
		<div>
		<img src="../resources/upload/images/${file.thumbnail}">
		</div>
	</c:forEach>
	<img src="../resources/images/productListContents.jpg">
	</div>
			
			
			
			
			
			<div id="description" >
			<p>kinds : ${dto.kinds}</p>
			<p>contents :${dto.contents}</p>
			<p>price : ${dto.price}</p>
			<p>name : ${dto.productName}</p>
			<p id="amount" style="display: none;">amount : ${dto.amount}</p>	
			
			<br>
			
			<form action="../order/orderForm" method="post" id="buyfrm" style="display: inline;">
			<input type="hidden" name="productNum" value="${dto.productNum}">
			수량<input type="number" value="1" min="1" max="${dto.amount}" name="productAmount" id="productAmount">
			<!-- <button>buy</button> -->
			<input type="button" value="buy" id="buyButton">
			</form>
			<!--  세션에도 저장해야 회원검사하고 빼올수 있을듯,,-->
			
			<!-- <a href="../order/orderForm" id="buy" class="btn btn-outline-dark">buy</a> -->
			<a href="#" id="cart" class="button">cart</a>
			</div>
			
			
			<input type="hidden" value="${member.id}" id="mId">
			
			
	
	
			
			
			
			
			
			
				
			<form action="./productDelete" id="delfrm">
				<input type="hidden" name="productNum" value="${dto.productNum}">
			</form>
			
			
			<form action="../order/cartInsert" id="cartfrm">
				<input type="hidden" name="productNum" id="cProductNum" value="${dto.productNum}">			
			</form>
			
			
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

if($("#mId").val()=='admin'){
	$("#productModify").css("display","block")
	$("#amount").css("display","block")
	
}


 $("#buyButton").click(function(){
	
	var id = $('#mId').val();
	
	if(id.length>0){
		$("#buyfrm").submit();
	}else{
		alert("비회원입니다.");
	} 
}); 




	$("#del").click(function(){
		
		let result = confirm("지우시겠습니까!");
		

		if(result==true){
			$("#delfrm").attr("method","post");
			$("#delfrm").submit();
		}else{
			alert("삭제하지 않습니다.")
		}
		
		
	});
	
	$("#cart").click(function(){
		
		let proudctNum = $("#cProductNum").val();
		let result = confirm("카트에 담으시겠습니까");
		
		if(result==true){
			
			$("#cartfrm").attr("method","post");
			$.post("../order/cartInsert",
					
			{
				productNum : proudctNum,
				productAmount : $("#productAmount").val()
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
