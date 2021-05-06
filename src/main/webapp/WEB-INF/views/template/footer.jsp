<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="footer" class="xans-element- xans-layout xans-layout-footer ">
	<ul class="footer_top">
		<a href="#">HOME</a>
		<a href="#">AGREEMENT</a>
		<a href="#">SHOP-GUIDE</a>
		<a href="#">CHECKPRIVACY</a>
	</ul>
	<ul class="xans-element- xans-layout xans-layout-info footer_cus ">
		010-6426-0892 | MON - FRI 09AM - 6PM | SAT.SUN.HOLIDAY OFF
		<br /> Kakao Bank 3333-05-7780800 | 예금주 : 
		<c:choose>
			<c:when test="${member.id=='admin' }">
				<a href="${pageContext.request.contextPath}/admin/adminHome">임형수</a>
			</c:when>
			<c:otherwise>
				임형수
			</c:otherwise>
		</c:choose>
	</ul>
	<ul class="shop_info">
		COMPANY - SHS . CEO - SHS . CPO - SHS . ADDRESS - https://github.com/second-hand-shop
		<br /> BUSINESS LICENSE : X . ONLINE LICENSE : X . COPYRIGHT (C) SHS
		<a href="https://www.instagram.com/hyungssxxi/" target="new"><img src="/web/upload/category/editor/2015/11/24/6e998e3d67448eb43ca1e0bb4fa83e11.png" /></a>
	</ul>
</div>