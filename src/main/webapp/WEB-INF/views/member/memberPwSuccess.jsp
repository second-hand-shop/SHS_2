<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
                <h3>임시 비밀번호를 발급했습니다.<br>
                로그인 후 비밀번호를 변경해주세요</h3>
				<br>
				<h4>임시 비밀번호  : ${member.pw}</h4>
				
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
</body>
</html>