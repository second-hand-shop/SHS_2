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
			
			<c:if test="${list eq null}">
					<td colspan="5" class="lines"><p>0 item</p></td>			
			</c:if>
			
			<div class="orderList">
				<table border="1">
					<caption>기본배송</caption>
					<thead>
						<tr>
							<th scope="col" class="check lines" width="5%">
								<input type="checkbox">
							</th>
							<th scope="col" class="image lines" width="9%">-</th>
							<th scope="col" class="product lines" width="20%">ITEM</th>
							<th scope="col" class="price lines" width="8%">PRICE</th>
							<th scope="col" class="qty lines" width="8%">QTY</th>
							<th scope="col" class="delivery lines" width="8%">DELIVERY</th>
							<th scope="col" class="charge lines" width="8%">CHARGE</th>
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
							<td class="product"><!-- 상품명 a태그 --></td>
							<td class="price"></td>
							<td>
								<span class="qty"></span>
							</td>
							<td class="delivery">기본배송</td>
							<td class="charge">
								<p>3,000</p>
								<br>조건
							</td>
							<td class="total"></td>
							<td class="button">
								<a href="#">BUY NOW</a><br>
								<a href="#">DELETE</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
				
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