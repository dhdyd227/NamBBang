<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="header trans_300">

	<!-- Top Navigation (제일 위 상단 검은색)-->

	<div class="top_nav">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="top_nav_left">free shipping on all u.s orders over $50</div>
				</div>
				<div class="col-md-6 text-right">
					<div class="top_nav_right">
						<ul class="top_nav_menu">

							<!-- Currency / Language / My Account -->

							<li class="currency">
								<a href="#">
									usd
									<i class="fa fa-angle-down"></i>
								</a>
								<ul class="currency_selection">
									<li><a href="#">cad</a></li>
									<li><a href="#">aud</a></li>
									<li><a href="#">eur</a></li>
									<li><a href="#">gbp</a></li>
								</ul>
							</li>
							<li class="language">
								<a href="#">
									English
									<i class="fa fa-angle-down"></i>
								</a>
								<ul class="language_selection">
									<li><a href="#">French</a></li>
									<li><a href="#">Italian</a></li>
									<li><a href="#">German</a></li>
									<li><a href="#">Spanish</a></li>
								</ul>
							</li>
							<li class="account">
								<a href="#">
									My Account
									<i class="fa fa-angle-down"></i>
								</a>
								<ul class="account_selection">
									<li><a href="#"><i class="fa fa-sign-in" aria-hidden="true"></i>Sign In</a>
									</li>
									<li><a href="#"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Main Navigation(숨겨진 상단메뉴) -->

	<div class="main_nav_container">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-right">
					<div class="logo_container">
						<a href="#">Nam
							<span>Bang</span>
						</a>
					</div>
					<nav class="navbar">
						<ul class="navbar_menu">
							<li><a href="#">Home</a></li>
							<li><a href="#">BrandStory</a></li>
							<li><a href="#">Total Shop</a></li>
							<li><a href="#">notice</a></li>
						</ul>
						<ul class="navbar_user">
							<li><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></li>
							<li><a data-toggle="modal" href="javascript:void(0)" onclick="openLoginModal();">
							<i class="fa fa-user" aria-hidden="true"></i></a>
							</li>

							<li class="checkout">
								<a href="#">
									<i class="fa fa-shopping-cart" aria-hidden="true"></i>
									<span id="checkout_items" class="checkout_items">2</span>
								</a>
							</li>
						</ul>
						<div class="hamburger_container">
							<i class="fa fa-bars" aria-hidden="true"></i>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</div>

	<!-- 제일위 흰색에 글씨-->
	<div class="fs_menu_overlay"></div>

	<!-- 오른쪽 숨겨진 메뉴 -->
	<div class="hamburger_menu">
		<div class="hamburger_close"><i class="fa fa-times" aria-hidden="true"></i></div>
		<div class="hamburger_menu_content text-right">
			<ul class="menu_top_nav">
				<li class="menu_item has-children">
					<a href="#">
						usd
						<i class="fa fa-angle-down"></i>
					</a>
					<ul class="menu_selection">
						<li><a href="#">cad</a></li>
						<li><a href="#">aud</a></li>
						<li><a href="#">eur</a></li>
						<li><a href="#">gbp</a></li>
					</ul>
				</li>
				<li class="menu_item has-children">
					<a href="#">
						English
						<i class="fa fa-angle-down"></i>
					</a>
					<ul class="menu_selection">
						<li><a href="#">French</a></li>
						<li><a href="#">Italian</a></li>
						<li><a href="#">German</a></li>
						<li><a href="#">Spanish</a></li>
					</ul>
				</li>
				<li class="menu_item has-children">
					<a href="#">
						My Account
						<i class="fa fa-angle-down"></i>
					</a>
					<ul class="menu_selection">
						<li><a href="#"><i class="fa fa-sign-in" aria-hidden="true"></i>Sign In</a></li>
						<li><a href="#"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a></li>
					</ul>
				</li>
				<li class="menu_item"><a href="#">Home</a></li>
				<li class="menu_item"><a href="#">BrandStory</a></li>
				<li class="menu_item"><a href="#">Total Shop</a></li>
				<li class="menu_item"><a href="#">Contact</a></li>
			</ul>
		</div>
	</div>



</header>