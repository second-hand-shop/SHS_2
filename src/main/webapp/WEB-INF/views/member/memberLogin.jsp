<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<title>SHS</title>
<style type="text/css">
#line {
	margin-left: auto; 
	margin-right: auto;
    width: 70%;
    height: 80%;
    border: 1px solid #d3d3d3;
}
#ul {
	margin-left: auto; 
	margin-right: auto;
    width: 70%;
    height: 80%;
}
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
#login_wrap {
    display: inline-block;  
    display: block;
}
#join_wrap {
	 display: inline-block;
	 display: block;
}
.login_wrap_div{
	text-align: center;
	margin-top: 20px;
	padding: 2%;
}
h1 {
	text-align: center;
}
</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../template/header.jsp"></c:import>
		</div>

		<div id="login_wrap_div">
			<table id="line">
				<tbody>
					<tr>
						<td>
							<form action="./memberLogin" method="post" id="member_form">		
							<div class="form-group login_wrap">							
							<fieldset>		
								<h1>LOG IN</h1>
								<ul class="log_form" id="ul">
									<li>
									<strong>ID</strong>
									<input type="text" class="form-control" id="id" name="id" aria-describedby="idlHelp">
									</li>
									<li>
									<strong>PW</strong>
									<input type="text" class="form-control" id="pw" name="pw" aria-describedby="pwlHelp">
									</li>
								</ul>
								
								<ul class="btn_login">
									<li>
										<button type="submit" id="btn_login">LOG-IN</button>
										<a href="./memberIdFind">아이디 찾기</a>
										<a href="./memberPwFind">비밀번호 찾기</a>
									</li>
								</ul>
							</fieldset>
							</div>
							</form>
						</td>
						
						<td>
							<div class="form-group join_wrap">		
							<h1>REGISTER</h1>
							<br>						
								<ul id="ul">
									<li>
									다양한 혜택과 편리한 쇼핑을 즐기실 수 있으며,
									<br>
									회원님들이 불편하지 않도록 다양한 기능들이 준비되어있습니다!
									<br>
									<br>
									<br>
									<a href="./memberJoin" class="type1">REGISTER</a>
									</li>
								</ul>
							</div>
						</td>
					</tr>
				</tbody>
			</table>		
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
<script type="text/javascript" src="./resources/jquery/memberLogin.js"></script>
</html>