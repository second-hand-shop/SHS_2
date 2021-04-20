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
	
	/* 2번째 줄 정렬 */
	td:nth-child(2){
		text-align: left;
	}
	
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
			<th class="lines" width="69%">SUBJECT</td>
			<th class="lines" width="9%">WRITER</td>
			<th class="lines" width="9%">DATE</td>
			<th class="lines" width="9%">HIT</td>
		</tr>
		
		<c:forEach items="${list}" var="dto">
			<tr>
				<td class="lines">${dto.num}</td>
				<td class="lines"><a href="./${board}Select?num=${dto.num}">${dto.title}</a></td>
				<td class="lines">${dto.writer}</td>
				<td class="lines">${dto.regdate}</td>
				<td class="lines">${dto.hit}</td>
			</tr>
		</c:forEach>
		
		<tr>
			<td class="lines" colspan="5">
				
				<div class="container size">
					  
					  <div class="input-group mt-3 mb-3 first-size">
						  <form id="frm" action="./${board}List" class="form-inline">
							  <input type="hidden" name="curPage" value="1" id="curPage">
						  
						  	  <div class="input-group-prepend">
						  	  
						   		  <select class="form-control" name="kind" id="kind" >					   		  
									    <option class="sel">Title</option>
									    <option class="sel">Contents</option>
									    <option class="sel">Writer</option>								    
						 		  </select>
						 		  
						  	  </div>
						  	  
						  	  <input type="text" class="form-control" name="search" id="search" value="${pager.search}" placeholder="">
						    
						      <div class="input-group-append">
						    	  <button class="btn btn-success" type="submit">Search</button>
						  	  </div>
					 	  </form> 
					  </div>
					  
					  <div class="second-size">
						  <ul class="pagination">
						  
							  <c:if test="${pager.pre}">	
							    <li class="page-item"><a class="page-link p" href="#" title="${pager.startNum-1}">Previous</a></li>
							  </c:if>
						   
						   	  <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						   		<li class="page-item"><a class="page-link p" href="#" title="${i}">${i}</a></li>
						   	  </c:forEach>
						   
						      <c:if test="${pager.next}">
						      	<li class="page-item"><a class="page-link p" href="#" title="${pager.lastNum+1}">Next</a></li>
						      </c:if>
						      
						  </ul>
					  </div>
					  
					  <div id="botton-div">
							<a href="./${board}Insert?num=${dto.num}" class="button-style">작성</a>
					  </div>
					
					
					  <script type="text/javascript">
					  
							let kind= '${pager.kind}';//Title, Writer, Contents
							$(".sel").each(function() {
								let t = $(this).text();//Title, Writer, Contents
								if(t == kind){
									$(this).prop("selected", true);
								}
							});
							
							$(".p").click(function () {
								let curPage = $(this).attr("title");
								$("#curPage").val(curPage);
								let search= '${pager.search}';
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