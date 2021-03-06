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
.title {
    text-align: center;
    margin-top: 4%;
}
#line{
		margin-left: auto; 
		margin-right: auto;
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
							<a href="${pageContext.request.contextPath}/member/memberMyOrder">
							<img src="../resources/images/account_ico_order.jpg">
							</a>
						</li>
						<li>
							<p class="title">ORDER</p>
						</li>
					</ul>
					<ul class="account_ul">
						<li>
							<a href="${pageContext.request.contextPath}/member/memberMyCart">
							<img src="../resources/images/account_ico_cart.jpg">
							</a>
						</li>
						<li>
							<p class="title">CART</p>
						</li>
					</ul>
					<ul class="account_ul">
						<li>
							<a href="${pageContext.request.contextPath}/member/memberMyCoupon">
							<img src="../resources/images/account_ico_point.jpg">
							</a>
						</li>
						<li>
							<p class="title">COUPON</p>
						</li>
					</ul>
				</div>
			
				<table id="line">
					<tr>
						<th class="lines" width="8%">
						<p style="font-size:14px;">ORDER TACKING</p>
						<a href="${pageContext.request.contextPath}/member/memberMyOrder">??????????????????</a></th>
						<th class="lines" width="8%">
						<p style="font-size:14px;">PROFILE</p>
						<a href="${pageContext.request.contextPath}/member/memberModify">??? ????????????</a></th>
						<th class="lines" width="8%">
						<p style="font-size:14px;">MY REVIEW</p>
						<a href="${pageContext.request.contextPath}/member/memberMyWriting">?????? ??? ??????</a></th>
						<th class="lines" width="8%">
						<p style="font-size:14px;">MY QNA</p>
						<a href="${pageContext.request.contextPath}/member/memberMyQna">?????? ????????????</a></th>
						<th class="lines" width="8%">
						<p style="font-size:14px;">COUPON</p>
						<a href="${pageContext.request.contextPath}/member/memberMyCoupon">??????</a></th>
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