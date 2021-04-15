<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#add {
	display: none;
}
</style>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>couponList</title>
</head>
<body>

	<h2>쿠폰 목록</h2>
	<div class="table-responsive">
		<table class="table table-striped table-sm">
			<thead>
				<tr>
					<th>쿠폰번호</th>
					<th>배정 ID</th>
					<th>할인율</th>
					<th>할인금액</th>
					<th>사용유무</th>
				</tr>
			</thead>
			<tbody>
				<tr id="insert">
				
				</tr>
				<c:forEach items="${list }" var="DTO">
					<tr>
						<td>${DTO.couponNum }</td>
						<td>${DTO.id }</td>
						<td>${DTO.disRate }</td>
						<td>${DTO.disPrice }</td>
						<td>${DTO.usage }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
<!-------- table END --------------->
<input type="button" class="btn btn-primary" id="addBtn" value="+">
	<div id="add">
		<form action="./couponInsert" method="post">
			<td><input type="text" name="couponNum"></td>
			<td><input type="text" name="id"></td>
			<td><input type="text" name="disRate"></td>
			<td><input type="text" name="disPrice"></td>
			<td><input type="text" name="usage"></td>
			<td><button class="btn btn-primary">+</button></td>
		</form>
	</div>
</body>
<script type="text/javascript" src="../resources/jquery/coupon/couponInsert.js"></script>
</html>