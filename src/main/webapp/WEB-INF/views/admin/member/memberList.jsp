<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	tbody tr td input {
		width: 70%;
	}
</style>
  <c:import url="../../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>memberList</title>
</head>
<body><!--------------------- header ---------------------------------------------------->
<!--------------------- header ---------------------------------------------------->
<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="${pageContext.request.contextPath}">Site Main</a>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
  <ul class="navbar-nav px-3">
    <li class="nav-item text-nowrap">
      <a class="nav-link" href="#">Sign out</a>
    </li>
  </ul>
</header>
<!--------------------- header ---------------------------------------------------->
<!--------------------- header ---------------------------------------------------->
<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/admin/adminHome">
              <span data-feather="home"></span>
              Admin Home
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/admin/orderInfo/orderList">
              <span data-feather="package"></span>
              Orders <!-- ???????????? ???????????? -->
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/product/productList">
              <span data-feather="shopping-cart"></span>
              Products <!-- ??????????????? -->
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/admin/member/memberList">
              <span data-feather="users"></span>
              Members <!-- ???????????? ???????????? -->
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/qna/qnaList"> <!-- QnA??? -->
              <span data-feather="message-square"></span>
              Board
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="dollar-sign"></span>
              Ledgers
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/admin/coupon/couponList">
              <span data-feather="percent"></span>
              Coupons
            </a>
          </li>
        </ul>
      </div>
    </nav>
 <!-------------------------- navbar END ---------------------------------->
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	<h2>?????? ??????</h2>
	<div class="btn-group btn-group-toggle" data-toggle="buttons">
		  <label class="btn btn-light active">
		    <input type="radio" name="options" id="member-btn" checked> ??????
		  </label>
		  <label class="btn btn-light">
		    <input type="radio" name="options" id="xMember-btn">?????????
		  </label>
	</div>
	<div class="table-responsive">
		<table class="table table-striped table-sm">
			<thead>
				<tr>
					<th>ID</th>
					<th>PW</th>
					<th>??????</th>
					<th>????????????</th>
					<th>?????????</th>
					<th>+ / -</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="DTO">
					<c:if test="${DTO.id!='admin' }">
						<tr>
							<td><a href="#" class="idSelect" title="${DTO.id }">${DTO.id }</a></td>
							<td class="pw-hide" title="${DTO.pw }">${DTO.pw }</td>
							<td>${DTO.name }</td>
							<td>${DTO.phone }</td>
							<td>${DTO.email }</td>
							<td><input type="checkbox" name="deleteCheck" class="check" title="${DTO.id }"></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!--------------------------- Paging ----------------------------------->
	<!--------------------------- Paging ----------------------------------->
	<div class="container">
		<ul class="pagination">
			<c:if test="${pager.previous }">
				<li class="page-item"><a class="page-link p" href="#" title="${pager.startPage-1 }">Previous</a></li>
			</c:if>
			<c:forEach begin="${pager.startPage }" end="${pager.lastPage }" var="i">
				<li class="page-item"><a class="page-link p" href="#" title="${i}">${i }</a></li>
			</c:forEach>
			<c:if test="${pager.next }">
				<li class="page-item"><a class="page-link p" href="#" title="${pager.lastPage+1}">Next</a></li>
			</c:if>
		</ul>
		<div class="input-group mt-3 mb-3">
			<form action="./memberList" id="frm" class="form-inline">
				<input type="hidden" id="curPage" name="curPage" value="1">
				<div class="input-group-prepend">
					<select class="form-control" id="kind" name="kind">
						<option class="sel">ID</option>
						<option class="sel">????????????</option>
						<option class="sel">?????????</option>
					</select>
				</div>
				<input type="text" class="form-control" id="search" name="search" value="${pager.search }">
				<div class="input-group-append">
					<button class="btn btn-success" type="submit">Search</button>
				</div>
			</form>
		</div>
	</div>
	<!--------------------------- Paging END ----------------------------------->
	<!--------------------------- Paging END ----------------------------------->
	</main>
	</div>
</div>
<script type="text/javascript" src="../../resources/jquery/admin/member/memberList.js"></script>
<script src="/docs/5.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
<script type="text/javascript" src="../../resources/js/admin/adminHome.js"></script>
<script type="text/javascript">
	/*================= Pager ==============*/
	let kind = '${pager.kind}';
	$(".sel").each(function(){
		let t = $(this).text();
		if(t==kind){
			$(this).prop("selected", true);
		}
	});
	
	$(".p").click(function(){
		let curPage=$(this).attr("title");
		$("#curPage").attr("value", curPage);
		let search = '${pager.search}';
		$("#frm").submit();
	});
	
</script>
</body>
</html>