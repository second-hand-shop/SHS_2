<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<title>SHS</title>
<style>
.linePage {
	float: left;
	margin: 10px;
}

.thumbImg {
	max-width: 370px;
	heigth: auto;
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






				<h1></h1>

				<div id="productInsert" style="display: none;">
					<a href="./productInsert"><button type="button">상품추가</button></a> <input
						type="hidden" value="${member.id}" id="mId">
				</div>
				<div>
					<br>
				</div>
				<!-- css로 마진 패딩 채우면 없앤다 br -->



				<div class="row">
					<c:forEach items="${list}" var="dto">


						<div class="col">
							<p>
								<a href="./detail?productNum=${dto.productNum}"> <img
									src="../resources/upload/images/${dto.productImages[0].thumbnail}"
									class="thumbImg" onerror="javascript:noImg(this)">
								</a>
							</p>
							<p style="text-align: center;">
								<a href="./detail?productNum=${dto.productNum}">${dto.productName}</a>
							</p>
							<p style="text-align: center;" class="price">${dto.price}</p>
							<input type="hidden" value="${dto.amount}" class="amount">
						</div>

					</c:forEach>
				</div>


				<div>
					<br>
				</div>


				<ul>

					<c:if test="${pager.pre}">
						<li class=linePage><a
							href="./productList?curPage=${pager.startNum-1}">PREV</a></li>
					</c:if>
					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<li class=linePage><a href="./productList?curPage=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${pager.next}">
						<li class=linePage><a
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
<script type="text/javascript">
	if ($("#mId").val() == 'admin') {
		$("#productInsert").css("display", "block")

	}

	function noImg(obj) {
		// image not found or change src like this as default image:

		if (obj != null) {

			obj.src = "../resources/images/insertImgplz.jpg";
		}

	};

	function priceToString(price) {
		return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}

	$(".price").each(function() {

		var pr = $(this).text();
		pr = priceToString(pr);
		$(this).text(pr);

	});
	$(".amount").each(
					function() {
						if (parseInt($(this).val()) < 1) {
							$(this)
									.prev(".price")
									.html(
											'<img src="../resources/images/ico_product_soldout.gif">');

						}

					});
</script>


</html>
