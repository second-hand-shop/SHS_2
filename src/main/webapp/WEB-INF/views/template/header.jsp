<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="header">
	<div class="header">
		<div class="Left_menu" id="drop_menu">
			<div class="nav_left">
				<ul id="nav">
					<li><a href="#" class="top_link">BOARD</a>
						<ul class="c1">
							<li><a href="/front/php/b/board_list.php?board_no=1">NOTICE</a></li>
							<li><a href="/front/php/b/board_list.php?board_no=6">Q &amp; A</a></li>
							<li><a href="/front/php/b/board_list.php?board_no=4">REVIEW</a></li>
						</ul></li>
				</ul>
			</div>
			<!--//nav_left -->
		</div>
		<!-- //LEFR_MENU-->

		<div class="right_menu" id="drop_menu">
			<div class="nav_right">
				<ul id="nav">
					<li><a href="#" class="top_link">MEMBER</a>
						<ul>
							<li class="xans-element- xans-layout xans-layout-statelogoff "><a href="/member/login.html">LOGIN</a></li>
							<li class="xans-element- xans-layout xans-layout-statelogoff "><a href="/member/join.html">REGISTER</a></li>

							<li><a href="/myshop/order/list.html">ORDER TRACKING</a></li>
							<li><a href="/myshop/index.html">MY ACCOUNT</a></li>
							<li></li>
							<li class="cart_ct"><a href="/order/basket.html" class="xans-element- xans-layout xans-layout-orderbasketcount ">0 <img src="/web/upload/category/editor/2016/03/20/f8d382e596a1b7e805c22461e4e5e803.png" /></a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<!--//RIGHT_MENU -->

		<div class="center_menu">
			<ul class="logo">
				<li><a href="/index.html">SECOND HAND<br />SELECT STORE<br />
					<br />
					<img src="/web/upload/category/editor/2019/03/04/0ee8d395ba465fb958d9446c41013eec.png" /></a></li>
			</ul>
			<ul class="menu_list">
				<li class="menu_list_shop"><a href="/product/list.html?cate_no=24">SECOND HAND</a></li>
				<li class="menu_list_shop2"><a href="/product/list2.html?cate_no=47">SELECT</a></li>
			</ul>
		</div>
	</div>
</div>
	<!--// .header -->