<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<c:import url="../template/bootStrap.jsp"></c:import>
<title>${board} Select</title>


<style>

	/* div에 border 및 cell-padding */
	#table-border{
		margin-left: auto; 
		margin-right: auto;
		margin-top: 4%;
		width: 75%;
		height: auto;
		padding: 2%;
		text-align: left;
	}
	
	/* table 처럼 보이게 하기 위해서 li 하단에 선 추가 */
	.lines{
		border-width: 80%;
		padding: 1%;
	}
	
	/* li 첫번째 줄 css */
	.writer-font{
		font-size: 10pt;
		font-weight: 500;
	}
	
	.title-font{
		font-size: 11pt;
		font-weight: 400;
	}
	
	/* li 네번째 줄 css */
	#table-border li:nth-child(4){
		padding-top: 2%;
	}

	
	/* 버튼이 들어있는 div */
	.botton-div{
		margin-top: 5%;
		margin-bottom: 1%;
		margin-left: 0.8%;
	}
	
	/* button css */
	.button-style{
		border: 1px solid black;
		padding: 0.8% 2.5% 0.8% 2.5%;
		font-size: 9pt;
	}
	
	.li-border{
		border-bottom: 1px solid #d3d3d3;
		text-align:left;
	}
	
	
	/* button css */
	.comment-button-style{
		border: 1px solid #adadad;
		padding: 0.4% 2% 0.4% 2%;
		font-size: 9pt;
		color: #adadad;
	}
	
	.comment-write-button{
		border: 1px solid black;
		padding: 2% 3% 2% 3%;
		font-size: 9pt;
		background-color: white;
	}


	
</style>

</head>
<body>

	<!-- header -->
	<div id="header">
		<c:import url="../template/header.jsp"></c:import>
	</div>
	
	
	<c:if test="${board ne 'notice'}">
		<div id="table-border" style="border: 1px solid #d3d3d3;">
			PRODUCT IMG 불러오기
		</div>
	</c:if>
	
	<!-- review -->
	<div id="table-border" style="border: 1px solid #d3d3d3;">
	
		<ul>
		
			<li class="lines title-font" style="border-bottom: 1px solid #d3d3d3;"> ${dto.title} </li>
			
			<li class="lines" style="border-bottom: 1px solid #d3d3d3;">
				${dto.writer}
				<span style="float: right;">${dto.regdate}</span>
			</li>
			
			<li class="lines" style="border-bottom: 1px solid #d3d3d3;"> HIT ${dto.hit} </li>
			
			<li class="lines"> ${dto.contents} </li>
		
		</ul>
		
		<div class="botton-div">
			<a href="./${board}List" class="button-style">목록</a>
			<a href="./${board}Update?num=${dto.num}" class="button-style">수정</a>
			<a href="./${board}Delete?num=${dto.num}" class="button-style">삭제</a>
			
			<c:if test="${board eq 'qna'}">
				<a href="./${board}Reply?num=${dto.num}&&productNum=${dto.productNum}" class="button-style">답글</a>
			</c:if>

		</div>
	
	</div>
	
	
	<!-- comments 보여주기 -->
	<c:if test="${board eq 'review'}">
		<c:if test="${comments ne null}">
		<div id="table-border" style="border: 1px solid #d3d3d3; text-align: center;">					
			<ul>					
				<li class="lines li-border writer-font">
					${comments.writer}				
					<span style="font-size: 9pt; font-weight: 400;">${comments.regDate}</span>
					<!-- float:right를 쓰면 쭉 밀려서 버튼이 깨짐,
					 display를 block으로 바꾸고 text-align:center를 주면
					 div처럼 공간잡혀서 한줄 밑으로 내려감
					 현재, 강제로 margin으로 밈 -->
					<span class="botton-div" style="margin-left: 65%;">
					
						<!-- 클릭 시 update 폼 생성 -->
						<a href="#" class="comment-button-style">MODIFY</a>				
						<a href="../comments/commentsResult?num=${comments.num}" class="comment-button-style">DELETE</a>
					</span>
				</li>
				
				<li class="lines" style="text-align:left;"> ${comments.contents} </li>						
			</ul>					
		</div>
		</c:if>
	
		<!-- comments 입력폼 -->
		<c:if test="${comments eq null}">
			<form id="form" action="../comments/commentsInsert?num=${dto.num}" method="post">
				<div id="table-border" style="border: 1px solid #d3d3d3;">					
						<ul>
							<li><input type="hidden" name="reviewNum" value="${dto.num}"></li>
									
							<li style="margin-bottom: 1%; border-bottom: 1px solid black; width: 25%">
								<label for="writer" style="font-size: 9pt;">WRITER</label> 
								<input type="text" id="writer" name="writer" placeholder="ID" 
								style="border:none; font-size: 9pt; margin-bottom: 2%; margin-left: 1%">
							</li>
							
							<li>
								<label for="contents"></label>
								<textarea id="contents"
								name="contents" cols="3"></textarea>
								
								<button type="submit" class="comment-write-button" id="write">OK!</button>
							</li>
		
						</ul>					
				</div>
			</form>
		</c:if>
		
	</c:if>
	
	<!-- footer -->
	<c:import url="../template/footer.jsp"></c:import>

</body>

<!------------------------------- CSS & JavaScript -------------------------------------->
<link rel="stylesheet" href="../resources/css/common.css">
<script type="text/javascript" src="../resources/js/common.js"></script>
<script type="text/javascript" src="../resources/js/main.js"></script>
<script type="text/javascript" src="../resources/jquery/dropdown.js"></script>

</html>