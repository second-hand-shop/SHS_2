<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<!-- header END -->
		<div id="container">
			<div id="contents">
				<h2>REGISTER</h2>
				<form id="joinform" action="./memberJoin" method="post"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="id">ID</label> <input type="text" class="form-control"
							id="id" name="id" aria-describedby="idHelp">
						<h2 id="idResult"></h2>
					</div>
					<div class="form-group">
						<label for="pw">PW</label> <input type="password"
							class="form-control" id="pw" name="pw">
						<h2 id="pwResult"></h2>
					</div>
					<div class="form-group">
						<label for="pw">PW CHECK</label> <input type="password"
							class="form-control" id="pw2">
					</div>
					<div class="form-group">
						<label for="name">NAME</label> <input type="text"
							class="form-control etc" id="name" name="name">
					</div>
					<div class="form-group">
						<label for="phone">MOBILE</label> <input type="text"
							class="form-control etc" id="phone" name="phone">
					</div>
					<div class="form-group">
						<label for="email">E-MAIL</label> <input type="text"
							class="form-control etc" id="email" name="email">
					</div>

					<input type="submit" id="btn" value="JOIN" class="btn btn-primary">
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
<script type="text/javascript" src="../resources/js/memberJoin.js"></script>
</html>