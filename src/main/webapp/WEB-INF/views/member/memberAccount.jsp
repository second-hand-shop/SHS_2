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
.title h2 {
    font-family: Gob,malgun gothic,맑은고딕,NanumGothic,돋움;
    font-size: 14px!important;   
}
.title {
    text-align: center;
    margin-top: 4%;
}
#line{
		margin-left: auto; margin-right: auto;
		margin-top: 4%;
		width: 60%;
		height:80%;
		border: 1px solid #d3d3d3;
	}
.lines{
		border: 1px solid #d3d3d3;	
		padding: 3%;
		height:60%;
		text-align: center;
}	
.account {
    color: #000;
    padding: 0;
    width: 900px;
    margin: 0 auto;
    text-align: center;
    font-size: 14px;
    line-height: 18px;
    margin-top: 30px;
}
.account_ul {
	display:inline-block;
	width:200px;
}	
</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../template/header.jsp"></c:import>
		</div>

		<div class="w3-content w3-container w3-margin-top">
			<div class="w3-container w3-card-4" style="text-align: center">
				<div class="title">
					<h2>MY ACCOUNT</h2>
				</div>
				<div class="account">
					<ul class="account_ul">
						<li>
							<a href="#">
							<img src="../resources/images/account_ico_order.jpg">
							</a>
						</li>
						<li>
							<p class="title">ORDER</p>
						</li>
					</ul>
					<ul class="account_ul">
						<li>
							<a href="#">
							<img src="../resources/images/account_ico_cart.jpg">
							</a>
						</li>
						<li>
							<p class="title">CART</p>
						</li>
					</ul>
					<ul class="account_ul">
						<li>
							<a href="#">
							<img src="../resources/images/account_ico_point.jpg">
							</a>
						</li>
						<li>
							<p class="title">POINT</p>
						</li>
					</ul>
				</div>
			
				<table id="line">
					<tr>
						<th class="lines" width="8%">
						<a href="#">주문내역조회</a></th>
						<th class="lines" width="8%">
						<a href="${pageContext.request.contextPath}/member/memberModify">내 정보수정</a></th>
						<th class="lines" width="8%">
						<a href="#">관심상품</a></th>
						<th class="lines" width="8%">
						<a href="${pageContext.request.contextPath}/member/memberMyBoard">내가쓴글</a></th>
						<th class="lines" width="8%">
						<a href="#">적립금</a></th>
					</tr>
				</table> 
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