<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<title>memberPw Find</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../template/header.jsp"></c:import>
		</div>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">		
			<form action="./memberPwFind" method="post">
				<div class="w3-center w3-large w3-margin-top">
					<h2>비밀번호 찾기</h2>
				</div>
				<div id="search">
 					<p>
						<label>ID</label>
						<input class="w3-input" type="text" id="id" name="id" required>
					</p> 
					<p>
						<label>Email</label>
						<input class="w3-input" type="text" id="email" name="email" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="findBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">find</button>
						<a href="${pageContext.request.contextPath}/member/memberLogin" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Login</a>
					</p>
				</div>
			</form>
		</div>
	</div>		
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