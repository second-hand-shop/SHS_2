<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<c:import url="../template/bootStrap.jsp"></c:import>
<title>${board} Select</title>

<!-- summernote  -->
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
		margin-top: 1%;
		width: 75%;
		height: auto;
		padding: 2%;
	}
	
	/* 버튼이 들어있는 div */
	.botton-div{
		margin-top: 2%;
		margin-bottom: 1%;
		margin-left: 0.8%;
	}
	
	/* button css */
	.button-style{
		border: 1px solid black;
		padding: 1.3% 6% 1.3% 6%;
		background-color: black;
		color: white;
	}
	
	/* prd select button css */
	.prdButton-style{
		border: 0.8px solid #adadad;
		padding: 0.5% 2% 0.5% 2%;
		background-color: white;
		color: #adadad;
		font-size: 5pt;
	}
	
	/* 선택한 상품 이미지 */
	#prdImg-size{
		width: 10%;
		height: 20%;
		float: left;
	}
	
	#prdImg{
		width: 100%;
		height: auto;
	}
	
	/* 내부 div padding */
	.div-padding{
		padding-top: 2%;
		padding-bottom: 7%;
		padding-left: 2%;
	}
	
	/* input 폼 size */
	.writer-input-size{
		width: 40%;
		height: auto;
		font-size: 9pt;
		margin-left: 8.5%;
	}
	
	/* input 폼 size */
	.title-input-size{
		width: 40%;
		height: auto;
		font-size: 9pt;
		margin-left: 10%;
	}
	
	/* input 폼 size */
	.pw-input-size{
		width: 15%;
		height: auto;
		font-size: 9pt;
		margin-left: 6%;
	}
	
	/* input 폼 line */
	.input-line{
		border: 0.8px solid #c4c4c4;
	}
	
	.li-line{
		border-top: 0.8px solid #c4c4c4;
	}
	
	.div-boarder{
		border-top: 1px solid black;
	}
	
	.input-border{
		border-top: 0.8px solid black; 
		border-bottom: 1px solid black;
		padding: 2% 2% 0 2%;
	}
	
	/* button : 왼쪽 div */
	.div-left{
		width: 50%;
		height: auto;
		float: left;
	}
	
	/* button : 오른쪽 div */
	.div-right{
		width: 50%;
		height: auto;
		float: right;

	}
	
	.li-padding{
		padding-top: 1%;
		padding-bottom: 1%;
	}
	
	.radio-margin{
		margin-left: 8%;
	}
	

</style>

</head>
<body>

	<!-- header -->
	<div id="header">
		<c:import url="../template/header.jsp"></c:import>
	</div>
	
	
	<!-- Reply Insert Contents -->
	<form id="form" action="./${board}Reply" method="post">
	
		<div id="table-div">
			
			<!-- insert 부분 -->
			<div class="input-border">
			
				<ul>
				
					<li><input type="hidden" name="num" value="${param.num}"></li>
					
									
					<c:if test="${board ne 'notice'}">
						<li><input type="hidden" name="productNum" value="${param.productNum}"></li>
					</c:if>
					
					<!-- 글쓴이 입력 -->
					<li style="margin-bottom: 1%;">
						<label for="writer" style="font-size: 9pt;">WRITER</label> 
						<input type="text" class="writer-input-size input-line"
						id="writer" name="writer">
					</li>
					
					<!-- 제목 입력 -->
					<li class="li-line">
						<label for="title" style="font-size: 9pt; margin-top:1%;">TITLE</label> 
						<input type="text" class="title-input-size input-line"
						id="title" name="title">
					</li>
					
					<!-- contents -->
					<li style="margin-bottom: 1%;">
						<label for="contents"></label>
						<textarea id="contents"
						name="contents"></textarea>
					</li>
					
					<!-- PW 입력 -->
 					<c:if test="${board ne 'notice'}">
						<li class="li-padding">
							<label for="password" style="font-size: 9pt;">PASSWORD</label> 
							<input type="password" class="pw-input-size input-line"
							id="boardPw" name="boardPw">
						</li>
					</c:if>
					
					<!-- 비밀글 / 공개글 설정 -->
					<c:if test="${board eq 'qna'}">
						<li class="li-padding">
							<label for="pwSet" style="font-size: 9pt;">P/W SET</label>
							<input type="radio" class="radio-margin" name="pwSet" value="공개글" checked="checked"/> 공개글
							<input type="radio" name="pwSet" value="비밀글"/> 비밀글				
						</li>
					</c:if>
					
				</ul>
			
			</div>
			
			<div class="botton-div">
				<div class="div-left" >
					<input type="button" value="LIST" class="button-style" id="btn" onClick="location.href='./${board}List'">
				</div>
				
				<div class="div-right" align="right">	
					<input type="button" value="CANCEL" class="button-style" id="btn" onClick="location.href='./${board}List'">
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
<script type="text/javascript" src="../resources/jquery/summerFile.js?var=1"></script>


</html>