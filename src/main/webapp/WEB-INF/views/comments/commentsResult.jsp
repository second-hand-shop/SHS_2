<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<c:import url="../template/bootStrap.jsp"></c:import>
<title>Delete form</title>

<style>

	/* box div 폼 line */
	.box-line{
		border: 0.8px solid #c4c4c4;
		width: 60%;
		height: auto;
		margin-left: 20%;
		padding: 2%;
		text-align: left;
	}
	
	

</style>

</head>
<body>

	<!-- header -->
	<div id="header">
		<c:import url="../template/header.jsp"></c:import>
	</div>
	
	
	<div class="box-line">
		<ul>
		
			<li>[삭제]</li>
			<li>COMMENT PASSWORD</li>
			<li>안전한 삭제를 위해 작성하신 비밀번호를 입력해주세요!</li>
			<br>
			<li>
				<label for="password" style="font-size: 9pt; border-bottom: 0.8px solid black">P/W</label> 
				<input type="password" id="pw" name="pw" 
				style="border:none; font-size: 9pt; margin-left:1%;">
				
				<a href="../comments/commentsDelete?num=${comments.num}" style="text-align: right;">OK</a>
			</li>
		
		</ul>
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