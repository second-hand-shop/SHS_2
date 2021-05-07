<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>selectShipList</title>
</head>
<body>
	<h2>배송조회</h2>
	<div class="container">
		<form action="./shippingNumModify" method="GET">
		<input type="text" hidden="" class="form-control" id="oiNum" name="oiNum" value="${DTO.oiNum }">
		<div class="form-group">
				<label for="orderNum">주문번호</label>
				<input type="text" readonly="readonly" class="form-control" id="orderNum" value="${DTO.orderNum }">
			</div>
			<div class="form-group">
				<label for="shippingNum">주문일자</label>
				<input type="date" readonly="readonly" class="form-control" id="orderDate" value="${DTO.orderDate }">
			</div>
			<div class="form-group">
				<label for="shippingNum">주문처리상태</label>
				<input type="text" readonly="readonly" class="form-control" id="orderProcess" value="${DTO.orderProcess }">
			</div>
			<div class="form-group">
				<label for="shippingNum">송장번호</label>
				<input type="text" class="form-control" id="shippingNum" name="shippingNum" value="${DTO.shippingNum }">
			</div>
			<button type="submit" class="btn btn-primary">UPDATE</button>
		</form>
	</div>
	
	
	
<!--================== JAVASCRIPT ======================-->
<script type="text/javascript" src="../../resources/jquery/orderInfo/selectShipList.js"></script>
</body>
</html>