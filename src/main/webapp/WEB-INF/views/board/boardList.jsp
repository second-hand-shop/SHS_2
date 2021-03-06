<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<title>${board} List</title>

<style>
	
	/* Page 이름 */
	#title_center{
		margin: 6% 0 0 0;
		text-align: center;
		font-size: 14px;
		font-weight: 500;
		text-transform: uppercase;
	}
	
	/* table 전체 */
	#line{
		margin-left: auto; margin-right: auto;
		margin-top: 4%;
		width: 75%;
		border: 1px solid #d3d3d3;
	}
	
	/* table 내부 선, cell-padding, 글자 정렬 */
	.lines{
		border: 1px solid #d3d3d3;	
		padding: 1%;
		text-align: center;
	}
	
	/* 2번째(notice:subject && qna:productImage) 줄 정렬 */
	td:nth-child(2){
		text-align: left;
	}
	
	/* qna의 경우 3번째(qna:subject) 줄 정렬 */
	<c:if test="${board ne 'notice'}">
		td:nth-child(3){
			text-align: left;
		}
	</c:if>
	
	/* th 글자 굵기와 정렬 */
	th{
		text-align: center;
		font-weight: 400;
	}
	
	/* 공지 작성 버튼이 들어있는 div */
	#botton-div{
		margin-top: 1%;
		margin-bottom: 5%;
		margin-left: 5%;
		margin-right: 2%;
	}
	
	/* 공지 작성 button css */
	.button-style{
		float: right;
		border: 1px solid black;
		padding: 0.8% 2.5% 0.8% 2.5%;
		background-color: black;
		color: white;
	}
	
	/* 2개의 div 절반으로 나누기 */
	.size{
		width: 100%;
		vertical-align: middle;
	}
	
	.first-size{
		width: 50%;
		float: left;
	}
	
	.second-size{
		width: 50%;
		float: right;
	}

	.img-size{
		width:2.5%;
		height:auto;
		vertical-align: middle;
	}
	
	.search-size{
		width: 10%;
	}
	
	.search{
		width: 10%;
	}
	
	.search-input-line{
		border: 0.8px solid #c4c4c4;
		font-size: 11pt;
	}




</style>

</head>
<body>
	
	<!-- header -->
	<div id="header">
			<c:import url="../template/header.jsp"></c:import>
	</div>

	
	<p id="title_center">${board}</p>
	
	<table id="line">
		<tr>
			<th class="lines" width="4%">NO</td>
			
			<c:if test="${board ne 'notice'}">
				<th class="lines" width="8%">PRODUCT</td>
			</c:if>
			
			<th class="lines" width="60%">SUBJECT</td>
			<th class="lines" width="8%">WRITER</td>
			<th class="lines" width="8%">DATE</td>
			<th class="lines" width="8%">HIT</td>
		</tr>
		
		
			<c:forEach items="${list}" var="dto">
				<tr>						
					<td class="lines">	
						${dto.num}					
					</td>	   
					
					<c:if test="${board ne 'notice'}">
						<td class="lines"><!-- product이미지 들어올자리 --></td>
					</c:if>
					
					<td class="lines"><a href="
					<c:if test="${board eq 'qna' && dto.pwSet eq 'Y'}">../comments/commentsResult?num=${dto.num}&&name=qnaList</c:if>
					<c:if test="${board ne 'qna' || dto.pwSet eq 'N'}">../${board}/${board}Select?num=${dto.num}<c:if test="${board eq 'review'}">&&reviewNum=${dto.num}</c:if></c:if>">
				
						<!-- depth부분 -->
						<c:catch>
							<c:forEach begin="1" end="${dto.depth}">
							&ensp;<img src="../resources/images/curvedArrow2.png" alter="답변" class="img-size" />
							</c:forEach>
						</c:catch>
						
						<c:if test="${dto.pwSet eq 'Y'}">
							<img src="../resources/images/lock.png" alter="자물쇠" class="img-size" />
						</c:if>
						
						${dto.title}</a>
					
					</td>
					
					<td class="lines">${dto.writer}</td>
					<td class="lines">${dto.regdate}</td>
					<td class="lines">${dto.hit}</td>
				</tr>
			</c:forEach>
		
			<c:if test="${empty list}">
			<tr>
				<td colspan="6" class="lines"><p>작성하신 글이 없습니다.</p></td>		
			</tr>	
		 </c:if>
		
		<tr>
			<td class="lines" colspan="6">
				
				<div class="container size">
					  
					  <div class="input-group mt-3 mb-3 first-size">
						  <form id="frm" action="./${board}List" class="form-inline">
							  <input type="hidden" name="curPage" value="1" id="curPage">
						  
						  	  <div>
						  	  
						   		  <select name="kind" id="kind" >					   		  
									    <option class="select">제목</option>
									    <option class="select">내용</option>
									    <option class="select">글쓴이</option>								    
						 		  </select>
						 		  
						  	  </div>
						  	  
						  	  <input type="text" class="search-input-line" style="margin-left: 2%;" name="search" id="search" value="${boardPager.search}">
						    
						      <div class="search-size">
						    	  <input type="image" name="submit" value="submit" class="search" style="width: 35%; height: 35%; margin-left:1%;" src="../resources/images/search.png" alt="search">
						  	  </div>
					 	  </form> 
					  </div>
					  
					  <!-- 검색 결과가 없으면 pager 안보이게 -->
					  <c:if test="${totalCount ne 0}">
						  <div class="second-size">
							  <ul class="pagination">
							  
								  <c:if test="${boardPager.pre}">	
								    <li class="page-item"><a class="page-link p" href="#" title="${boardPager.startNum-1}">Previous</a></li>
								  </c:if>
							   
							   	  <c:forEach begin="${boardPager.startNum}" end="${boardPager.lastNum}" var="i">
							   		<li class="page-item"><a class="page-link p" href="#" title="${i}">${i}</a></li>
							   	  </c:forEach>
							   
							      <c:if test="${boardPager.next}">
							      	<li class="page-item"><a class="page-link p" href="#" title="${boardPager.lastNum+1}">Next</a></li>
							      </c:if>
							      
							  </ul>
						  </div>
					  </c:if>
					  

						  <div id="botton-div">
								<a href="./${board}Insert<c:if test="${board ne 'notice'}">?productNum=3</c:if><c:if test="${board eq 'review'}">&&num=${num}</c:if>" class="button-style">WRITE</a>
						  </div>

					
					
					  <script type="text/javascript">
					  
 							let kind= '${boardPager.kind}';//Title, Writer, Contents
 							console.log(kind);
 							
							$(".select").each(function() {
								let select = $(this).text();//Title, Writer, Contents
								if(select == kind){
									$(this).prop("selected", true);
								}
							});
							
							$(".p").click(function () {
								let curPage = $(this).attr("title");
								$("#curPage").val(curPage);
								let search = '${boardPager.search}';
								$("#frm").submit();
		
							});
							
					  </script>  
				</div>
				
			</td>
			
		</tr>
		
	</table>
	
	
	<!-- footer -->
	<c:import url="../template/footer.jsp"></c:import>

</body>

<!------------------------------- CSS & JavaScript -------------------------------------->
<link rel="stylesheet" href="../resources/css/common.css">
<script type="text/javascript" src="../resources/js/common.js"></script>
<script type="text/javascript" src="../resources/js/main.js"></script>
<script type="text/javascript" src="../resources/jquery/dropdown.js"></script>

</html>