<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<c:import url="../template/bootStrap.jsp"></c:import>
<title>${board} Insert2</title>

<!-- summerNote  -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<style>

	/* Page 이름 */
	#title_center{
		margin: 6% 0 0 0;
		text-align: center;
		font-size: 14px;
		font-weight: 500;
		text-transform: uppercase;
	}


	/* div에 border 및 cell-padding */
	#table-div{
		margin-left: auto; margin-right: auto;
		margin-top: 4%;
		width: 75%;
		height: auto;
		padding: 2%;
	}
	
	/* 버튼이 들어있는 div */
	#botton-div{
		margin-top: 5%;
		margin-bottom: 1%;
		margin-left: 0.8%;
	}
	
	/* button css */
	.button-style{
		border: 1px solid black;
		padding: 0.8% 2.5% 0.8% 2.5%;
		background-color:black;
		color: white;
	}
	
	/* 선택한 상품 이미지 */
	.prdImg-size{
		width: 10px;
		height: 10px;
	}
	
	/* 내부 div padding */
	.div-padding{
		padding: 2%;
	}
	
	/* input 폼 size */
	.input-size{
		width: 40%;
		height: auto;
		font-size: 15pt;
	}
	
	/* input 폼 line */
	.input-line{
		border: 0.8px solid #c4c4c4;
		margin-left: 3%;
	}
	
	.div-boarder{
		border-top: 1px solid black;
	}
	

</style>

</head>
<body>

	<!-- header -->
	<div id="header">
		<c:import url="../template/header.jsp"></c:import>
	</div>
	
	<!-- title -->
	<p id="title_center">${board}</p>
	
	
	<!-- Board Insert Contents -->
	<!--  enctype="multipart/form-data" : notice만 테스트할 때는 빼서 사용 -->
	<form id="form" action="./${board}Insert" method="post" enctype="multipart/form-data">
	
		<div id="table-div">
		
			<!-- review or qna 할 상품 선택 -->
			<div class="div-padding div-boarder">
				<img src="../resources/images/prdNoImg.gif" alter="NoImg" id="img-size" />
				<a href="#" class="button-style">상품정보선택</a>
				
				<!-- 상품정보선택 -->
				<a href="./productSelect.jsp" 
					onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">
				</a>
			</div>
			
			<!-- subject, contents insert 부분 -->
			<div style="border-top: 0.8px solid black; padding: 2%;">
			
				<ul>
					<li><input type="hidden" name="num" value="${dto.num}"></li>
					<li>
						<label for="title" style="font-size: 9pt;">TITLE</label> 
						<input type="text" class="input-size input-line"
						id="title" name="title">
					</li>
					
					<!-- contents -->
					<li>
						<label for="contents">CONTENTS</label>
						<textarea class="myCheck" id="contents"
						name="contents"></textarea>
					</li>
						
					<li>
						<label for="password" style="font-size: 9pt;">PASSWORD</label> 
						<input type="password" class="input-size input-line"
						id="password" name="password">
					</li>
				</ul>
			
			</div>
			
			<div>
				<div id="botton-div">
					<a href="./${board}List" class="button-style" id="btn">LIST</a>
				</div>
				
				<div id="botton-div">
					<a href="./${board}List" class="button-style" id="btn">CANCEL</a>
					<input type="submit" value="OK!" class="button-style" id="btn">
				</div>
			</div>
	
		</div>
		
		
		
	</form>
	
	<!-- footer -->
	<c:import url="../template/footer.jsp"></c:import>
	
	

</body>

<!------------------------------- CSS & JavaScript -------------------------------------->
<link rel="stylesheet" href="../resources/css/common.css">
<script type="text/javascript" src="../resources/js/common.js"></script>
<script type="text/javascript" src="../resources/js/main.js"></script>
<script type="text/javascript" src="../resources/jquery/dropdown.js"></script>

</html>