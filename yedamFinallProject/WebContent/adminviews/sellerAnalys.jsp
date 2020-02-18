<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자별  분석통계</title>
<script>
$(function(){
	var chart = tui.chart;	
	var container1 = document.getElementById('chart-area1');
	var container2 = document.getElementById('chart-area2');
	var data1 = {
	    categories: ['판매자'],
	    //데이터
	    series: [
	        {
	            name: 'Chrome',
	            data: 46.02
	        },
	        {
	            name: 'IE',
	            data: 20.47
	        },
	        {
	            name: 'Firefox',
	            data: 17.71
	        },
	        {
	            name: 'Safari',
	            data: 5.45
	        },
	        {
	            name: 'Opera',
	            data: 3.10
	        },
	        {
	            name: 'Etc',
	            data: 7.25
	        }
	    ]
	};
	var data2 = {
		    categories: ['판매자'],
		    series: [
		        {
		            name: 'Chrome',
		            data: 46.02
		        },
		        {
		            name: 'IE',
		            data: 20.47
		        },
		        {
		            name: 'Firefox',
		            data: 17.71
		        },
		        {
		            name: 'Safari',
		            data: 5.45
		        },
		        {
		            name: 'Opera',
		            data: 3.10
		        },
		        {
		            name: 'Etc',
		            data: 7.25
		        }
		    ]
		};
	var options1 = {
	    chart: {
	        width: 770,
	        height: 500,
	        title: '상위 TOP10 판매자 (판매수량)',
	        format: function(value, chartType, areaType, valuetype, legendName) {
	            if (areaType === 'makingSeriesLabel') { // formatting at series area
	                value = value + '%';
	            }

	            return value;
	        }
	    },
	    series: {
	        radiusRange: ['40%', '100%'],
	        showLabel: true
	    },
	    tooltip: {
	        suffix: '%'
	    },
	    legend: {
	        align: 'bottom'
	    }
	};
	var options2 = {
		    chart: {
		        width: 770,
		        height: 500,
		        title: '상위 TOP10 판매자 (판매합계)',
		        format: function(value, chartType, areaType, valuetype, legendName) {
		            if (areaType === 'makingSeriesLabel') { // formatting at series area
		                value = value + '%';
		            }

		            return value;
		        }
		    },
		    series: {
		        radiusRange: ['40%', '100%'],
		        showLabel: true
		    },
		    tooltip: {
		        suffix: '%'
		    },
		    legend: {
		        align: 'bottom'
		    }
		};
	var theme = {
	    series: {
	        series: {
	            colors: [
	                '#83b14e', '#458a3f', '#295ba0', '#2a4175', '#289399',
	                '#289399', '#617178', '#8a9a9a', '#516f7d', '#dddddd'
	            ]
	        },
	        label: {
	            color: '#fff',
	            fontFamily: 'sans-serif'
	        }
	    }
	};

	// For apply theme

	tui.chart.registerTheme('myTheme', theme);
	options1.theme = 'myTheme';
	options2.theme = 'myTheme';

	tui.chart.pieChart(container1, data1, options1);
	tui.chart.pieChart(container2, data2, options2);

})
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
		    			<li class="breadcrumb-item active" aria-current="page">판매자별 분석 통계</li>		    			
		  			 </ol>
					</nav>
				</div>
			</div>
		</div>		
		<div class="col-md-12">
			<div class="card">
				<form id="frm" name="frm" method="post" action="">
				<div class="card-header">
					<h6 class="h6">상품 분석 통계</h6>
					<hr>
					<div class="col-md-12">
						  <ul class="nav nav-tabs" role="tablist">
							  <li class="nav-item">
							      <a class="nav-link" href="AdminGoodsAnalysis.ad">상품별</a>
							  </li>
							  <li class="nav-item">
						      	  <a class="nav-link active" href="">판매자별</a>
						      </li>								    
						  </ul>
					</div>
				</div>
				<div class="card-body">										
					<div class="row">
							<div class="col-md-1 text-center pt-3 row-st">검색기간</div>
							<div class="col-md-4 pt-1 row-st">
								<button type="button" class="btn btn-primary btn-sm">오늘</button>											
								<button type="button" class="btn btn-primary btn-sm">3일</button>
								<button type="button" class="btn btn-primary btn-sm">7일</button>
								<button type="button" class="btn btn-primary btn-sm">1개월</button>																			
								<button type="button" class="btn btn-primary btn-sm">3개월</button>
								<button type="button" class="btn btn-primary btn-sm">6개월</button>
								<button type="button" class="btn btn-primary btn-sm">1년</button>
								<button type="button" class="btn btn-primary btn-sm">전체</button>
							</div>
							<!-- datepicker -->
							<div class="col-md-2 pt-1 row-st"> 						
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
							<div class="col-md-2 pt-1 row-st"> 
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
		<div class="col-md-6">
			<div class="card">
				<div class="card-header">
					<h6 class="h6">판매자별 수량 통계</h6>
					<hr>
				</div>
				<div class="card-body">
					<div class="row">
					<!-- Donut chart1 api -->
						<div id="col-md-12">
							<div id="chart-area1"></div>
						</div>
					</div>
				</div>
				<div class="card-footer">
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="card">
				<div class="card-header">
					<h6 class="h6">판매자별 합계 통계</h6>
					<hr>
				</div>
				<div class="card-body">
					<div class="row">
					<!-- Donut chart2 api -->
						<div id="col-md-12 ">
							<div id="chart-area2"></div>
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
					</div>
						
						<div class="row">							
							<div class="col-md-2 row-st"></div>
							<div class="col-md-5 row-st"></div>
							<div class="col-md-1 row-st">
								<button type="button" class="btn btn-success btn-sm">엑셀다운로드</button>								
							</div>
							<div class="col-md-2 pt-1 row-st">
								<select class="custom-select">
									<option selected>판매수량순</option>
									<option>판매합계순</option>
									<option>판매가순</option>															
									<option>상품번호순</option>
								</select>
							</div>
							<div class="col-md-2 pt-1 row-st">
								<select class="custom-select">
									<option selected>10개씩보기</option>
									<option>20개씩보기</option>
									<option>30개씩보기</option>															
								</select>
							</div>
						</div>
						<hr>
				</div>
				
				<div class="card-body">
						<div class="table-responsive" style="overflow:hidden;">
		                  <table class="table table-hover table-condensed">
		                    <thead class="text-primary text-center">		                      
		                      <th>순위</th>		                      				                     
		                      <th>판매자번호</th>		                        			                     
		                      <th>상호명</th>
		                      <th>판매가</th>		                        	
		                      <th>재고</th>
							  <th>결제수량</th>		                        	
		                      <th>환불수량</th>
							  <th>판매수량</th>
		                      <th>판매합계</th>  	
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
	    	,startDate: $("#startDate").val() + '+1d'
	    	,uiLibrary: 'bootstrap4'
	    	/* ,showOn: "both"  
	        ,buttonImage: "../assets/icon/calendar.png" 
	        ,buttonImageOnly: true  */
	        ,language:"ko"
	        ,todayHighlight : true
	        ,autoclose: true
	    });			    	    	  
	</script>
</body>
</html>