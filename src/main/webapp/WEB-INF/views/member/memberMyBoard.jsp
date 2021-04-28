<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>	
	/* Page �̸� */
	#title_center{
		margin: 6% 0 0 0;
		text-align: center;
		font-size: 14px;
		font-weight: 500;
		text-transform: uppercase;
	}
	
	/* table ��ü */
	#line{
		margin-left: auto; margin-right: auto;
		margin-top: 4%;
		width: 75%;
		border: 1px solid #d3d3d3;
	}
	
	/* table ���� ��, cell-padding, ���� ���� */
	.lines{
		border: 1px solid #d3d3d3;	
		padding: 1%;
		text-align: center;
	}
	
	/* 2��°(notice:subject && qna:productImage) �� ���� */
	td:nth-child(2){
		text-align: left;
	}
	
	/* qna�� ��� 3��°(qna:subject) �� ���� */
	<c:if test="${board eq 'qna'}">
		td:nth-child(3){
			text-align: left;
		}
	</c:if>
	
	/* th ���� ����� ���� */
	th{
		text-align: center;
		font-weight: 400;
	}
	
	/* ���� �ۼ� ��ư�� ����ִ� div */
	#botton-div{
		margin-top: 1%;
		margin-bottom: 5%;
		margin-left: 5%;
		margin-right: 2%;
	}
	
	/* ���� �ۼ� button css */
	.button-style{
		float: right;
		border: 1px solid black;
		padding: 0.8% 2.5% 0.8% 2.5%;
	}
	
	/* 2���� div �������� ������ */
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
</style>

</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../template/header.jsp"></c:import>
		</div>
		<!-- header END -->
	
		<p id="title_center">${board}</p>
	
	<table id="line">
		<tr>
			<th class="lines" width="4%">NO</th>
			
			<c:if test="${board eq 'qna'}">
				<th class="lines" width="8%">PRODUCT</th>
			</c:if>
			
			<th class="lines" width="60%">SUBJECT</th>
			<th class="lines" width="8%">WRITER</th>
			<th class="lines" width="8%">DATE</th>
			<th class="lines" width="8%">HIT</th>
		</tr>
		
		<c:forEach items="${list}" var="dto">
			<tr>
				<td class="lines">${dto.num}</td>
				
				<c:if test="${board eq 'qna'}">
					<td class="lines"><!-- product�̹��� �����ڸ� --></td>
				</c:if>
				
				<!-- �����ڿ� �Ϲ����� �����ϴ� id�� �Ѱ��ֱ� �߰� -->
				<td class="lines"><a href="./${board}Select?num=${dto.num}">
			
				<!-- depth�κ� -->
				<c:catch>
					<c:forEach begin="1" end="${dto.depth}">
					&ensp;<img src="../resources/images/curvedArrow2.png" alter="�亯" class="img-size" />
					</c:forEach>
				</c:catch>
				${dto.title}</a></td>
				
				<td class="lines">${dto.writer}</td>
				<td class="lines">${dto.regdate}</td>
				<td class="lines">${dto.hit}</td>
			</tr>
		</c:forEach>
		
		
	</table>
		
		<!-- footer -->
			<c:import url="../template/footer.jsp"></c:import>
	</div>
</body>
<!------------------------------- CSS & JavaScript -------------------------------------->
<link rel="stylesheet" href="../resources/css/common.css">
<script type="text/javascript" src="../resources/js/common.js"></script>
<script type="text/javascript" src="../resources/js/main.js"></script>
<script type="text/javascript" src="../resources/jquery/dropdown.js"></script>
</html>