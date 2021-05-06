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
			
			
			
			<form action="./orderFormList" method="post">
			
				<table id="productTable" style="margin-bottom: 40px">

					<thead>
						<tr>
							<td style="width:70px;">전체선택</td>
							<td>이미지</td>
							<td>item</td>
							<td>price</td>
							<td>qty</td>
							<td>적립금</td>
							<td>배송비</td>
							<td>total</td>
							<td>etc</td>
						</tr>
					</thead>

					<tbody>
						<!--  foreach로 장바구니에서 받아온 ar 뿌려줘야할듯-->

						<c:forEach items="${list}" var="dto" varStatus="status">
						<tr>
							<td style="width:70px;"><input type="checkbox" name="productNum" value="${dto.productNum}" ></td>
							<td><div>
									<img id="productImg"
										src="../resources/upload/images/${dto.productImages[0].thumbnail}" style="width:70px; height:auto;">
								</div></td>
							<td class="productName">${dto.products[0].productName}</td>
							<td class="productPrice"><strong>${dto.products[0].price}</strong></td>
							<td>${dto.cartStock}
							
							
							<input id="productAmount" type="text" name="productAmount" value="${dto.cartStock}" title="${status.index}">
							
							<input type="hidden" value="${list.size()}" id="listSize">
				
							
							
							</td>
							<td>적립금</td>
							<td>배송비</td>
							<td>합계</td>
							<td>삭제 등</td>
						</tr>
						</c:forEach>
					
						
					</tbody>

				</table>
					<button id="ccc">선택상품 주문</button>
			<button>전체상품 주문</button>
			
			</form>
			
			
			
			
			
		<%-- 	<form action="./orderFormList" method="post">
			
			
			<c:forEach items="${list}" var="dto">
			
			<label><input type="checkbox" name="productNum" value="${dto.productNum}">
			<span>${dto.id}</span>
			<span>${dto.productNum}</span>
			<span>${dto.addDate}</span>
			<span>${dto.cartStock}</span>
			</label>
			<br>
			
			</c:forEach>
		
			
			<button>선택상품 주문</button>
			<button>전체상품 주문</button>
			
			</form> --%>
			
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
<script type="text/javascript">



</script>

</html>
