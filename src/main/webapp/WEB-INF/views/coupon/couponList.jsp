<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

tbody tr td input {
	width: 70%;
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
					<th>+ / -</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" name="couponNum" id="couponNum"></td>
					<td><input type="text" name="id" id="id"></td>
					<td><input type="text" name="disRate" id="disRate"></td>
					<td><input type="text" name="disPrice" id="disPrice"></td>
					<td><input type="text" name="usage" id="usage"></td>
					<td><button class="btn btn-dark insert">+</button></td>
				</tr>
				<c:forEach items="${list }" var="DTO">
					<tr id="tr">
						<td id="delNum"><a href="./couponSelect?couponNum=${DTO.couponNum }" data-toggle="modal" id="couponSelect">${DTO.couponNum }</a></td>
						<td>${DTO.id }</td>
						<td>${DTO.disRate }</td>
						<td>${DTO.disPrice }</td>
						<td>${DTO.usage }</td>
						<td><input type="checkbox" name="deleteCheck">-</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-------- table END --------------->
	<input type="button" class="btn btn-primary" id="addBtn" value="+">
	<!-------- ????????????????????????????? --------------->

</body>
<script type="text/javascript" src="../resources/jquery/coupon/couponList.js"></script>
</html>