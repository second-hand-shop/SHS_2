<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="header">
	<div class="header">
		<div class="Left_menu" id="drop_menu">
			<div class="nav_left">
				<ul id="nav">
					<li><a href="#" class="top_link">BOARD</a>
						<ul class="c1">
							<li><a href="${pageContext.request.contextPath}/notice/noticeList">NOTICE</a></li>
							<li><a href="${pageContext.request.contextPath}/qna/qnaList">Q &amp; A</a></li>
							<li><a href="${pageContext.request.contextPath}/review/reviewList">REVIEW</a></li>
						</ul></li>
				</ul>
			</div>
			<!--//nav_left -->
		</div>
		<!-- //LEFR_MENU-->

		<div class="right_menu" id="drop_menu">
			<div class="nav_right">
				<ul id="nav">
					<li><a href="#" class="top_link">MEMBER</a>
						<ul>
							<c:if test="${empty member}">
							<li class="xans-element- xans-layout xans-layout-statelogoff "><a href="${pageContext.request.contextPath}/member/memberLogin">LOGIN</a></li>
							</c:if>
							<c:if test="${not empty member}">
							<li class="xans-element- xans-layout xans-layout-statelogoff "><a href="${pageContext.request.contextPath}/member/memberLogout">LOGOUT</a></li>
							</c:if>
							<c:if test="${empty member}">
							<li class="xans-element- xans-layout xans-layout-statelogoff "><a href="${pageContext.request.contextPath}/member/memberJoinCheck">JOIN</a></li>
							</c:if>
							<c:if test="${not empty member}">
							<li class="xans-element- xans-layout xans-layout-statelogoff "><a href="${pageContext.request.contextPath}/member/memberModify">MODIFY</a></li>
							</c:if>
							<!-- 로그인 시 나타나게 if -->
							<li><a href="${pageContext.request.contextPath}/member/memberMyOrder">ORDER TRACKING</a></li>
							<li><a href="${pageContext.request.contextPath}/member/memberAccount">MY ACCOUNT</a></li>
							<!-- if END -->
							<li></li>
							<li class="cart_ct"><a href="${pageContext.request.contextPath}/order/cartList" class="xans-element- xans-layout xans-layout-orderbasketcount ">cart</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<!--//RIGHT_MENU -->

		<div class="center_menu">
			<ul class="logo">
				<li><a href="${pageContext.request.contextPath}/">SECOND HAND<br />SELECT STORE<br /> <br /> <img src="../resources/images/OutOfLine_logo.png" /></a></li>
			</ul>
			<ul class="menu_list">
				<li class="menu_list_shop"><a href="${pageContext.request.contextPath}/product/productList">SECOND HAND</a></li>
				<li class="menu_list_shop2"><a href="#">SELECT</a></li>
			</ul>
		</div>
	</div>
</div>
<!--// .header -->