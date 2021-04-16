<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<title>${board} List</title>

<style>
	
	/* Page 이름 */
	#title_center{
		margin: 8% 0 0 0;
		text-align: center;
	}
	
	/* table 전체 */
	#line{
		margin-left: auto; margin-right: auto;
		margin-top: 5%;
		width: 75%;
		border: 1px solid #d3d3d3;
	}
	
	/* table 내부 선, cell-padding, 글자 정렬 */
	.lines{
		border: 1px solid #d3d3d3;	
		padding: 1%;
		text-align: center;
	}
	
	/* 2번째 줄 정렬 */
	td:nth-child(2){
		text-align: left;
	}
	
	/* th 글자 굵기와 정렬 */
	th{
		text-align: center;
		font-weight: 400;
	}


</style>

</head>
<body>
	
	<!-- header -->
	<div id="header">
			<c:import url="../template/header.jsp"></c:import>
	</div>

	
	<h2 id="title_center">${board}</h2>
	
	<table id="line">
		<tr>
			<th class="lines" width="4%">NO</td>
			<th class="lines" width="69%">SUBJECT</td>
			<th class="lines" width="9%">WRITER</td>
			<th class="lines" width="9%">DATE</td>
			<th class="lines" width="9%">HIT</td>
		</tr>
		
		<c:forEach items="${list}" var="dto">
			<tr>
				<td class="lines">${dto.num}</td>
				<td class="lines"><a href="./${board}Select?num=${dto.num}">${dto.title}</a></td>
				<td class="lines">${dto.writer}</td>
				<td class="lines">${dto.regdate}</td>
				<td class="lines">${dto.hit}</td>
			</tr>
		</c:forEach>
		
		<tr>
			<td class="lines" colspan="5"></td>
		</tr>
		
	</table>
	
	
	<!-- footer -->
	<c:import url="../template/footer.jsp"></c:import>

</body>

<!------------------------------- CSS & JavaScript -------------------------------------->
<link rel="stylesheet" href="../resources/css/common.css">
<script type="text/javascript" src="../resources/js/common.js"></script>
<script type="text/javascript" src="../resources/js/main.js"></script>
<script type="text/javascript" src="../resources/jquery/dropdown.js"></script>

</html>