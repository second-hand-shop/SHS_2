<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#modal {
	display: none;
}

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
						<td id="delNum"><a href="#myModal" data-toggle="modal" id="couponSelect">${DTO.couponNum }</a></td>
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

	<!---- The Modal ---------------------------->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="./couponUpdate" method="POST">
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">배정 ID</label>
							<input type="text" class="form-control" name="id">
						</div>
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">할인율</label>
							<input type="number" class="form-control" name="disRate">
						</div>
						<div class="mb-3">
							<label for="exampleInputPassword2" class="form-label">할인금액</label>
							<input type="number" class="form-control" name="disPrice">
						</div>
						<span class="mb-3">
      						<label class="form-label">사용유무</label>
     						<select class="form-select" name="usage">
     							<option>Y</option>
     							<option>N</option>
      						</select>
    					</span>
						<button type="submit" class="btn btn-primary">UPDATE</button>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
	<!---- The Modal ---------------------------->
</body>
<script type="text/javascript" src="../resources/jquery/coupon/couponList.js"></script>
</html>