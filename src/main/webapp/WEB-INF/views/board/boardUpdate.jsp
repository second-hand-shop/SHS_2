<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<title>${board} Update</title>

<style>

	/* div에 border 및 cell-padding */
	#table-border{
		margin-left: auto; margin-right: auto;
		margin-top: 4%;
		width: 75%;
		height: auto;
		padding: 2%;
		
	}
	
	/* table 처럼 보이게 하기 위해서 li 하단에 선 추가 */
	.lines{
		border-width: 80%;
		padding: 1%;
	}
	
	/* li 첫번째 줄 css */
	li:nth-child(1){
		font-size: 13pt;
		font-weight: 400;
	}
	
	/* li 네번째 줄 css */
	li:nth-child(4){
		padding-top: 2%;
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
	}
	
	

</style>

</head>
<body>

	<!-- header -->
	<div id="header">
		<c:import url="../template/header.jsp"></c:import>
	</div>
	
	<!-- Notice Update Contents -->
	<!--  enctype="multipart/form-data" : notice에는 text만 넘어감 아직 빼기 -->
	<form id="form" action="./${board}Update" method="post" enctype="multipart/form-data">	
	
		<div id="table-border" style="border: 1px solid #d3d3d3;">	
			<ul>
				<li><input type="hidden" name="num" value="${param.num}"></li>
				
				<li class="lines" style="border-bottom: 1px solid #d3d3d3;">
					<input type="text" class="form-control"
					id="title" name="title" value="${dto.title}" aria-describedby="titleHelp">
				</li>
				
				<li class="lines" style="border-bottom: 1px solid #d3d3d3;">
					<input type="text"
					class="form-control" readonly="readonly" id="writer" name="writer" value="${dto.writer}">
					<span style="float: right;">
						<input type="text" readonly="readonly"  name="regdate" value="${dto.regdate}">
					</span>
				</li>
				
				<li class="lines" style="border-bottom: 1px solid #d3d3d3;">
					<label for="hit">Hit</label> 
				</li>
				
				<li class="lines">
					<textarea class="form-control" rows="5" name="contents" id="contents" row="5">
					${dto.contents}
				</textarea>
				</li>
			
			</ul>
			
			<div id="botton-div">
				<input type="submit" value="수정" class="button-style" id="btn">
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