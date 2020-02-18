<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function formCheck(){
	 var d1 = new Date(startDate.value);
	 var d2 = new Date(endDate.value);
       if(frm.startDate.value > frm.endDate.value) {	             
           alert("시작날짜와 종료날짜를 확인해 주세요.");
           frm.startDate.focus();
           return false;	            	        	        	
       }
      
}
</script>
<body>
	<form id="frm" name="frm" method="post" action="AdminMlgManageOk.ad" onsubmit="return fromCheck()">
	<input type="hidden" name="page" value="1">
	<div class="row">
		<div class="col-md-12">
			<div class="row">				
				<div class="col-md-2 ml-3">
					<nav aria-label="breadcrumb" role="navigation">
					  <ol class="breadcrumb">
		    			<li class="breadcrumb-item"><a href="AdminMain.ad">관리자 홈</a></li>
		    			<li class="breadcrumb-item active" aria-current="page">마일리지 관리</li>		    			
		  			 </ol>
					</nav>
				</div>
			</div>
		</div>		
		<div class="col-md-12">
			
			<div class="col-md-12">
			 
				<div class="card" >
					<div class="card-header">
						<h6 class="card-title">마일리지 관리</h6>
						<hr>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-1 pt-2 text-center">아이디</div>
							<div class="col-md-3">
								<input type="text" class="form-control" id="s_word1" name="s_word1">
							</div>
							<div class="col-md-2"></div>
							<div class="col-md-1 pt-2">기간</div>
							<div class="col-md-2">
																
								<div class="input-group date" >								  
								    <input type="text" class="form-control" id="startDate" name="startDate" placeholder="시작일">
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
							<div class="col-md-2">
																
								<div class="input-group date" >								  
								    <input type="text" class="form-control" id="endDate" name="endDate" placeholder="종료일">
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
								<button type="submit" class="btn btn-primary">검색</button>&nbsp;
								<button type="reset" class="btn btn-primary">초기화</button>								
							</div>
						</div>	
					</div>
				</div>
			</div>
			
		</div> <!-- 첫번째 card 끝 -->
		<div class="col-md-12">
			<div class="row" style="padding:0 14px;">				
				<div class="col-md-4">
		            <div class="card card-stats">
		              <div class="card-body ">
		                <div class="row">
		                  <div class="col-5 col-md-4">
		                    <div class="icon-big text-center icon-warning">
							<!--  <i class="nc-icon nc-cart-simple text-warning"></i> -->
								  <i class="fas fa-coins text-warning"></i>
		                    </div>
		                  </div>
		                  <div class="col-7 col-md-8">
		                    <div class="numbers">
		                      <p class="card-category">마일리지 증가</p>                      
		                      <p class="card-title">0원<p>
		                    </div>
		                  </div>
		                </div>
		              </div>
		              <div class="card-footer ">
		                <hr>
		                
		              </div>
		            </div>
		          </div>
				<div class="col-md-4">
		            <div class="card card-stats">
		              <div class="card-body ">
		                <div class="row">
		                  <div class="col-5 col-md-4">
		                    <div class="icon-big text-center icon-warning">
		<!--                       <i class="nc-icon nc-cart-simple text-warning"></i> -->
								  <i class="fas fa-coins text-warning"></i>
		                    </div>
		                  </div>
		                  <div class="col-7 col-md-8">
		                    <div class="numbers">
		                      <p class="card-category">마일리지 차감</p>                      
		                      <p class="card-title">0원<p>
		                    </div>
		                  </div>
		                </div>
		              </div>
		              <div class="card-footer ">
		                <hr>
		                
		              </div>
		            </div>
		          </div>
				
				<div class="col-md-4">
		            <div class="card card-stats">
		              <div class="card-body ">
		                <div class="row">
		                  <div class="col-5 col-md-4">
		                    <div class="icon-big text-center icon-warning">
		<!--                       <i class="nc-icon nc-cart-simple text-warning"></i> -->
								  <i class="fas fa-coins text-warning"></i>
		                    </div>
		                  </div>
		                  <div class="col-7 col-md-8">
		                    <div class="numbers">
		                      <p class="card-category">현재 마일리지</p>                      
		                      <p class="card-title">0원<p>
		                    </div>
		                  </div>
		                </div>
		              </div>
		              <div class="card-footer ">
		                <hr>
		                
		              </div>
		            </div>
		          </div>
				
			</div>			
		</div> <!-- 두번째 card 끝 -->
		<div class="col-md-12">
			<div class="col-md-12">
				<div class="card" >
					<div class="card-header">
						<div class="row">
							<div class="col-md-1">
							<h6 class="card-title">총 [ n건]</h6>
							</div>
							<div class="col-md-9"></div>
							<div class="col-md-2">
								<select class="custom-select" id="pageCnt" name="pageCnt">
									<option value="10" selected>10개씩보기</option>
									<option value="20">20개씩보기</option>
									<option value="30">30개씩보기</option>															
								</select>
							</div>
						</div>
						<hr>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
							<!-- 추가 가능 -->
							</div>
						</div>
						
						<div class="table-responsive" style="overflow:hidden;">
		                  <table class="table table-hover">
		                    <thead class="text-primary">
		                    	  <tr>		                    		                    
				                      <th class="text-center">		                      	
										  <div class="custom-control custom-checkbox">
											  <input type="checkbox" class="custom-control-input" id="resultChkAll">
											  <label class="custom-control-label" for="resultChkAll"></label>
										  </div>							
				                      </th>
				                      <th class="text-center">
				                        	날짜
				                      </th>
				                      <th class="text-center">
				                        	아이디
				                      </th>			                			                			                      		                   				                      
				                      <th class="text-center">
				                      		마일리지
				                      </th>
				                      <th class="text-center">
				                      		마일리지 유형
				                      </th>
			                      <tr>	                    
		                    </thead>
		                    <tbody>
		                     	<tr class="text-center">
		                     		
		                     		
		                     	</tr>
           
		                    </tbody>
		                  </table>
                		</div>
												
					</div>
					<div class="card-footer">
					</div>
				</div>
			</div>			
		</div> <!-- 세번째 card 끝 -->				
	</div>
	</form>	<!-- form 끝 -->
	<script>	
	 $( "#startDate" ).datepicker({
	    	dateFormat: 'yyyy-mm-dd'
	    /* 	,startDate: '-10d' */
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
	    if(${mDto != null}){			    	
	    	$("[name='s_word1']").val(['${mDto.mName}']);	    	
	    	$("[name='startDate']").val(['${mDto.sDate}']);
	    	$("[name='endDate']").val(['${mDto.eDate}']);	    					    		 	 	 	    	
	    	};
	</script>	
</body>
</html>