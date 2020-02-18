<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마일리지 설정 관리</title>
</head>
<body>
	<form id="frm" name="frm" method="post" action="">
	<div class="row">
		<div class="col-md-12">
			<div class="row">				
				<div class="col-md-2">
					<nav aria-label="breadcrumb" role="navigation">
					  <ol class="breadcrumb">
		    			<li class="breadcrumb-item"><a href="adminMain.jsp">관리자 홈</a></li>
		    			<li class="breadcrumb-item active" aria-current="page">마일리지 설정 관리</li>		    			
		  			 </ol>
					</nav>
				</div>
			</div>
		</div>		
		<div class="col-md-12">
			<div class="card" >
				<div class="card-header">
					<h6 class="card-title">마일리지 설정 관리</h6>
					<hr>										
				</div>
				<div class="card-body">
					<div class="row ">
						<div class="col-md-2 pt-2"><p>마일리지 지급 시점</p></div>
						<div class="col-md-2 pt-2 text-right"><p>결제 완료 후</p>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control">
						</div>
						<div class="col-md-2 pt-2 text-left"><p>으로 설정</p></div>
					</div>
					<div class="row">
						<div class="col-md-2 pt-2"><p>상품 구매 금액 기준</p></div>
						<div class="col-md-2 pt-2 text-right"><p>상품 구매 금액을</p>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control">
						</div>
						<div class="col-md-2 pt-2 text-left"><p>기준으로 설정</p></div>
					</div>
					<div class="row">
						<div class="col-md-2 pt-2"><p>마일리지 지급 비율</p></div>
						<div class="col-md-2 pt-2 text-right"><p>상품 값의</p>
						</div>
						<div class="col-md-2 ">
							<input type="text" class="form-control">
						</div>
						<div class="col-md-2 pt-2 text-left"><p>% 마일리지 적립</p></div>
					</div>
					<div class="row">
						<div class="col-md-2 pt-2"><p>마일리지 지급 비율</p></div>
						<div class="col-md-2 pt-2 text-right"><p>신규회원 가입시</p>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control">
						</div>
						<div class="col-md-2 pt-2 text-left"><p>원 적립</p></div>
					</div>
				</div>
				<div class="card-footer">
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<h6 class="card-title">사용 / 제한 설정</h6>
					<hr>														
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-md-2 pt-2"><p>상품 구매금액 조건</p></div>
						<div class="col-md-2 pt-2 text-right"><p>상품 구매 합계액 최소</p>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control">
						</div>
						<div class="col-md-2 pt-2 text-left"><p>원 이상일 때 마일리지 사용 가능</p></div>
					</div>
					<div class="row">
						<div class="col-md-2 pt-2"><p>누적 마일리지 조건</p></div>
						<div class="col-md-2 pt-2 text-right"><p>누적 마일리지 최소</p>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control">
						</div>
						<div class="col-md-2 pt-2 text-left"><p>원 이상일 때 사용 가능</p></div>
					</div>
					
				</div>
				<div class="card-footer">
					<hr>
					<div class="row">
						<div class="col-md-12 text-center">
							<button type="submit" class="btn btn-primary">저장</button>
						</div>
					</div>
				</div>
			</div>
		</div>		
	</div>
	</form>
</body>
</html>