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
/* modifiy 타이틀 */
.title h2 {
    font-family: Gob,malgun gothic,맑은고딕,NanumGothic,돋움;
    font-size: 14px!important;   
}
.title {
    text-align: center;
    margin-top: 4%;
}

/* 이름과 회원 div */
.myInfo {
    padding: 1%;
    border: 1px solid #ccc;
    width: 100%;
    text-align: center;
    margin-bottom: 30px;
    margin-top: 30px;
    font-size: 11px;
    line-height: 18px;
}
/* 테이블 부분 */
#table {
	margin-left: auto; 
	margin-right: auto;
    width: 95%;
    border: 1px solid #ccc;
    border-spacing: 0;
    border-collapse: collapse;
} 
table tr th {
	border: 1px solid #ccc;
	padding: 10px 8px 10px 20px;
	margin: auto;
}
table th {
	width: 10%;
	valign: middle;
}
table td {
	line-height: 2;
	font-size: small;
	border: 1px solid #ccc;
	padding: 10px;
	margin: auto;
	
}
input {
    font-family: malgun gothic, 맑은고딕, NanumGothic, 돋움;
    color: #000;
    vertical-align: middle;
    overflow: visible;
    line-height: inherit;
}

</style>
</head>
<body>

	<div id="wrap">
		<div id="header">
			<c:import url="../template/header.jsp"></c:import>
		</div>
		<!-- header END --> 
		
		<div id="contents">
			<div class="title">
				<h2>MODIFY</h2>
			</div>
			<div class="container">
				<div class="myInfo">
					<p>
						<strong class="name">
							${member.name}님은 [일반회원]입니다.
						</strong>
					</p>
				</div>
			</div>
			<form class="modifyform" action="./memberModify" method="post" enctype="multipart/form-data">
				<div class="write">
					<table id="table" style="margin-bottom: 40px">
						<tbody>
							<tr>
								<th scope="row">아이디</th>
								<td>
								<input type="text" class="form-control" id="id" name="id" readonly="readonly" value="${member.id}">
								</td>
							</tr>
							<tr>
								<th scope="row">비밀번호</th>
								<td>
								<input type="password" class="form-control" id="pw" name="pw" value="${member.pw}">
								</td>
							</tr>
							<tr>
								<th scope="row">비밀번호 확인</th>
								<td>
								<input type="password" class="form-control" id="pw2" name="pw2">
								</td>
							</tr>
							<tr>
								<th scope="row">이름</th>
								<td>
								<input type="text" class="form-control etc" id="name" name="name" value="${member.name}">
								</td>
							</tr>
							<tr>
								<th scope="row">휴대전화</th>
								<td>
								<input type="text" class="form-control etc" id="phone" name="phone" value="${member.phone}">
								</td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td>
								<input type="text" class="form-control etc" id="email" name="email" value="${member.email}">
								</td>
							</tr>
						</tbody>					
					</table>
					<input type="submit" id ="btn" value="Update">
					<a href="./memberDelete">Delete</a>
				</div>
			</form>
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