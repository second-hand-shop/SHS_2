<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
	/* table 전체 */
	#line{
		margin-left: auto; 
		margin-right: auto;
		margin-top: 4%;
		width: 75%;
		border: 1px solid #d3d3d3;
	}
	
	/* table 내부 선, cell-padding, 글자 정렬 */
	.lines{
		border: 1px solid #d3d3d3;	
		padding: 1%;
		text-align: center;
	}
</style>
</head>
<body>
<div id="wrap">
		<div id="header">
			<c:import url="../template/header.jsp"></c:import>
		</div>
		<!-- header END -->
		
	<table id="line">
		<tr>
			<th class="lines" width="10%">COUPON NUMBER</th>
			<th class="lines" width="8%">할인율</th>
			<th class="lines" width="8%">금액</th>
			<th class="lines" width="8%">사용여부</th>
		</tr>
		
		<c:if test="${empty list}">
			<td colspan="4" class="lines"><p>보유하고 계신 쿠폰 내역이 없습니다</p></td>			
		</c:if>
		
		<c:forEach items="${list}" var="dto">
			<tr>
				<td class="lines">${dto.couponNum}</td>	
				<td class="lines">${dto.disRate}</td>				
				<td class="lines">${dto.disPrice}</td>				
				<td class="lines">${dto.usage}</td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- footer -->
			<c:import url="../template/footer.jsp"></c:import>
			
</div>
</body>
<!------------------------------- CSS & JavaScript -------------------------------------->
<link rel="stylesheet" href="../resources/css/common.css">
<script type="text/javascript" src="../resources/js/common.js"></script>
<script type="text/javascript" src="../resources/js/main.js"></script>
<script type="text/javascript" src="../resources/jquery/dropdown.js"></script>
</html>