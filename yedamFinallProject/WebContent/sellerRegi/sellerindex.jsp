<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<% 
	String imgPath = "/yedamFinallProject/sellerRegi";
	String jsPath = "/yedamFinallProject/sellerRegi";
	String cssPath = "/yedamFinallProject/sellerRegi";
%>

<head>
	<title>판매자 등록</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="Colo Shop Template">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
	<link href="<%=cssPath %>/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
	<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
	<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
	<link rel="stylesheet" href="<%=cssPath %>/plugins/themify-icons/themify-icons.css">
	<link rel="stylesheet" type="text/css" href="styles/main_styles.css">
	<link rel="stylesheet" type="text/css" href="styles/responsive.css">
	<link rel="stylesheet" type="text/css" href="<%=cssPath %>/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="<%=cssPath %>/styles/contact_styles.css">
	<link rel="stylesheet" type="text/css" href="<%=cssPath %>/styles/contact_responsive.css">
	<script src="<%=jsPath %>/js/jquery-3.2.1.min.js"></script>
	
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="styles/bootstrap4/popper.js"></script>
	<script src="styles/bootstrap4/bootstrap.min.js"></script>
	<script src="plugins/Isotope/isotope.pkgd.min.js"></script>
	<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
	<script src="plugins/easing/easing.js"></script>
	<script src="js/custom.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>


	<link href="assets/css/login-register.css" rel="stylesheet" />
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

	<!-- 로그인 스크립트 전체 -->
	<script type="text/javascript" src="assets/js/login-register.js"></script>

<style type="text/css">
	input[type=file] {
		display: none;
	}
	
	.my_button {
		display: inline-block;
		width: 200px;
		text-align: center;
		padding: 10px;
		background-color: #006BCC;
		color: #fff;
		text-decoration: none;
		border-radius: 5px;
	}
	
	.imgs_wrap {
		border: 2px solid #D4D4D4;
		margin-top: 30px;
		margin-bottom: 30px;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	
	.imgs_wrap img {
		max-width: 150px;
		margin-left: 10px;
		margin-right: 10px;
	}
	</style>
	
	<script type="text/javascript">
	
	  var sel_files = [];
	
	  $(document).ready(function() {
	      $("#input_imgs").on("change", handleImgFileSelect);
	  }); 
	
	  function fileUploadAction() {
	      console.log("fileUploadAction");
	      $("#input_imgs").trigger('click');
	  }
	
	  function handleImgFileSelect(e) {
	      //sel_files = [];
	      //$(".imgs_wrap").empty();
	
	      var files = e.target.files;
	      var filesArr = Array.prototype.slice.call(files);
	
	      var index = 0;
	      filesArr.forEach(function(f) {
	          if(!f.type.match("image.*")) {
	              alert("이미지만 등록 가능합니다.");
	              return;
	          }
	
	          sel_files.push(f);
	
	          var reader = new FileReader();
	          reader.onload = function(e) {
	              var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='클릭 시 삭제'></a>";
	              $(".imgs_wrap").append(html);
	              index++;
	
	          }
	          reader.readAsDataURL(f);
	          
	      });
	  }
	
	  function deleteImageAction(index) {
	      console.log("index : "+index);
	      console.log("sel length : "+sel_files.length);
	
	      sel_files.splice(index, 1);
	
	      var img_id = "#img_id_"+index;
	      $(img_id).remove(); 
	  }
	
	
	  function submitAction() {
	      console.log("file size : "+sel_files.length);
	      var data = new FormData();
	
	      for(var i=0, len=sel_files.length; i<len; i++) {
	          var name = "image_"+i;
	          data.append(name, sel_files[i]);
	      }
	      data.append("image_count", sel_files.length);
	      data.append("seller_id", document.getElementById("goods_id").value);
	      data.append("seller_name", document.getElementById("goods_name").value);
	      data.append("netprc", document.getElementById("netprc").value);
	      data.append("seller_info", document.getElementById("goods_info").value);
	      
	      if(sel_files.length < 1) {
	          alert("파일을 선택하세요.");
	          return;
	      }            
	
	      var xhr = new XMLHttpRequest();
	      xhr.open("POST","./regGoods.do");
	      xhr.onload = function(e) {
	          if(this.status == 200) {
	              console.log("Result : "+e.currentTarget.responseText);
	              var data = JSON.parse(e.currentTarget.responseText);
	              console.log("Result : "+ data.result);
	              if("ok" == data.result){
	            	  //등록성공 목록으로 이동
	            	  alert("판매자가 등록 되었습니다.");
	            	  location.href = "listGoods.do";
	              }else{
	            	  alert("저장 중 오류가 발생하였습니다.");
	              }
	          }
	      }
	
	      xhr.send(data);
	      console.log("finish");
	  }
	
	  function fn_setAddr(){
		  var width = 500;
		  var height = 600;
		  daum.postcode.load(function(){
		        new daum.Postcode({
		            oncomplete: function(data) {
		            	$("#lc").val(data.address);
		            	$("#addr").val(data.buildingName);
		            }
		        }).open({
		        	left: (window.screen.width / 2) - (width /2),
		        	top: (window.screen.height / 2) - (height /2)
		        	});
		        });
		        
	  }
	  
	</script>

</head>

<body>

	<div class="super_container">

		<!-- Header -->
		<%@include file="header.jsp" %>

<!-- Slider -->

		<div class="main_slider">
			<div class="container fill_height">
				<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="3000">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
											
						<div class="carousel-item">
							<img class="d-block w-100" src="./images/banner_3.jpg" alt="Third slide">
						</div>
					</div>
				</div>
			</div>
		</div>

		
		<script type="text/javascript">
	function formCheck(){
		if(frm.sname.value == ""){
			alert("상호명을 입력해주세요.")
			frm.sname.focus();
			return false;
		}
		if(frm.lc.value == ""){
			alert("가게 위치를 입력해주세요.")
			frm.lc.focus();
			return false;
		}
		if(frm.name.value == ""){
			alert("사업주를 입력해주세요.")
			frm.name.focus();
			return false;
		}
		if(frm.no.value == ""){
			alert("전화번호를 입력해주세요.")
			frm.no.focus();
			return false;
		}
		if(frm.open.value == ""){
			alert("영업시작시간을 입력해주세요.")
			frm.open.focus();
			return false;
		}
		if(frm.close.value == ""){
			alert("영업마감시간을 입력해주세요.")
			frm.close.focus();
			return false;
		}
		if(frm.sns.value == ""){
			alert("sns주소를 입력해주세요.")
			frm.sns.focus();
			return false;
		}
		if(frm.intrcn.value == ""){
			alert("가게 소개글을 입력해주세요.")
			frm.intrcn.focus();
			return false;
		}
		if(frm.grade.value == ""){
			alert("등급을 입력해주세요.")
			frm.grade.focus();
			return false;
		}
		return true;
	}
	
	
</script>
</head>
<body>
	<div align="center">
		<form id="frm" name="frm" action="../boardWriteOK.do" method="post" onsubmit="return formCheck()">
			<br><br>
			<div><h3> 판매자 등록 </h3></div><br>
			<table>
				<tr height="30">
					<th>*상호명</th><td><input style="width:730px;" type="text" id="sname" name="sname"></td>
				</tr>
				<tr height="30">
					<th>*가게위치</th><td><input style="width:690px;" type="text" id="lc" name="lc">
					<button id="button" onclick="fn_setAddr();" >검색</button></td>
				</tr>
				<tr height="30">
					<th>*사업주</th><td><input style="width:730px;" type="text" id="name" name="name"></td>
				</tr>
				<tr height="30">
					<th>*전화번호</th><td><input style="width:730px;" type="text" id="no" name="no"></td>
				</tr>
				<tr height="30">
					<th>*영업시작시간</th><td><input style="width:730px;" type="Time" id="open" name="open"></td>
				</tr>
				<tr height="30">
					<th>*영업마감시간</th><td><input style="width:730px;" type="Time" id="close" name="close"></td>
				</tr>
				<tr height="30">
					<th>sns주소</th><td><input style="width:730px;" type="text" id="sns" name="sns"></td>
				</tr>
				<tr height="30">
					<th>*가게소개글</th><td colspan="3"><textarea style="width:730px; resize:none" id="intrcn" name="intrcn" cols="60" rows="15" ></textarea></td>
				</tr>
				
			</table>
			<div class="mt-3">
					<div class="input_wrap">
						<input class="btn btn-primary ml-1" type="button" value="사진등록" name="selectFile" onclick="fileUploadAction();"/>&nbsp;&nbsp;
						<input type="file" id="input_imgs" multiple />
						<button class="btn btn-primary ml-1" type="submit">저장</button>&nbsp;&nbsp;
						<button class="btn btn-primary ml-1" type="reset">취소</button>&nbsp;&nbsp;
					</div>
				</div>
				
				<div>
					<div class="imgs_wrap" style="width:500px;">
						<img id="img" />
					</div>
				</div>
				
		</form>
		<script type="text/javascript">
			document.getElementById('date').value = new Date().toISOString().substring(0, 10);
		</script>
	</div>

		
		<!-- Modal -->
	
		<%@include file="modal.jsp" %>
		
		<!-- Footer -->
		<%@include file="footerS.jsp" %>
	
</body>

</html>