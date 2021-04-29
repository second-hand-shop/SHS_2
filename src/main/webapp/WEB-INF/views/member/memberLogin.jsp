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
	text-align: center;
	margin-left: auto; 
	margin-right: auto;
    width: 50%;
    height: 80%;
    border: 1px solid #d3d3d3;
}
table td {
	line-height: 2;
	font-size: small;
	border: 1px solid #ccc;
	padding: 5px;
	margin: auto;	
}
.login_wrap_div{
	text-align: center;
	margin-left: auto; 
	margin-right: auto;
	margin-top: 20px;
	padding: 1%;
}
.c {
	text-align: left;
}
.login_wrap ul {
    width: 200px;
    margin: auto;
}
.join_wrap ul {
    width: 200px;
    margin: auto;
}
.idForm{
  border-bottom: 2px solid #adadad;
}

.passForm{
  border-bottom: 2px solid #adadad;
}

.id {
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  background: none;
}

.pw {
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  background: none;
}
.btn {
	display: inline-block;
    width: 100px;
    font-family: NanumGothic;
    font-size: 10px;
    border: 1px solid #000;
    color: #000;
    text-align: center;
}
.button{
   margin:0 auto;
   width: 210px;
   display: flex;
   flex-flow: row;
   justify-content:space-between;
}
</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../template/header.jsp"></c:import>
		</div>

		<br>
		<br>
		<div id="login_wrap_div">
			<table id="line">
				<tbody>
					<tr>
						<td>
							<form action="./memberLogin" method="post" id="member_form">		
							<div class="form-group login_wrap">							
							<fieldset>		
								<h1>LOG IN</h1>
								<br>
								<ul class="log_form" id="ul">
									<li class="c idForm">
									<strong>ID</strong>
									<input type="text" class="id" id="id" name="id">
									</li>
									<li class="c passForm">
									<strong>PW</strong>
									<input type="text" class="pw" id="pw" name="pw">
									</li>
								</ul>
								
								<br>
								<ul class="btn_login">
									<li>
										<button type="submit" id="btn_login" class="btn">LOG-IN</button>
										<br>
										<br>
										<div class="button">
										<a href="./memberIdFind" class="btn">아이디 찾기</a>
										<a href="./memberPwFind" class="btn">비밀번호 찾기</a>
										</div>
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
									다양한 혜택과 편리한 쇼핑을 
									<br>
									즐기실 수 있으며,
									<br>
									회원님들이 불편하지 않도록 다양한 기능들이 준비되어있습니다!
									<br>
									<br>
									<a href="./memberJoin" class="btn">REGISTER</a>
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