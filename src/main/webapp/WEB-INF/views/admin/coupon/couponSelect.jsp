<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>couponSelect</title>
</head>
<body>
	<!--------------------- header ---------------------------------------------------->
	<!--------------------- header ---------------------------------------------------->
	<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="${pageContext.request.contextPath}">Site
			Main</a>
		<button class="navbar-toggler position-absolute d-md-none collapsed" type="button"
			data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu"
			aria-expanded="false" aria-label="Toggle navigation"
		>
			<span class="navbar-toggler-icon"></span>
		</button>
		<input class="form-control form-control-dark w-100" type="text" placeholder="Search"
			aria-label="Search"
		>
		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap"><a class="nav-link" href="#">Sign out</a></li>
		</ul>
	</header>
	<!--------------------- header ---------------------------------------------------->
	<!--------------------- header ---------------------------------------------------->
	<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="position-sticky pt-3">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active" aria-current="page" href="#"> <span
								data-feather="home"
							></span> Admin Home
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span data-feather="package"></span>
								Orders <!-- 주문정보 모아보기 -->
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span data-feather="shopping-cart"></span>
								Products <!-- 상품리스트 -->
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span data-feather="users"></span>
								Customers <!-- 회원정보 모아보기 -->
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="message-square"
							></span> Messages
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span data-feather="dollar-sign"></span>
								Ledgers
						</a></li>
						<li class="nav-item"><a class="nav-link" href="../coupon/couponList"> <span
								data-feather="percent"
							></span> Coupons
						</a></li>
					</ul>

					<h6
						class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
					>
						<span>Saved reports</span> <a class="link-secondary" href="#" aria-label="Add a new report">
							<span data-feather="plus-circle"></span>
						</a>
					</h6>
					<ul class="nav flex-column mb-2">
						<li class="nav-item"><a class="nav-link" href="#"> <span data-feather="file-text"></span>
								Current month
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span data-feather="file-text"></span>
								Last quarter
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span data-feather="file-text"></span>
								Social engagement
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span data-feather="file-text"></span>
								Year-end sale
						</a></li>
					</ul>
				</div>
			</nav>
			<!-------------------------- navbar END ---------------------------------->
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<h2>${DTO.couponNum }</h2>
				<h2>${DTO.id }</h2>
				<h2>${DTO.disRate }</h2>
				<h2>${DTO.disPrice }</h2>
				<h2>${DTO.usage }</h2>
				<!-------- table END --------------->
				<input type="button" class="btn btn-primary" id="addBtn" value="UPDATE">
				<!-------- ????????????????????????????? --------------->
			</main>
		</div>
	</div>

<script src="/docs/5.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script><script src="dashboard.js"></script>
<script type="text/javascript" src="../resources/js/admin/adminHome.js"></script>
</body>
</html>