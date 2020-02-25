<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	<meta name="generator" content="Jekyll v3.8.6">
	<title>Insert title here</title>

	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
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

		@media (min-width : 768px) {
			.bd-placeholder-img-lg {
				font-size: 3.5rem;
			}
		}

		ul {
			list-style: none;
			display: table;
		}

		li {
			list-style: none;
			display: table-cell;
		}
	</style>
	<!-- Custom styles for this template -->

	<script type="text/javascript">
		window.addEventListener("load", function () {

			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.getElementsByClassName('needs-validation')

			// Loop over them and prevent submission
			Array.prototype.filter.call(forms, function (form) {
				form.addEventListener('submit', function (event) {
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
		<div class="py-5 text-center">
			<form class="needs-validation" method="POST" action="">
				<h2 class="mb-3">장바구니</h2>
				<div class="row alert-secondary">
					<div class="col-md-1">
						<span>
							<input type="checkbox" id="cart_check_all" checked>
							<label for="cart_check_all">전체선택</label>
						</span>
					</div>
					<div class="col-md-5">
						제품명
					</div>
					<div class="col-md-2">
						수량
					</div>
					<div class="col-md-2">
						제품금액
					</div>
					<div class="col-md-2">
						주문금액
					</div>
				</div>
				<div class="row">
					<div class="col-md-1">
						체크
					</div>
					<div class="col-md-5">
						제품명
					</div>
					<div class="col-md-2">
						수량
					</div>
					<div class="col-md-2">
						제품금액
					</div>
					<div class="col-md-2">
						주문금액
					</div>
				</div>
				<div class="row">
					<!--선택제품 삭제-->
					<button type="button" class="btn btn-outline-dark">선택 제품
						삭제</button>


					<div class="row">
						<div class="col-md-4 mb-3">
							<img src="${i.photoFile}" style="width: inherit; max-width: 100%; height: auto;" />
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
								<h5>수량 ${i.orderQy } &nbsp;&nbsp; ${i.orderQy * i.slePc } 원</h5>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>

</html>