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
/* 	border: 1px solid #ccc; */
	margin:10px;
}

/* .productImg{
 	border: 1px solid #ccc; 

            display: flex;

            overflow: hidden;
            align-items: center;
            justify-content: center;


	max-width: 100%;
    	width: 400px;
        height: 400px;
        
        padding: 10px;
		margine: 10px;


} */

/* 
.productBox{
float:left;
}


.space{
clear:left;
}
 */




.row{
display : flex;
flex-direction: row;
flex-wrap : wrap;
/* border: 1px solid #ccc;  */
}


.col{
/* border: 1px solid #ccc;  */

flex-shrik:0;
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


				<a href="./productInsert"><button type="button"
						>상품추가</button></a>
				<div> <br>  </div>
				<!-- css로 마진 패딩 채우면 없앤다 br -->
			

					<div class="row">
				<c:forEach items="${list}" var="dto">


					
				
					
						<div class="col">
							<%-- 		<c:forEach items="${dto.productImages}" var="file">
								<img src="../resources/upload/images/${file.thumbnail}">
							</c:forEach> --%>
							<p><a href="./detail?productNum=${dto.productNum}">
								<img src="../resources/upload/images/${dto.productImages[0].thumbnail}" style="max-width:370px; heigth:auto;">
							</a></p>
							<p><a href="./detail?productNum=${dto.productNum}">${dto.productName}</a></p>
							
						</div>
					
			

				

				</c:forEach>
					</div>


				<div><br></div>

	
				<ul >

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



</html>