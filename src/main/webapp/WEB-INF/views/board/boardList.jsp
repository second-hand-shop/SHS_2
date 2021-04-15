<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<title>${board} List</title>

<style>

	#title_center{
		margin: 8% 0 0 0;
		text-align: center;
	}
	
	.line{
		border:1;
		bordercolor:"gray";
	}


</style>

</head>
<body>
	
	<!-- header -->
	<div id="header">
			<c:import url="../template/header.jsp"></c:import>
	</div>

	
	<h1 id="title_center">${board}</h1>
	
	<table class="line">
		<th>
			<td>NO</td>
			<td>SUBJECT</td>
			<td>WRITER</td>
			<td>DATE</td>
			<td>HIT</td>
		</th>
		
		<c:forEach items="${list}" var="board">
			<tr>
				<td>${board.num}</td>
				<td>${board.title}</td>
				<td>${board.writer}</td>
				<td>${board.regdate}</td>
				<td>${board.hit}</td>
			</tr>
		</c:forEach>
	
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