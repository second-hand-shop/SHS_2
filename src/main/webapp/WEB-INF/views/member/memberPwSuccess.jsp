<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div id="header">
			<c:import url="../template/header.jsp"></c:import>
</div>
		
		<div class="container mt-2">
			<div id="container">
				 <h2>PASSWORD RESET</h2>
                <h3>임시 비밀번호를 발급했습니다.<br>
                로그인 후 비밀번호를 변경해주세요</h3>
				<form action="./memberPwSuccess" method="get">
                         <div class="col-md-6 col-sm-6">
                              <h4>임시 비밀번호  : ${member.pw}</h4>

                         </div>
                
				<div class="a">
					<a href="${pageContext.request.contextPath}/member/memberLogin">LOGIN</a>
				</div>
				</form>
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