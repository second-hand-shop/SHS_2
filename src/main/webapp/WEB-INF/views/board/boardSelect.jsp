<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<c:import url="../template/bootStrap.jsp"></c:import>
<title>${board} List</title>

<style>

	#table-border{
	
		margin-left: auto; margin-right: auto;
		margin-top: 5%;
		border: 1px solied #d3d3d3;
	}
	
	li{
		border: 1px solied #d3d3d3;
		border-width: 80%;
	}

</style>

</head>
<body>

	<!-- header -->
	<div id="header">
		<c:import url="../template/header.jsp"></c:import>
	</div>
	
	
	<div id="table-border">
	
		<ul>
		
			<li> ${dto.title} </li>
			
			<li>
				${dto.writer}
				<span>${dto.regdate}</span>
			</li>
			
			<li> HIT ${dto.hit} </li>
			
			<li> ${dto.contents} </li>
		
		</ul>
		
		<div>
			
		</div>
	
	</div>
	
	
	<!-- footer -->
	<c:import url="../template/footer.jsp"></c:import>

</body>

<!------------------------------- CSS & JavaScript -------------------------------------->
<link rel="stylesheet" href="../resources/css/common.css">
<script type="text/javascript" src="../resources/js/common.js"></script>
<script type="text/javascript" src="../resources/js/main.js"></script>
<script type="text/javascript" src="../resources/jquery/dropdown.js"></script>

</html>