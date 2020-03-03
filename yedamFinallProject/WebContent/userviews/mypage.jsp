<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>NamBang</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="/yedamFinallProject/userstyles/bootstrap4/bootstrap.min.css">
<link
	href="/yedamFinallProject/userplugins/font-awesome-4.7.0/css/font-awesome.min.css"
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


<script src="/yedamFinallProject/userjs/jquery-3.2.1.min.js"></script>
<script src="/yedamFinallProject/userstyles/bootstrap4/popper.js"></script>
<script src="/yedamFinallProject/userstyles/bootstrap4/bootstrap.min.js"></script>
<script
	src="/yedamFinallProject/userplugins/Isotope/isotope.pkgd.min.js"></script>
<script
	src="/yedamFinallProject/userplugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/yedamFinallProject/userplugins/easing/easing.js"></script>
<script src="/yedamFinallProject/userjs/custom.js"></script>

</head>



<body>

	<div class="super_container">

		<!-- Header -->
		<%@include file="header.jsp"%>

		<!-- Slider -->

		<div class="main_slider">
			<div class="container contact_container">
				<table
					class="table table-hover table-bordered results align-items-center">
					<c:forEach var="list" items="${MyPageList }">
					<tr>
						<td width="150px">
						<a href="single.do?sleId=${list.sleId }"><img src="${list.photoString}" width="150px" height="150px" alt="">
						</a>
						
						</td>
						<td>
							<div>상품명: ${list.goodsName }</div>
							<div>가격/수량 : ${list.orderQy }</div>
						</td>
						<td>
							<div>결제상태 : ${list.setleCode }</div>
							<div><input type="button" id="refund" name="refund" value="환불신청"> </div>
						</td>
					</tr>
					</c:forEach>
				</table>


			</div>
		</div>


		<!-- Footer -->
		<%@include file="footer.jsp"%>

	</div>

</body>
</html>