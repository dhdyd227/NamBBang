<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>NamBang</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>

<script src="/yedamFinallProject/userjs/jquery-3.2.1.min.js"></script>
<script src="/yedamFinallProject/userstyles/bootstrap4/popper.js"></script>
<script src="/yedamFinallProject/userstyles/bootstrap4/bootstrap.min.js"></script>
<script src="/yedamFinallProject/userplugins/Isotope/isotope.pkgd.min.js"></script>
<script src="/yedamFinallProject/userplugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/yedamFinallProject/userplugins/easing/easing.js"></script>
<script src="/yedamFinallProject/userjs/custom.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2084a98791b71389462cf829531808b2&libraries=services,clusterer,drawing"></script>
<script>
$(function(){
	getLocation();
		
});

function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
  } else {
    console.log("Geolocation is not supported by this browser.");
  }
}

function showPosition(position) {
	document.getElementById('x').value = position.coords.latitude;
	document.getElementById('y').value = position.coords.longititude;
  console.log("Latitude: " + position.coords.latitude);
  console.log("Longitude: " + position.coords.longitude);
  
}

<%-- <%
	Double x = Double.parseDouble(request.getParameter("x"));
	Double y = Double.parseDouble(request.getParameter("y"));
	
	HttpSession httpsession = request.getSession();
	session.setAttribute("x", x);
	session.setAttribute("y", y);	
%> --%>
 

</script>
</head>

<body>

	<div class="super_container">

			<!-- Header -->
			<%@include file="header.jsp"%>

			<!-- Slider -->

			<div class="main_slider">
				<div class="container fill_height">
					<div id="carouselExampleIndicators" class="carousel slide"
						data-ride="carousel" data-interval="3000">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleIndicators" data-slide-to="0"
								class="active"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img class="d-block w-100" src="./userimages/breads1.png"
									height="500px" alt="First slide" style="border-radius:20px">
								<div class="carousel-caption d-none d-md-block"></div>
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" src="./userimages/breads2.png"
									height="500px" alt="Second slide" style="border-radius:20px">

							</div>
							<div class="carousel-item">
								<img class="d-block w-100" src="./userimages/breads3.jpg"
									height="500px" alt="Third slide" style="border-radius:20px">

							</div>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev"> 
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> 
						<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>


			<!-- New Arrivals -->

			<div class="new_arrivals">
				<div class="container">
					<div class="row">
						<div class="col text-center">
							<div class="section_title new_arrivals_title">
								<h2>판매 중인 상품</h2>
							</div>
						</div>
					</div>
					<div class="row align-items-center">
						<div class="col text-center">
							<div class="new_arrivals_sorting">
								<ul class="arrivals_grid_sorting clearfix button-group filters-button-group">
									<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center active is-checked" data-filter="*">all</li>
									<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".식빵류">식빵류</li>
									<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".과자빵류">과자빵류</li>
									<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".조리빵류">조리빵류</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="product-grid"
								data-isotope='{ "itemSelector": ".product-item", "layoutMode": "fitRows" }'>

								<c:forEach var="list" items="${GoodsMain }">
									<div class="product-item ${list.goodsCl }">
										<div class="product discount product_filter">
											<div class="product_image">
												<a href="single.do?sleId=${list.sleId }"><img src="${list.stringImage }" 
												width="30px" height="200px" alt=""></a>
											</div>
											<div class="favorite favorite_left"></div>
 											<div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
												<span>${list.sleEndTime.getHours() } : 00</span>
												<!-- 할인율 -->
											</div>
											<div class="product_info">
												<h6 class="product_name">
													<a href="single.do?sleId=${list.sleId }">${list.goodsName}</a>
												</h6>
												<div class="product_price">
													${list.slePc}원<span>${list.netPrc }원</span>
												</div>
												<br>
												<h8 class="product_name">
													${list.cmpnm }
												</h8>
											</div>
										</div>
										<div class="red_button add_to_cart_button">											
											<p style="color:white; padding-top:7px">${list.mtlty_lc }</p>
										</div>
									</div>

								</c:forEach>
								<input type="hidden" id="x" name="x" value="">
								<input type="hidden" id="y" name="x" value="">
							</div>
						</div>
					</div>
				</div>				
			</div>

			<!-- Footer -->
			<%@include file="footer.jsp"%>
	</div>

</body>

</html>
