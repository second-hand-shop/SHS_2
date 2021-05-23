<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<title>SHS</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../template/header.jsp"></c:import>
		</div>
		<!-- header END -->
		<div id="container">
			<div id="contents">

				<h1>상품 수정 페이지- 관리자</h1>


				<form action="./productUpdate" method="post" id="upFrm">

					<input type="hidden" name="productNum" value="${dto.productNum}">
					kinds<input id="kinds" type="text" name="kinds"
						value="${dto.kinds}"> contents<input id="contentss"
						type="text" name="contents" value="${dto.contents}"> price<input
						id="price" type="text" name="price" value="${dto.price}">
					productName<input id="productName" type="text" name="productName"
						value="${dto.productName}"> amount<input id="amount"
						type="text" name="amount" value="${dto.amount}"> <input
						type="button" id="upButton" value="상품수정">
				</form>


				<div style="display: flex; flex-flow: row wrap;">
					<c:forEach items="${dto.productImages}" var="file">
						<form action="./productFileDelte" method="post">
							<div>
								<img src="../resources/upload/images/${file.thumbnail}"> <input
									type="hidden" value="${file.imageNum}" name="imageNum">
								<button>이미지 삭제</button>
							</div>
						</form>
					</c:forEach>
				</div>



				<!-- footer -->
				<c:import url="../template/footer.jsp"></c:import>
			</div>
		</div>
	</div>
</body>
<!------------------------------- CSS & JavaScript -------------------------------------->
<link rel="stylesheet" href="../resources/css/common.css">
<script type="text/javascript" src="../resources/js/common.js"></script>
<script type="text/javascript" src="../resources/js/main.js"></script>
<script type="text/javascript" src="../resources/jquery/dropdown.js"></script>
<script type="text/javascript">
	$("#upButton").click(
			function() {

				if (($("#kinds").val() != "") && ($("#contentss").val() != "")
						&& ($("#price").val() != "")
						&& ($("#productName").val() != "")
						&& ($("#amount").val() != "")) {
					$("#upFrm").submit();
					alert("상품 수정 성공");
				} else {
					alert("항목들을 모두 채워주십시오");
				}

			});
</script>
</html>
