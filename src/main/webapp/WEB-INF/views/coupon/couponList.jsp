<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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



</body>
</html>