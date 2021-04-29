<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>aInfoList</title>
</head>
<body>
	<div class="container">
		<h2>주소지 목록</h2>
		<div class="table-responsive">
		<table class="table table-striped table-sm">
			<thead>
				<tr>
					<th>우편번호</th>
					<th>기본주소</th>
					<th>상세주소</th>
					<th>주문번호</th>
					<th>+ / -</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list }" var="DTO">
				<tr>
					<td>${DTO.zipCode }</td>
					<td>${DTO.majorAddr }</td>
					<td>${DTO.minorAddr }</td>
					<td>${DTO.orderNum }</td>
					<td><input type="checkbox" name="deleteCheck" class="check"></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	</div>

</body>
</html>