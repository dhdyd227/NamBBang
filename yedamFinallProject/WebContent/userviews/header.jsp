<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="/yedamFinallProject/userassets/css/login-register.css"
	rel="stylesheet" />

<link rel="stylesheet" type="text/css"
	href="/yedamFinallProject/userstyles/bootstrap4/bootstrap.min.css">
<link href="/yedamFinallProject/userplugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="/yedamFinallProject/userplugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="/yedamFinallProject/userplugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
	href="/yedamFinallProject/userplugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css"
	href="/yedamFinallProject/userstyles/main_styles.css">
<link rel="stylesheet" type="text/css"
	href="/yedamFinallProject/userstyles/responsive.css">
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>

<script src="/yedamFinallProject/userjs/jquery-3.2.1.min.js"></script>
<script src="/yedamFinallProject/userstyles/bootstrap4/popper.js"></script>
<script src="/yedamFinallProject/userstyles/bootstrap4/bootstrap.min.js"></script>
<script src="/yedamFinallProject/userplugins/Isotope/isotope.pkgd.min.js"></script>
<script
	src="/yedamFinallProject/userplugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/yedamFinallProject/userplugins/easing/easing.js"></script>
<script src="/yedamFinallProject/userjs/custom.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>

<!-- 로그인 스크립트 전체 -->
<script type="text/javascript"
	src="/yedamFinallProject/userassets/js/login-register.js"></script>

<header class="header trans_300">	
	
	<!-- Main Navigation(숨겨진 상단메뉴) -->

	<div class="main_nav_container">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-right">
					<div class="logo_container">
						<a href="/yedamFinallProject/">Nam <span>Bang</span>
						</a>
					</div>
					<nav class="navbar">
						<ul class="navbar_menu">
							<li><a href="/yedamFinallProject/">Home</a></li>
							<!-- <li><a href="./totalShop.do">Total Shop</a></li> -->
							
							<c:if test ="${CONECTR_SE eq 'SE'}">
							<li><a href="./listGoods.do">상품 등록</a></li>
							<li><a href="./sellerEdit.do">판매자 정보 수정</a></li>
							<li><a href="./sellLogManage.do">판매 내역 관리</a></li>
							</c:if>
							
						</ul>
						
						<ul class="navbar_user">
							
									
							<!-- <li><a data-toggle="modal" href="javascript:void(0)"> <i
									onclick="javascript: openLoginModal();" class="fa fa-user" aria-hidden="true"></i></a></li>
							 -->
							
								
						
							<c:if test ="${empty CONECTR_SE}">
								비회원
								<li><a data-toggle="modal" href="" onclick="javascript: openLoginModal();"> <i class="fa fa-user"
									  aria-hidden="true" ></i></a></li>
							</c:if>
							<c:if test ="${not empty CONECTR_SE && CONECTR_SE == 'US'}">
								일반 회원
								<li><a data-toggle="modal" href="" onclick="javascript: openLogoutModal();"> <i class="fa fa-user"
									  aria-hidden="true" ></i></a></li>
							</c:if>
							<c:if test ="${not empty CONECTR_SE && CONECTR_SE == 'SE'}">
								판매자
								<li><a data-toggle="modal" href="" onclick="javascript: openLogoutModal();"> <i class="fa fa-user"
									  aria-hidden="true" ></i></a></li>
							</c:if>
							<c:if test ="${not empty CONECTR_SE}">
							<%
								String ss = (String) session.getAttribute("id");
								String sa = (String) session.getAttribute("CONECTR_SE");		
			
							%>
									
							<%=ss%>
														
							</c:if>
							<!-- <li class="checkout">
							<a href="myPage.do"> 
							<i class="fa fa-shopping-cart" aria-hidden="true"></i> 
							</a>
							</li> -->
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
		<div class="hamburger_close">
			<i class="fa fa-times" aria-hidden="true"></i>
		</div>
		<div class="hamburger_menu_content text-right">
			<ul class="menu_top_nav">
				<li class="menu_item"><a href="./index.do">Home</a></li>
				
				<c:if test ="${CONECTR_SE eq 'SE'}">
				<li class="menu_item"><a href="#">상품 등록</a></li>
				<li class="menu_item"><a href="#">판매자 등록</a></li>
				</c:if>
			</ul>
		</div>
	</div>

</header>

<!-- Modal -->
<%@include file="modal.jsp"%>

