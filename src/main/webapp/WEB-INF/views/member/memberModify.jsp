<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="wrap">
		<div id="header">
			<c:import url="../template/header.jsp"></c:import>
		</div>
		<!-- header END --> 
		<div id="container">
			<div id="contents">
				<form id="modifyform" action="./memberModify" method="post" enctype="multipart/form-data">
				<div class="form-group">
				<label for="id">ID</label> 
				<input type="text" class="form-control" id="id" name="id" readonly="readonly" value="${member.id}"> 
			</div>
			<div class="form-group">
				<label for="pw">PW</label> 
				<input type="password" class="form-control" id="pw" name="pw" value="${member.pw}">
			</div>
			<div class="form-group">
				<label for="name">NAME</label> 
				<input type="text" class="form-control etc" id="name" name="name" value="${member.name}">
			</div>
			<div class="form-group">
				<label for="phone">MOBILE</label> 
				<input type="text" class="form-control etc" id="phone" name="phone" value="${member.phone}">
			</div>
			<div class="form-group">
				<label for="email">E-MAIL</label> 
				<input type="text" class="form-control etc" id="email" name="email" value="${member.email}">
			</div>
			<input type="submit" id ="btn" value="Update" class="btn btn-primary">
			<a href="./memberDelete" class="btn btn-info">Delete</a>
		</form>
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