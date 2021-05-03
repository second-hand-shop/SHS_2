<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<title>SHS</title>
<style type="text/css">
/* 타이틀 */
.title h2 {
    font-family: Gob,malgun gothic,맑은고딕,NanumGothic,돋움;
    font-size: 14px!important; 
    font-weight: bold;  
}
.title {
    text-align: center;
    margin-top: 4%;
}
input {
	height: 30%;
	width: 15%;
}
#table {
	margin-left: auto; 
	margin-right: auto;
    width: 90%;
    border: 1px solid #ccc;
    border-spacing: 0;
    border-collapse: collapse;
} 
table tr th {
	border: 1px solid #ccc;
	padding: 10px 8px 10px 20px;
	margin: auto;
	font-size: small;
}
table th {
	width: 10%;
	valign: middle;
	font-size: small;
}
table td {
	line-height: 2;
	height: 10%;
	border: 1px solid #ccc;
	padding: 10px;
	margin: auto;	
}
/* 버튼 */
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
   width:300px;
   display: flex;
   flex-flow: row;
}
</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../template/header.jsp"></c:import>
		</div>
		<!-- header END -->
		<div id="container">
			<div id="contents">
				<div class="title">
				<h2>JOIN</h2>
				</div>	
				<br>
				<form id="joinform" action="./memberJoin" method="post" enctype="multipart/form-data">
					<div class="write">
					<table id="table" style="margin-bottom: 40px">
						<tbody>
							<tr>		
								<th scope="row">ID</th>
								<td>
								<input type="text" id="id" name="id" readonly="readonly">
								<h2 id="idResult"></h2>
								</td>
							</tr>
							<tr>
								<th scope="row">PW</th>
								<td>
								<input type="password" id="pw" name="pw">
								</td>
							</tr>
							<tr>
								<th scope="row">PW CHECK</th>
								<td>
								<input type="password" id="pw2" name="pw2">
								<h2 id="pwResult"></h2>
								</td>
							</tr>
							<tr>
								<th scope="row">NAME</th>
								<td>
								<input type="text" id="name" name="name">
								</td>
							</tr>
							<tr>
								<th scope="row">PHONE</th>
								<td>
								<input type="text" id="phone" name="phone">
								</td>
							</tr>
							<tr>
								<th scope="row">E-MAIL</th>
								<td>
								<input type="text"  id="email" name="email">
								</td>
							</tr>
						</tbody>					
					</table>
				</div>
					<div class="button">	
						<input type="submit" id="btn" value="SUBMIT" class="btn">
					</div>
				</form>
			</div>
			<!-- footer -->
			<c:import url="../template/footer.jsp"></c:import>
		</div>
	</div>
</body>
<!------------------------------- CSS & JavaScript -------------------------------------->
<link rel="stylesheet" href="../resources/css/common.css">
<script type="text/javascript" src="../resources/js/common.js"></script>
<script type="text/javascript" src="../resources/js/main.js"></script>
<script type="text/javascript" src="../resources/jquery/dropdown.js"></script>
<script type="text/javascript" src="../resources/js/memberJoin.js"></script>
</html>