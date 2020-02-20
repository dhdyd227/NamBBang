<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.6">
<title>Insert title here</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<!-- css -->

<link href="setle/css/form-validation.css" rel="stylesheet">
<script src="setle/js/form-validation.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<!-- Custom styles for this template -->

<script type="text/javascript">
	window.addEventListener("load", function() {

		// Fetch all the forms we want to apply custom Bootstrap validation styles to
		var forms = document.getElementsByClassName('needs-validation')

		// Loop over them and prevent submission
		Array.prototype.filter.call(forms, function(form) {
			form.addEventListener('submit', function(event) {
				if (form.checkValidity() === false) {
					event.preventDefault()
					event.stopPropagation()
				}
				form.classList.add('was-validated')
			}, false)
		})
	}, false);
</script>
</head>

<body class="">
	<div class="container bg-light">
		<div class="py-5 text-center"></div>
		<form class="needs-validation" method="POST" action="">
			<div class="col-md-8 order-md-1">
				<div class="cartContArea">
					<h2 class="mb-3">장바구니</h2>
					<!-- 장바구니 목록 -->
					<div class="cartListWrap">
						<div class="cartTit">
							<ul>
								<li class="chk"><span class="checkbox only"> <input
										type="checkbox" id="cart_check_box_all" name="chkAll"
										checked="checked"> <label for="cart_check_box_all">전체선택</label>
								</span></li>
								<li class="prdName">제품명/옵션명</li>
								<li class="quantity">수량</li>
								<li class="prdPrice">제품금액</li>
								<li class="delivery">배송비</li>
								<li class="orderPrice">주문금액</li>
								<li class="selected">선택</li>
							</ul>
						</div>

						<div class="cartList">
							<ul>
								<!-- loop -->
								<li>
									<div class="inner">
										<div class="prdChk">
											<span class="checkbox only"> <input type="checkbox"
												id="chk0" class="cart_check_box" name="cartIds"
												value="1041832283517626256" checked="checked"> <label
												for="chk0">제품 선택</label> <input type="hidden"
												class="salePsbCd" value="00" /> <input type="hidden"
												class="pkgDlvrAmt" value="0" /> <input type="hidden"
												class="pkgAddDlvrAmt" value="0" /> <input type="hidden"
												class="saleAmt" value="360000" /> <input type="hidden"
												class="prmtDcAmt" value="160000" /> <input type="hidden"
												class="itemNo" value="678" /> <input type="hidden"
												class="goodsId" value="G000020854" /> <input type="hidden"
												class="addItemNo" value="" /> <input type="hidden"
												class="addGoodsId" value="" /> <input type="hidden"
												class="orgClctReqYn" value="N" /> <input type="hidden"
												class="clctReqPsbYn" value="Y" />
											</span>
										</div>
										<div class="productInfoWrap">
											<div class="productInfo">
												<div class="thumbnail">
													<a href=""><img
														src=""
														class="" alt=""
														onerror="this.src='/asset/images/etc/no_img_180x180.png';" /></a>
												</div>
												<div class="info">
													<span class="prdCode"></span> <strong
														class="prdName"><!--제품이름--> </strong>


												</div>
											</div>
										</div>
										<div class="quantity">

											<span class="quantityWrap">
												<button type="button" class="decrease">
													<span>수량감소</span>
												</button>
												<button type="button" class="increase">
													<span>수량증가</span>
												</button> <input type="text" name="buyQty" value="1" class="num">
												<input type="hidden" class="changeYn" value="N" /> <input
												type="hidden" class="orgBuyQty" value="1" /> <input
												type="hidden" class="stkMngYn" value="Y" /> <input
												type="hidden" class="webStkQty" value="166" /> <input
												type="hidden" class="minOrdQty" value="" /> <input
												type="hidden" class="maxOrdQty" value="" />
											</span>

										</div>
										<div class="prdPrice">
											<strong> 200,000 </strong> 원
										</div>
										<div class="delivery">무료</div>
										<div class="orderPrice">

											<strong>200,000</strong> 원
										</div>
										
									</div> <!-- 옵션변경 -->

									<div class="modifyOptionWrap">
										<div class="modifyOption">
											<div class="itemListWrap">
												<ul class="itemList form">
													<li><em class="stit">수거요청</em>
														<div class="cont">
															<div class="checkbox">
																<input type="checkbox" id="opt0" class="req_check_box"
																	name="clctReqYn"> <label for="opt0">폐가전
																	무료 수거 서비스를 이용할게요. (동일 제품군 한정)</label> <input type="hidden"
																	class="changeClctReqYn" value="N" />
															</div>
														</div></li>
												</ul>
											</div>
											<div class="btnWrap">
												<a href="javascript:void(0);"
													onclick="cartBtn.changeCartOption('1041832283517626256'); return false;"
													class="btns bk"><span>변경완료</span></a>
												<button type="button" class="btns">
													<span>변경취소</span>
												</button>
											</div>
										</div>
									</div> <!-- //옵션변경 -->
		

								</li>

								<li>
									<div class="inner">
										<div class="prdChk">
											<span class="checkbox only"> <input type="checkbox"
												id="chk1" class="cart_check_box" name="cartIds"
												value="1041795117102819738" checked="checked"> <label
												for="chk1">제품 선택</label> <input type="hidden"
												class="salePsbCd" value="00" /> <input type="hidden"
												class="pkgDlvrAmt" value="0" /> <input type="hidden"
												class="pkgAddDlvrAmt" value="0" /> <input type="hidden"
												class="saleAmt" value="179000" /> <input type="hidden"
												class="prmtDcAmt" value="34000" /> <input type="hidden"
												class="itemNo" value="2916" /> <input type="hidden"
												class="goodsId" value="G000057224" /> <input type="hidden"
												class="addItemNo" value="" /> <input type="hidden"
												class="addGoodsId" value="" /> <input type="hidden"
												class="orgClctReqYn" value="N" /> <input type="hidden"
												class="clctReqPsbYn" value="Y" />
											</span>
										</div>
										<div class="productInfoWrap">
											<div class="productInfo">
												<div class="thumbnail">
													
												</div>
												<div class="info">
													<span class="prdCode"></span> <strong
														class="prdName">   </strong>
												</div>
											</div>
										</div>
										<div class="quantity">

											<span class="quantityWrap">
												<button type="button" class="decrease">
													<span>수량감소</span>
												</button>
												<button type="button" class="increase">
													<span>수량증가</span>
												</button> <input type="text" name="buyQty" value="1" class="num">
												<input type="hidden" class="changeYn" value="N" /> <input
												type="hidden" class="orgBuyQty" value="1" /> <input
												type="hidden" class="stkMngYn" value="Y" /> <input
												type="hidden" class="webStkQty" value="117" /> <input
												type="hidden" class="minOrdQty" value="" /> <input
												type="hidden" class="maxOrdQty" value="" />
											</span>

										
										</div>
										<div class="prdPrice">
											<strong> 145,000 </strong> 원
										</div>
										<div class="delivery">무료</div>
										<div class="orderPrice">

											<strong>145,000</strong> 원
										</div>
									
									</div> <!-- 옵션변경 -->

									<div class="modifyOptionWrap">
										<div class="modifyOption">
											<div class="itemListWrap">
												<ul class="itemList form">
													<li><em class="stit">수거요청</em>
														<div class="cont">
															<div class="checkbox">
																<input type="checkbox" id="opt1" class="req_check_box"
																	name="clctReqYn"> <label for="opt1">폐가전
																	무료 수거 서비스를 이용할게요. (동일 제품군 한정)</label> <input type="hidden"
																	class="changeClctReqYn" value="N" />
															</div>
														</div></li>
												</ul>
											</div>
											<div class="btnWrap">
												<a href="javascript:void(0);"
													onclick="cartBtn.changeCartOption('1041795117102819738'); return false;"
													class="btns bk"><span>변경완료</span></a>
												<button type="button" class="btns">
													<span>변경취소</span>
												</button>
											</div>
										</div>
									</div> <!-- //옵션변경 -->

								</li>

								<!-- //loop -->
							</ul>
						</div>



						<div class="row">
							<!--선택제품 삭제-->
							<button type="button" class="btn btn-outline-dark">선택 제품
								삭제</button>

						</div>

						<div class="row">
							<div class="col-md-4 mb-3">
								<img src="${i.photoFile}"
									style="width: inherit; max-width: 100%; height: auto;" />
								<!--제품이미지 출력-->
							</div>
							<div class="col-md-8 mb-3" style="padding-top: 40px;">
								<!--제품정보 출력-->
								<div class="col-md-12 mb-3">
									<!-- 판매ID -->
									<h5>${i.sleId }</h5>
								</div>
								<div class="col-md-12 mb-3">
									<!-- 제품이름 -->
									<h3>${i.goodsName }</h3>
								</div>
								<div class="col-md-12 mb-3">
									<!--제품수량 가격-->
									<h5>수량 ${i.orderQy } &nbsp;&nbsp; ${i.orderQy * i.slePc }
										원</h5>
								</div>
							</div>
						</div>
						<div class="progress border" style="height: 1px;">
							<div class="progress-bar bg-light" style="width: 100%;"></div>
						</div>
						<c:set var="sum" value="${sum+(i.orderQy * i.slePc)}" />

						<div class="row" style="padding-top: 30px;">

							<div class="col-md-3 mb-3">
								<h5>휴대전화 번호</h5>
							</div>
							<div class="col-md-9 mb-3">
								<input type="text" class="form-control" id="phon"
									placeholder="- 없이 숫자만 입력해 주세요." value="" required>
								<div class="invalid-feedback">Valid first name is
									required.</div>
							</div>
						</div>

						<div class="row" style="padding-top: 30px;">
							<div class="col-md-3 mb-3">
								<h5>마일리지</h5>
							</div>
							<div class="col-md-4 mb-3">
								<input type="text" class="form-control" id="mlg" placeholder=""
									value="0" required>
								<div class="invalid-feedback">Valid first name is
									required.</div>
							</div>
							<div class="col-md-5 mb-3">
								원 &nbsp;&nbsp;&nbsp; / &nbsp;&nbsp;&nbsp; <span id="totalMlg"
									style="color: crimson;"> ${mlg} </span><span>원</span>
							</div>
						</div>

						<div class="row" style="padding-top: 30px;">
							<div class="col-md-3" style="margin-top: 30px;">
								<h5>결제 수단</h5>
							</div>
							<div class="col-md-9">
								<button type="button" class="btn btn-outline-light">
									<img src="sellviews/images/카카오페이.png"
										style="width: 100px; height: 100px;" />
								</button>
							</div>
						</div>
						<hr class="mb-3">
					</div>
				</div>
			</div>
		</form>
		<footer class="my-5 pt-5 text-muted text-center text-small">
			<p class="mb-1">&copy; 2020.01-2020.03 Nambbang</p>
			<ul class="list-inline">
				<li class="list-inline-item"><a href="#">Privacy</a></li>
				<li class="list-inline-item"><a href="#">Terms</a></li>
				<li class="list-inline-item"><a href="#">Support</a></li>
			</ul>
		</footer>
	</div>


</body>

</html>