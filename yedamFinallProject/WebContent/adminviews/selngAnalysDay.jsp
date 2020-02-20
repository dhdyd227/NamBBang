<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일별 매출 분석</title>
<script>
$(function(){	
 drawCahrt();	
})

function drawChart(d1,d2){
	var chart = tui.chart;	
	// bar chart api 함수		
	var container = document.getElementById('chart-area');
	$.ajax("AdminAjaxSelngAnalysisDayOk.ad",{dataType:"json", data:{stardDate:d1, endDate:d2}})
	.done(function(cData){
		var day = [];
		var profit = [];
		var refnd = [];
		var order_qy = [];
		for (i=0; i<cData.length; i++){
			day.push(cData[i].day);
			profit.push(cData[i].profit);
			refnd.push(cData[i].refnd);
			order_qy.push(cData[i].order_qy);
		}
		
		
    	var data = {
    		
    	    categories: day,
    	    	// 적용할 데이터
    	    series: {
    	        column: [
    	            {
    	                name: '매출',
    	                data: profit
    	            },
    	            {
    	                name: '판매량',
    	                data: order_qy
    	            },
    	            {
    	                name: '환불',
    	                data: refnd
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
	
	
	
		    	
		    
});


window.addEventListener("load", function(){
	
	 day.addEventListener("click",function(){
		dateInput(0,0);			
		if(startDate.disabled == true && endDate.disabled == true){
			startDate.disabled = false;
			endDate.disabled = false;
		}
	});
	t_day.addEventListener("click",function(){
		dateInput(3,0);
		if(startDate.disabled == true && endDate.disabled == true){
			startDate.disabled = false;
			endDate.disabled = false;
		}
	});
	s_day.addEventListener("click",function(){			
		dateInput(7,0);
		if(startDate.disabled == true && endDate.disabled == true){
			startDate.disabled = false;
			endDate.disabled = false;
		}
	});
	
});
//날짜 계산
function dateInput(n,m){
	  startDate.value = "";
	  endDate.value = "";
	  
	  var date = new Date();
	  var start = new Date(Date.parse(date) - n * 1000 * 60 * 60 * 24);
	  var today = new Date(Date.parse(date) - m * 1000 * 60 * 60 * 24);
	  
	  var yyyy = start.getFullYear();
	  var mm = start.getMonth()+1;
	  var dd = start.getDate();
	  
	  if(mm<10){
	   mm = "0" + mm; //10 보다 작으면 숫자앞에 0을 붙임
	  }if(dd<10){
	   dd = "0" + dd;
	  }
	  
	  var t_yyyy = today.getFullYear();
	  var t_mm = today.getMonth()+1;
	  var t_dd = today.getDate();
	  
	  if(t_mm<10){
	   t_mm = "0" + t_mm;
	  }if(t_dd<10){
	   t_dd = "0" + t_dd;
	  }
	  
	  startDate.value = yyyy + "-" + mm + "-" + dd;
	  endDate.value = t_yyyy + "-" + t_mm + "-" + t_dd;
	  
	 }
//submit 유효성 검사
function formCheck(){
	 var d1 = new Date(startDate.value);
	 var d2 = new Date(endDate.value);
    if(frm.startDate.value > frm.endDate.value) {	             
        alert("시작날짜와 종료날짜를 확인해 주세요.");
        frm.startDate.focus();
        return false;	            	        	        	
    }
   drawChart(d1,d2);
}

</script>
</head>
<body>
<form id="frm" name="frm" method="post"  >
	<input type="hidden" name="page" value="1">
	<div class="row">
		<div class="col-md-12">
			<div class="row">				
				<div class="col-md-2">
					<nav aria-label="breadcrumb" role="navigation">
					  <ol class="breadcrumb">
		    			<li class="breadcrumb-item"><a href="AdminMain.ad">관리자 홈</a></li>
		    			<li class="breadcrumb-item active" aria-current="page">일별 매출 관리</li>		    			
		  			 </ol>
					</nav>
				</div>
			</div>
		</div>		
		<div class="col-md-12">
			<div class="card">				
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
											<button type="button" class="btn btn-primary btn-sm" id="day" name="day">오늘</button>											
											<button type="button" class="btn btn-primary btn-sm" id="t_day" name="t_day">3일</button>
											<button type="button" class="btn btn-primary btn-sm" id="s_day" name="s_day">7일</button>											
							</div>
							<!-- datepicker -->
							<div class="col-md-2 pt-1"> 																					
								<div class="input-group date" >								  
								    <input type="text" class="form-control" id="startDate" name="startDate" placeholder="시작일">
								    <div class="input-group-append">								    	
								    	<div class="input-group-text">
								    		<label for="startDate" class="fa fa-calendar" style="cursor:pointer;">								    			
								    		</label>
								    	</div>								    	
								 	</div>								 	
							    </div>																
							</div>
							<span class="pt-3">
							 ~
							</span>							
							<div class="col-md-2 pt-1"> 								
								<div class="input-group date" >								  
								    <input type="text" class="form-control" id="endDate" name="endDate" placeholder="종료일">
								    <div class="input-group-append">								    	
								    	<div class="input-group-text">
								    		<label for="endDate" class="fa fa-calendar" style="cursor:pointer;">								    			
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
							<button type="button" class="btn btn-primary btn-sm" onclick="formCheck()">검색</button>											
							<button type="reset" class="btn btn-primary btn-sm">초기화</button>
						</div>
					</div>
				</div>
				
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
								<select class="custom-select" id="pageCnt" name="pageCnt">
									<option value="10" selected>10개씩보기</option>
									<option value="20">20개씩보기</option>
									<option value="30">30개씩보기</option>															
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
		                    <tr>		                     
		                      <th>일자</th>
		                      <th>주문수</th>		
		                      <th>상품 구매금액</th>
		                      <th>할인 금액</th>
		                      <th>마일리지 사용액</th>
		                      <th>상품명</th>
		                      <th>결제 금액합계</th>
		                      <th>환불액 합계</th>
		                      <th>순매출</th>
		                    </tr>  
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
</form>
	<script>	
	 $( "#startDate" ).datepicker({
	    	dateFormat: 'yyyy-mm-dd'
	    	/* ,startDate: '-10d' */
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
	    	/* ,startDate: '-10d' */
	    	,uiLibrary: 'bootstrap4'
	    	,showOn: "both"  
	        ,buttonImage: "../assets/icon/calendar.png" 
	        ,buttonImageOnly: true 
	        ,language:"ko"
	        ,todayHighlight : true
	        ,autoclose: true
	    });		
	    function goPage(p){
			frm.page.value = p;
			frm.submit();
		};
		//검색 조건 고정
	    if(${adDto != null}){			    	
	    	$("[name='startDate']").val(['${adDto.sDate}']);
	    	$("[name='endDate']").val(['${adDto.eDate}']);	    					    		 	 		    	 
	    	$("[name='sort']").val(['${adDto.sort}']);
	    	$("[name='pageCnt']").val(['${pDto.pageUnit}']);
	    	};    	    		   
	</script>
</body>
</html>