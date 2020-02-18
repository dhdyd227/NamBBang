<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일별 매출 분석</title>
<script>
$(function(){
	var chart = tui.chart;	
	// bar chart api 함수			    
		    	var container = document.getElementById('chart-area');
		    	var data = {
		    			// x 카테고리 - 오늘 기준으로 1주일 얻어내기
		    	    categories: ['Apr', 'May', 'June', 'July', 'Aug', 'Sep', 'Oct'],
		    	    	// 적용할 데이터
		    	    series: {
		    	        column: [
		    	            {
		    	                name: '매출',
		    	                data: [11.3, 17.0, 21.0, 24.4, 25.2, 20.4, 13.9]
		    	            },
		    	            {
		    	                name: '판매량',
		    	                data: [9.9, 16.0, 21.2, 24.2, 23.2, 19.4, 13.3]
		    	            },
		    	            {
		    	                name: '환불',
		    	                data: [18.3, 15.2, 12.8, 11.8, 13.0, 15.2, 17.6]
		    	            },
		    	            {
		    	                name: '취소',
		    	                data: [4.4, 12.2, 16.3, 18.5, 16.7, 10.9, 4.2]
		    	            },
		    	            
		    	        ],
		    	        line: [
		    	            {
		    	                name: 'Average',
		    	                data: [11, 15.1, 17.8, 19.7, 19.5, 16.5, 12.3]
		    	            }
		    	        ]
		    	    }
		    	};
		    	var options = {
		    	    chart: {
		    	        width: 1600,
		    	        height: 500,
		    	        title: '일별 매출'
		    	    },
		    	    yAxis: [{
		    	       title: '매출',
		    	       chartType: 'column',
		    	       labelMargin: 15
		    	    }, {
		    	       title: 'Average',
		    	       chartType: 'line',
		    	       labelMargin: 15
		    	    }],
		    	    xAxis: {
		    	        title: '날짜'
		    	    },
		    	    series: {
		    	        line: {
		    	            showDot: true
		    	        }
		    	    },
		    	    tooltip: {
		    	        grouped: true,
		    	        suffix: '원'
		    	    }
		    	};
		    	var theme = {
		    	    series: {
		    	        column: {
		    	            colors: [
		    	                '#83b14e', '#458a3f', '#295ba0', '#2a4175', '#289399'
		    	            ]
		    	        },
		    	        line: {
		    	            colors: ['#333']
		    	        }
		    	    }
		    	};
		    	// For apply theme
		    	// tui.chart.registerTheme('myTheme', theme);
		    	// options.theme = 'myTheme';
		    	var chart = tui.chart.comboChart(container, data, options);	
});
</script>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="row">				
				<div class="col-md-2">
					<nav aria-label="breadcrumb" role="navigation">
					  <ol class="breadcrumb">
		    			<li class="breadcrumb-item"><a href="adminMain.jsp">관리자 홈</a></li>
		    			<li class="breadcrumb-item active" aria-current="page">일별 매출 관리</li>		    			
		  			 </ol>
					</nav>
				</div>
			</div>
		</div>		
		<div class="col-md-12">
			<div class="card">
				<form id="frm" name="frm" method="post" action="">
				<div class="card-header">
					<h6 class="h6">매출 관리</h6>
					<hr>
					<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a class="nav-link active" href="#">일별매출</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="AdminSelngAnalysisWeek.ad">주별매출</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="AdminSelngAnalysisMonth.ad">월별매출</a>
					  </li>				  
					</ul>			
											
				</div>
				<div class="card-body">
					<div class="row ">
							<div class="col-md-1 pt-3 text-center">검색기간</div>
							<div class="col-md-3 pt-1">
								<button type="button" class="btn btn-primary btn-sm">오늘</button>											
								<button type="button" class="btn btn-primary btn-sm">3일</button>
								<button type="button" class="btn btn-primary btn-sm">7일</button>											
							</div>
							<!-- datepicker -->
							<div class="col-md-2 pt-1"> 						
								<!-- <input type="text" class="form-con	trol" id="startDate" style="width:150px"> -->								
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
							<span class="pt-3">
							 ~
							</span>
							<!-- datepicker -->
							<!-- <div class="col-md-1 row-st">~</div> -->
							<div class="col-md-2 pt-1"> 
								<!-- <input type="text" class="form-control" id="endDate" style="width:150px"> -->
								<div class="input-group date" >								  
								    <input type="text" class="form-control" id="endDate" placeholder="종료일">
								    <div class="input-group-append">								    	
								    	<div class="input-group-text">
								    		<label for="endDate" class="fa fa-calendar" style="cursor:pointer;">
								    			<!-- <i class="fa fa-calendar"></i> -->
								    		</label>
								    	</div>								    	
								 	</div>								 	
							    </div>
							</div>
					</div>
												 
				</div>
				<div class="card-footer">
					<hr>
					<div class="row">
						<div class="col-md-12 text-center">
							<button type="submit" class="btn btn-primary btn-sm">검색</button>											
							<button type="reset" class="btn btn-primary btn-sm">초기화</button>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<h6 class="h6">매출 통계</h6>
					<hr>
				</div>
				<div class="card-body">
					<div class="row">
					<!-- bar chart api -->
						<div id="col-md-12">
							<div id="chart-area"></div>
						</div>
					</div>
				</div>
				<div class="card-footer">
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<div class="row">
							<div class="col-1 row-st text-center">
								<h6 class="h6">[총 n 건]</h6>								
							</div>
							<div class="col-7">								
							</div>
							<div class="col-2 row-st">
																
							</div>
							<div class="col-2 row-st">
								<select class="custom-select">
									<option selected>10개씩보기</option>
									<option>20개씩보기</option>
									<option>30개씩보기</option>															
								</select>									
							</div>
						</div>
						<div class="row">
							<div class="col-md-1 row-st text-center">
								
							</div>
							<div class="col-md-1 row-st text-center">
								
							</div>
							<div class="col-md-2 row-st">
								
							</div>
							<div class="col-md-7 row-st"></div>
							<div class="col-md-1 row-st">
								<button type="button" class="btn btn-success btn-sm">엑셀다운로드</button>
							</div>
						</div>
						<hr>
				</div>
				<div class="card-body">
						<div class="table-responsive" style="overflow:hidden;">
		                  <table class="table table-hover table-condensed">
		                    <thead class="text-primary text-center">		                     
		                      <th>일자</th>
		                      <th>주문수</th>		
		                      <th>상품 구매금액</th>
		                      <th>할인 금액</th>
		                      <th>마일리지 사용액</th>
		                      <th>상품명</th>
		                      <th>결제 금액합계</th>
		                      <th>환불액 합계</th>
		                      <th>순매출</th>
		                      
		                    </thead>
		                    <tbody>
		                     <tr>
		                     </tr>		              
		                    </tbody>
		                  </table>
                		</div>
				</div>
				<div class="card-footer">
				</div>
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
	    
	    	
	   
	</script>
</body>
</html>