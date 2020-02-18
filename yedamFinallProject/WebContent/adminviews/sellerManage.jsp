<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 관리</title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="row" style="padding: 0 30px">
			<div class="col-md-6">
				<div class="row">
					<div class="col-md-12">
						<div class="row">				
							<div class="col-md-4">
								<nav aria-label="breadcrumb" role="navigation">
								  <ol class="breadcrumb">
					    			<li class="breadcrumb-item"><a href="AdminMain.ad">관리자 홈</a></li>
					    			<li class="breadcrumb-item active" aria-current="page">판매자 정보관리</li>		    			
					  			 </ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 ">				
				
			</div>					
			<div class="col-md-3">
						<div class="card card-stats">
			              <div class="card-body ">
			                <div class="row">
			                  <div class="col-5 col-md-4">
			                    <div class="icon-big text-center icon-warning">
			                      <i class="fas fa-receipt text-danger"></i>
			                    </div>
			                  </div>
			                  <div class="col-7 col-md-8">
			                    <div class="numbers">
			                      <p class="card-category">취소신청</p>
			                      <p class="card-title">총 0건 <br>
			                        <p>
			                    </div>
			                  </div>
			                </div>
			              </div>
			              <div class="card-footer ">
			                <hr>
			                <div class="stats">
			                  <i class="fa fa-clock-o"></i> In the last hour
			                </div>
			              </div>
			            </div>	
		    </div>	
			</div>
		<div class="col-md-12">
			
			<div class="col-md-12">
				<form id="frm" name="frm" class="form-horizontal">
				<div class="card" id="card1-cell" >
					<div class="card-header">						
						
						<h6 class="card-title">판매자 관리</h6>
						<hr>
						<ul class="nav nav-tabs">
						  <li class="nav-item">
						    <a class="nav-link active" href="#">판매자 관리</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" href="AdminSellerCancel.ad">판매자 취소관리</a>
						  </li>						  
						</ul>											
					</div>
					<div class="card-body">
						<div class="row mb-3">
							<div class="col-md-1 pt-3">조회 분류</div>
							<div class="col-md-1">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="all">
								  <label class="custom-control-label" for="all">전체</label>
								</div>
							</div>
							<div class="col-md-1">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="cancel">
								  <label class="custom-control-label" for="cancel">취소신청내역</label>
								</div>
							</div>
							<div class="col-md-1">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="out">
								  <label class="custom-control-label" for="out">탈퇴 신청</label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-1 pt-3">검색어</div>
							<div class="col-md-2 pt-2">
								<select class="custom-select">
									<option>판매자ID</option>
									<option>판매자번호</option>
									<option>판매번호</option>
									<option>상품번호</option>
									<option>상호명</option>									
								</select>
							</div> 
							<div class="col-md-4" style="padding-top:10px">
								<input type="text" class="form-control ">
							</div> 
							
							<div class="col-md-1">
								<div class="form-group">
								<button type="button" class="btn btn-primary btn-sm">+</button>
								<button type="button" class="btn btn-primary btn-sm">-</button>
								</div>
							</div>
							
						</div> <!-- 첫줄끝 -->
						<div class="row mb-2">							
							<div class="col-md-1" style="padding-top:10px">판매자 상태</div>
							<div class="col-md-1">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="sellerAll">
								  <label class="custom-control-label" for="sellerAll">전체</label>
								</div>
							</div>
							<div class="col-md-1">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="sellerNormal">
								  <label class="custom-control-label" for="sellerNormal">일반</label>
								</div>
							</div>
							<div class="col-md-1">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="sellerSleep">
								  <label class="custom-control-label" for="sellerSleep">휴면</label>
								</div>
							</div>
							<div class="col-md-1">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="sellerOut">
								  <label class="custom-control-label" for="sellerOut">탈퇴</label>
								</div>
							</div>
							<div class="col-md-1">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="sellerPunish">
								  <label class="custom-control-label" for="sellerPunish">징계</label>
								</div>
							</div>
							<div class="col-md-1 " style="padding-top:10px">판매상품</div>
							<div class="col-md-2 pt-1">
								<input type="text" class="form-control">
							</div>
							<div class="col-md-1">
								<button type="button" class="btn btn-primary btn-sm">상품 검색</button>
							</div>
						</div>	<!-- 둘째라인 끝 -->
						<div class="row">
							<div class="col-md-1 pt-2">판매금액 / 건수</div>
							<div class="col-md-2 ">							
								<select class="custom-select">									
									<option selected>전체</option>
									<option>구매금액</option>
									<option>건수</option>										
								</select>								
							</div>
							<div class="col-md-3"></div>
							<div class="col-md-1 pt-2">가입일</div>
							<div class="col-md-2 ">
																
								<div class="input-group date" >								  
								    <input type="text" class="form-control" id="joinDate" placeholder="날짜 입력">
								    <div class="input-group-append" >
								    	<div class="input-group-text">
								    		<label for="joinDate" class="fa fa-calendar" style="cursor:pointer;">
								    			<!-- <i class="fa fa-calendar"></i> -->
								    		</label>
								    	</div>
								 	</div>
							    </div>
							</div>
							<div class="col-md-3"></div>
						</div>
						<div class="row">
							<div class="col-md-1 pt-2">판매일</div>
							<div class="col-md-2 ">
																
								<div class="input-group date" >								  
								    <input type="text" class="form-control" id="startDate" placeholder="시작일">
								    <div class="input-group-append">								    	
								    	<div class="input-group-text">
								    		<label for="startDate" class="fa fa-calendar" style="cursor:pointer;">
								    			<!-- <i class="fa fa-calendar"></i> -->
								    		</label>
								    	</div>								    	
								 	</div>								 	
							    </div>							    
							</div>
							<span class="pt-2">~</span>							
							<div class="col-md-2 ">								
								<!-- <input type="text" class="form-con	trol" id="startDate" style="width:150px"> -->								
								<div class="input-group date" >																 
								    <input type="text" class="form-control" id="endDate" placeholder="종료일">
								    <div class="input-group-append" >
								    	<div class="input-group-text">
								    		<label for="endDate" class="fa fa-calendar" style="cursor:pointer;">
								    			<!-- <i class="fa fa-calendar"></i> -->
								    		</label>
								    	</div>
								 	</div>
							    </div>
							</div>
							
							<div class="col-md-1 pt-2" style="margin-left:7.8%">판매시간</div>
							<div class="col-md-2 ">
								<select class="custom-select ">
												<option selected>시간 선택</option>
												<option>13:00</option>
												<option>14:00</option>
												<option>15:00</option>
												<option>16:00</option>
												<option>17:00</option>
												<option>18:00</option>										
												<option>19:00</option>
												<option>20:00</option>
								</select>
							</div>
						</div>						
					</div>						 
					<div class="card-footer">						
					<hr>
						<div class="col-md-12 text-center">
								<button type="submit" class="btn btn-primary">검색</button>&nbsp;
								<button type="reset" class="btn btn-primary">초기화</button>
						</div>
					</div>
				</div>
				</form>			
			</div>
		</div>
		<div class="col-md-12">
			<div class="col-md-12">
				<form id="frm2" name="frm2" method="post" action="">
					<div class="card" id="card1-cell">
						<div class="card-header">
							<div class="row">
								<div class="col-1">
									<h6 class="h6">[총 n 건]</h6>								
								</div>
								<div class="col-7">								
								</div>
								<div class="col-2 ">
									<select class="custom-select">
										<option selected>등록일순</option>
										<option>등록일 역순</option>
										<option>주문번호순</option>
										<option>상품명 순</option>
										<option>상품ID순</option>
									</select>								
								</div>
								<div class="col-2 ">
									<select class="custom-select">
										<option selected>10개씩보기</option>
										<option>20개씩보기</option>
										<option>30개씩보기</option>															
									</select>									
								</div>
							</div>
							<div class="row">
								<div class="col-md-2 text-center">
									<select class="custom-select mt-1">
										<option selected>상태 변경</option>
										<option>일반</option>
										<option>징계</option>
										<option>휴면</option>															
										<option>탈퇴</option>
									</select>
								</div>
								<div class="col-md-2">
									<select class="custom-select mt-1">
										<option selected>판매취소 승인 여부</option>
										<option>승인</option>
										<option>비승인</option>									
									</select>
								</div>
								<div class="col-md-1">
									<button type="button" class="btn btn-danger btn-sm">적용</button>
								</div>
								<div class="col-md-6"></div>
								<div class="col-md-1 ">
									<button type="button" class="btn btn-success btn-sm">엑셀다운로드</button>
								</div>
							</div>
							<hr>
						</div>
						
						<div class="card-body">			
								
							<div class="table-responsive" style="overflow:hidden;">
			                  <table class="table table-hover table-condensed">
			                    <thead class="text-primary">
			                      <th class="text-center">		                      	
									  <div class="custom-control custom-checkbox">
										  <input type="checkbox" class="custom-control-input" id="resultChkAll">
										  <label class="custom-control-label" for="resultChkAll"></label>
									  </div>							
			                      </th>
			                      <th>
			                        	판매자 ID
			                      </th>
			                      <th>
			                        	판매자 이름
			                      </th>
			                      <th>
			                        	가입일
			                      </th>
			                      <th>
			                        	연락처
			                      </th>
			                      <th>
			                      		판매자상태
			                      </th>
			                      <th>
			                      		주소
			                      </th>
			                      <th>
			                      		판매자 상세 내용
			                      </th>
			                      <th>
			                      		신청 내용
			                      </th>
			                    </thead>
			                    <tbody>
			                     <tr>
			                     </tr>		              
			                    </tbody>
			                  </table>
	                		</div>
	                	
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>	
	 $( "#startDate" ).datepicker({
	    	dateFormat: 'yyyy-mm-dd'
	    	,startDate: '-10d'
	    	,uiLibrary: 'bootstrap4'
	    	/* ,showOn: "both"  
	        ,buttonImage: "../assets/icon/calendar.png"
	        ,buttonImageOnly: true  */
	        ,language:"ko"
	        ,todayHighlight : true
	        ,autoclose: true
	    });
	    
	    $( "#endDate" ).datepicker({
	    	dateFormat: 'yyyy-mm-dd'
	    	,startDate: '-10d'
	    	,uiLibrary: 'bootstrap4'
	    	,showOn: "both"  
	        ,buttonImage: "../assets/icon/calendar.png" 
	        ,buttonImageOnly: true 
	        ,language:"ko"
	        ,todayHighlight : true
	        ,autoclose: true
	    });
	    
	    $( "#joinDate" ).datepicker({
	    	dateFormat: 'yyyy-mm-dd'
	    	,startDate: '-10d'
	    	,uiLibrary: 'bootstrap4'
	    	,showOn: "both"  
	        ,buttonImage: "../assets/icon/calendar.png" 
	        ,buttonImageOnly: true 
	        ,language:"ko"
	        ,todayHighlight : true
	        ,autoclose: true
	    });
	    
	    // submit action 시에 유효성 달력 유효 검사
	    /* var startDay = $("#startDay").val();
	    var endDay = $("#endDay").val();
	    
	    if (startDay > endDay){
	    	alert("시작일이 종료일 보다 뒤입니다. 다시 선택해 주세요.");
	    	return false;
	    }else if(endDay < startDay){
	    	alert("종료일이 시작일 보다 앞입니다. 다시 선택해 주세요.");
	    	return false;
	    }else{
	    	return true;
	    } */
	    
	</script>
</body>
</html>