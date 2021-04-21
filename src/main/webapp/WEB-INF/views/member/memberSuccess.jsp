<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="header">
			<c:import url="../template/header.jsp"></c:import>
		</div>
	
		<div class="container mt-2">
			<div id="container">
				<h2> ${member.name}님 환영합니다!</h2>
				<h2> ID: ${member.id}</h2>
				<h2> NAME: ${member.name}</h2>
				<h2> EMAIL: ${member.email}</h2>
				
				<a href="${pageContext.request.contextPath}/member/memberLogin">LOGIN</a>
				<a href="${pageContext.request.contextPath}/">HOME</a>
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