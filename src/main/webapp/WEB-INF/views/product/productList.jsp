<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<title>SHS</title>
<style>
#linePage {
	margin: 10;
	padding: 10;
	border: 10;
	float: left;
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

				<!--                                                                           -->







				<a href="./productInsert"><button type="button"
						class="btn btn-primary">상품추가</button></a>
				<div></div>

				<c:forEach items="${list}" var="dto">



					<div>
						<div>
							<%-- 		<c:forEach items="${dto.productImages}" var="file">
								<img src="../resources/upload/images/${file.thumbnail}">
							</c:forEach> --%>
							<a href="./detail?productNum=${dto.productNum}"> <img
								src="../resources/upload/images/${dto.productImages[0].thumbnail}">
							</a>
						</div>
						<span> <a href="./detail?productNum=${dto.productNum}">${dto.productName}</a>
						</span>
						
					</div>




				</c:forEach>


				<ul>

					<c:if test="${pager.pre}">
						<li id=linePage><a
							href="./productList?curPage=${pager.startNum-1}">PREV</a></li>
					</c:if>
					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<li id=linePage><a href="./productList?curPage=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${pager.next}">
						<li id=linePage><a
							href="./productList?curPage=${pager.lastNum+1}">NEXT</a></li>
					</c:if>
				</ul>







				<!--                                                                           -->

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



</html>
