<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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

		<div class="container mt-2">
			<form action="./memberLogin" method="post">
				<div class="form-group">
					<label for="id">ID</label> <input type="text" class="form-control" id="id" name="id" aria-describedby="idlHelp"> 
				</div>
				<div class="form-group">
					<label for="pw">Password</label> <input type="password" class="form-control" id="pw" name="pw">
				</div>
				<button type="submit" id="btn_login" class="btn btn-primary">Submit</button>
			</form>
		</div>

		<!-- footer -->
		<c:import url="../template/footer.jsp"></c:import>
	</div>
</body>
<!------------------------------- CSS & JavaScript -------------------------------------->
<link rel="stylesheet" href="../resources/css/common.css">
<script type="text/javascript" src="../resources/js/common.js"></script>
<script type="text/javascript" src="../resources/js/main.js"></script>
<script type="text/javascript" src="../resources/jquery/dropdown.js"></script>
<script type="text/javascript" src="./resources/jquery/memberLogin.js"></script>
</html>