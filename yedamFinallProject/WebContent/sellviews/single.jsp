<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Single Product</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/yedamFinallProject/userstyles/bootstrap4/bootstrap.min.css">
<link href="/yedamFinallProject/userplugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/yedamFinallProject/userplugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/yedamFinallProject/userplugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/yedamFinallProject/userplugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" href="/yedamFinallProject/userplugins/themify-icons/themify-icons.css">
<link rel="stylesheet" type="text/css" href="/yedamFinallProject/userplugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/yedamFinallProject/userstyles/single_styles.css">
<link rel="stylesheet" type="text/css" href="/yedamFinallProject/userstyles/single_responsive.css">

<script src="/yedamFinallProject/userjs/jquery-3.2.1.min.js"></script>
<script src="/yedamFinallProject/userstyles/bootstrap4/popper.js"></script>
<script src="/yedamFinallProject/userstyles/bootstrap4/bootstrap.min.js"></script>
<script src="/yedamFinallProject/userplugins/Isotope/isotope.pkgd.min.js"></script>
<script src="/yedamFinallProject/userplugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/yedamFinallProject/userplugins/easing/easing.js"></script>
<script src="/yedamFinallProject/userplugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="/yedamFinallProject/userjs/single_custom.js"></script>

<script type="text/javascript">
jQuery(document).ready(function($)
{
	if($('.single_product_thumbnails ul li').length)
	{
		var thumbs = $('.single_product_thumbnails ul li');
		var singleImage = $('.single_product_image_background');
	
		thumbs.each(function()
		{
			var item = $(this);
			item.on('click', function()
			{
				thumbs.removeClass('active');
				item.addClass('active');
				var img = item.find('img').data('image');
				$("#single_product_img").attr("src", img);
			});
		});
	}	
});

function FormChk(){
	var q_val;
	q_val = document.getElementById("quantity_value").innerHTML;	
	document.getElementById("q_value").value = q_val;	
	
}
</script>
</head>

<body>

<div class="super_container">

	<!-- Header -->
	<%@include file="../userviews/header.jsp" %>

	<!-- 상품 -->
	<div class="container single_product_container">
		<div class="row">
			<div class="col">

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="index.do">Nam Bang</a></li>
						<!-- <li><a href="categories.html"><i class="fa fa-angle-right" aria-hidden="true"></i>Men's</a></li> -->
						<li class="active"><a href=""><i class="fa fa-angle-right" aria-hidden="true"></i>${sell.goodsName }</a></li>
					</ul>
				</div>

			</div>
		</div>
		<form id="frm" name="frm" method="post" action="SetleForm.do" onsubmit="return FormChk()">
		<div class="row">
			<div class="col-lg-7">
				<div class="single_product_pics">
					<div class="row">
						<div class="col-lg-3 thumbnails_col order-lg-1 order-2">
							<div class="single_product_thumbnails">
								<ul>
									<c:forEach var="list" items="${photoList }" varStatus="status">
										<li ${status.count eq 1 ? "class='active'" : "" }><img src="data:x-image/jpg;base64, ${list.photoFileBlob }" data-image="data:x-image/jpg;base64, ${list.photoFileBlob }"></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="col-lg-9 image_col order-lg-2 order-1">
							<div class="single_product_image">
								<div class="single_product_image_background"><img id="single_product_img" src="data:x-image/jpg;base64, ${photoList[0].photoFileBlob }" data-image="data:x-image/jpg;base64, ${photoList[0].photoFileBlob }" class="img-responsive" style="max-width: 100%"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="product_details">
					<div class="product_details_title">
						<h2>${sell.goodsName }</h2>
						<input type="hidden" id="g_name" name="g_name" value="${sell.goodsName }">
						<input type="hidden" id="s_id" name="s_id" value="${sell.sleId }">
						<p>${fn:replace(sell.goodsInfo, newLineChar, "<br/>")  }</p>
					</div>
					<div class="original_price">${sell.netprc } 원</div>
					<div class="product_price">${sell.slePc } 원</div>
					<input type="hidden" id="g_price" name="g_price" value="${sell.slePc }">
					<!-- <ul class="star_rating">
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
					</ul> -->
					<div class="product_color">
						<span>판매수량:</span>
						<ul>
						${sell.sleQy }
						</ul>
					</div>
					<div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
						<span style="min-width: 70px;">구매수량:</span>
						<div class="quantity_selector">
							<span class="minus"><i class="fa fa-minus" aria-hidden="true"></i></span>							
							<span id="quantity_value">1</span>							
							<span class="plus"><i class="fa fa-plus" aria-hidden="true"></i></span>
							<input type="hidden" id="q_value" name="q_value" value="">
						</div>
						<!-- <div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
						<div class="product_favorite d-flex flex-column align-items-center justify-content-center"></div> -->						
					</div>
					<div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
						<input type="submit" value="구매">
					</div>
				</div>
			</div>			
		</div>
		</form>
	</div>


	<!-- Tabs -->
	<!-- <div class="tabs_section_container">

		<div class="container">
			<div class="row">
				<div class="col">
					<div class="tabs_container">
						<ul class="tabs d-flex flex-sm-row flex-column align-items-left align-items-md-center justify-content-center">
							<li class="tab active" data-active-tab="tab_1"><span>Description</span></li>
							<li class="tab" data-active-tab="tab_2"><span>Additional Information</span></li>
							<li class="tab" data-active-tab="tab_3"><span>Reviews (2)</span></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">

					Tab Description

					<div id="tab_1" class="tab_container active">
						<div class="row">
							<div class="col-lg-5 desc_col">
								<div class="tab_title">
									<h4>Description</h4>
								</div>
								<div class="tab_text_block">
									<h2>Pocket cotton sweatshirt</h2>
									<p>Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...</p>
								</div>
								<div class="tab_image">
									<img src="/yedamFinallProject/sellviews/images/desc_1.jpg" alt="">
								</div>
								<div class="tab_text_block">
									<h2>Pocket cotton sweatshirt</h2>
									<p>Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...</p>
								</div>
							</div>
							<div class="col-lg-5 offset-lg-2 desc_col">
								<div class="tab_image">
									<img src="/yedamFinallProject/sellviews/images/desc_2.jpg" alt="">
								</div>
								<div class="tab_text_block">
									<h2>Pocket cotton sweatshirt</h2>
									<p>Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...</p>
								</div>
								<div class="tab_image desc_last">
									<img src="/yedamFinallProject/sellviews/images/desc_3.jpg" alt="">
								</div>
							</div>
						</div>
					</div>

					Tab Additional Info

					<div id="tab_2" class="tab_container">
						<div class="row">
							<div class="col additional_info_col">
								<div class="tab_title additional_info_title">
									<h4>Additional Information</h4>
								</div>
								<p>COLOR:<span>Gold, Red</span></p>
								<p>SIZE:<span>L,M,XL</span></p>
							</div>
						</div>
					</div>

					Tab Reviews

					<div id="tab_3" class="tab_container">
						<div class="row">

							User Reviews

							<div class="col-lg-6 reviews_col">
								<div class="tab_title reviews_title">
									<h4>Reviews (2)</h4>
								</div>

								User Review

								<div class="user_review_container d-flex flex-column flex-sm-row">
									<div class="user">
										<div class="user_pic"></div>
										<div class="user_rating">
											<ul class="star_rating">
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
											</ul>
										</div>
									</div>
									<div class="review">
										<div class="review_date">27 Aug 2016</div>
										<div class="user_name">Brandon William</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
									</div>
								</div>

								User Review

								<div class="user_review_container d-flex flex-column flex-sm-row">
									<div class="user">
										<div class="user_pic"></div>
										<div class="user_rating">
											<ul class="star_rating">
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
											</ul>
										</div>
									</div>
									<div class="review">
										<div class="review_date">27 Aug 2016</div>
										<div class="user_name">Brandon William</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
									</div>
								</div>
							</div>

							Add Review

							<div class="col-lg-6 add_review_col">

								<div class="add_review">
									<form id="review_form" action="post">
										<div>
											<h1>Add Review</h1>
											<input id="review_name" class="form_input input_name" type="text" name="name" placeholder="Name*" required="required" data-error="Name is required.">
											<input id="review_email" class="form_input input_email" type="email" name="email" placeholder="Email*" required="required" data-error="Valid email is required.">
										</div>
										<div>
											<h1>Your Rating:</h1>
											<ul class="user_star_rating">
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
											</ul>
											<textarea id="review_message" class="input_review" name="message"  placeholder="Your Review" rows="4" required data-error="Please, leave us a review."></textarea>
										</div>
										<div class="text-left text-sm-right">
											<button id="review_submit" type="submit" class="red_button review_submit_btn trans_300" value="Submit">submit</button>
										</div>
									</form>
								</div>

							</div>

						</div>
					</div>

				</div>
			</div>
		</div>

	</div> -->


	<!-- Benefit(맨밑에 주의사항) -->
	<!-- <div class="benefit">
		<div class="container">
			<div class="row benefit_row">
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-truck" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>free shipping</h6>
							<p>Suffered Alteration in Some Form</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-money" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>cach on delivery</h6>
							<p>The Internet Tend To Repeat</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-undo" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>45 days return</h6>
							<p>Making it Look Like Readable</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-clock-o" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>opening all week</h6>
							<p>8AM - 09PM</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
 -->

	<!-- Footer -->
	<%@include file="../userviews/footer.jsp" %>
	

</div>

</body>

</html>
