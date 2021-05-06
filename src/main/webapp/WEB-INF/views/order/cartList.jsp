<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.lines{
		border: 1px solid #d3d3d3;	
		padding: 1%;
		text-align: center;
	}
	.body {
		border: 1px solid #d3d3d3;
		height: 30%;
	}
</style>
</head>
<body>
	<!-- header -->
	<div id="header">
		<c:import url="../template/header.jsp"></c:import>
	</div>

	<div id="container">
		<div id="contents">
			<h1>CART</h1>
			<br>
			
			<c:if test="${dto eq null}">
					<h1 style="text-align: center;">0 item</h1>
			</c:if>
			
			<c:if test="${not empty dto}">
			
			<form action="./orderForm" method="post">
						
			<c:forEach items="${list}" var="dto">
			
			<table border="1">
					<caption>기본배송</caption>
					<thead>
						<tr>
							<th scope="col" class="check lines" width="5%">
								<input type="checkbox">
							</th>
							<th scope="col" class="image lines" width="9%">-</th>
							<th scope="col" class="product lines" width="20%">ITEM</th>
							<th scope="col" class="total lines" width="8%">TOTAL</th>
							<th scope="col" class="button lines" width="8%">ETC</th>
						</tr>
					</thead>
					
						<tbody class="body">
						<tr>
							<td>
								<input type="checkbox">
							</td>
							<td class="image"><!-- 상품이미지 a태그 --></td>
							<td class="product">${dto.productNum}<!-- 상품명 a태그 --></td>
							<td class="price"></td>
							<td class="total"></td>
							<td class="button">
								<a href="#">BUY NOW</a><br>
								<a href="#">DELETE</a>
							</td>
						</tr>
					</tbody>
						
					
			</table>
			
			</c:forEach>
		
			
			<button>선택상품 주문</button>
			<button>전체상품 주문</button>
			
			</form>
			
			</c:if>
				
		</div>
	</div>

	<!-- footer -->
	<c:import url="../template/footer.jsp"></c:import>
</body>
<!------------------------------- CSS & JavaScript -------------------------------------->
<link rel="stylesheet" href="../resources/css/common.css">
<script type="text/javascript" src="../resources/js/common.js"></script>
<script type="text/javascript" src="../resources/js/main.js"></script>
<script type="text/javascript" src="../resources/jquery/dropdown.js"></script>
</html>