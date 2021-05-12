<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>selectList</title>
</head>
<body>
	<div class="container">
		<h2>주문 상세정보</h2>
		<div class="table-responsive">
		<table class="table table-striped table-sm">
			<thead>
				<tr>
					<th>상품명</th>
					<th>주문금액</th>
					<th>취소/교환/반품</th>
					<th>+ / -</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list }" var="DTO">
				<tr>
					<td>${DTO.productName }</td>
					<td>${DTO.orderPrice }</td>
					<td>${DTO.orderCondition }</td>
					<td><input type="checkbox" name="deleteCheck" class="check"></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	</div>

</body>
</html>