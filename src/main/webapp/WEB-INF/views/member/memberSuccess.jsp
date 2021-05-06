<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#container {
    position: relative;
    width: 40%;
    margin: 0 auto;
    margin-top: 4%;
    border: 1px solid #d3d3d3;
    text-align: left;
    padding: 3%;
}
h2 h1 {
	font-family: NanumGothic;
}
.a {
	text-align: center;
}
</style>
</head>
<body>
	<div id="header">
			<c:import url="../template/header.jsp"></c:import>
		</div>
	
		<div class="container mt-2">
			<div id="container">
				<h2> ${member.name}님 환영합니다!</h2>
				<br>
				<h1> ID: ${member.id}</h1>
				<h1> NAME: ${member.name}</h1>
				<h1> EMAIL: ${member.email}</h1>
				
				<br>
				<br>
				<div class="a">
					<a href="${pageContext.request.contextPath}/member/memberLogin">LOGIN</a>
					<a href="${pageContext.request.contextPath}/">HOME</a>
				</div>
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