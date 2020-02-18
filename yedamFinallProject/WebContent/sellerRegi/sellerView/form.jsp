<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String imgPath = "/yedamSihYeon/zproject/pro";
	String jsPath = "/yedamSihYeon/zproject/pro";
	String cssPath = "/yedamSihYeon/zproject/pro";
%>
<html>
<head>
	<title>판매자 등록</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="Colo Shop Template">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
	<link href="<%=cssPath %>/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
	<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
	<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
	<link rel="stylesheet" href="<%=cssPath %>/plugins/themify-icons/themify-icons.css">
	<link rel="stylesheet" type="text/css" href="styles/main_styles.css">
	<link rel="stylesheet" type="text/css" href="styles/responsive.css">
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="styles/bootstrap4/popper.js"></script>
	<script src="styles/bootstrap4/bootstrap.min.js"></script>
	<script src="plugins/Isotope/isotope.pkgd.min.js"></script>
	<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
	<script src="plugins/easing/easing.js"></script>
	<script src="js/custom.js"></script>
	<link rel="stylesheet" href="<%=cssPath %>/plugins/themify-icons/themify-icons.css">

	<link href="assets/css/login-register.css" rel="stylesheet" />
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
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
	      data.append("goods_id", document.getElementById("goods_id").value);
	      data.append("goods_name", document.getElementById("goods_name").value);
	      data.append("netprc", document.getElementById("netprc").value);
	      data.append("goods_info", document.getElementById("goods_info").value);
	      
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
	            	  alert("상품이 등록 되었습니다.");
	            	  location.href = "listGoods.do";
	              }else{
	            	  alert("저장 중 오류가 발생하였습니다.");
	              }
	          }
	      }
	
	      xhr.send(data);
	      console.log("finish");
	  }
	
	</script>
</head>


<body>

<div class="super_container">

	<!-- Header -->

	<header class="header trans_300">

		<!-- Top Navigation -->

		<div class="top_nav">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="top_nav_left">free shipping on all u.s orders over $50</div>
					</div>
					<div class="col-md-6 text-right">
						<div class="top_nav_right">
							<ul class="top_nav_menu">

								<!-- Currency / Language / My Account -->

								<li class="currency">
									<a href="#">
										usd
										<i class="fa fa-angle-down"></i>
									</a>
									<ul class="currency_selection">
										<li><a href="#">cad</a></li>
										<li><a href="#">aud</a></li>
										<li><a href="#">eur</a></li>
										<li><a href="#">gbp</a></li>
									</ul>
								</li>
								<li class="language">
									<a href="#">
										English
										<i class="fa fa-angle-down"></i>
									</a>
									<ul class="language_selection">
										<li><a href="#">French</a></li>
										<li><a href="#">Italian</a></li>
										<li><a href="#">German</a></li>
										<li><a href="#">Spanish</a></li>
									</ul>
								</li>
								<li class="account">
									<a href="#">
										My Account
										<i class="fa fa-angle-down"></i>
									</a>
									<ul class="account_selection">
										<li><a href="#"><i class="fa fa-sign-in" aria-hidden="true"></i>Sign In</a></li>
										<li><a href="#"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Main Navigation -->

		<div class="main_nav_container">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-right">
						<div class="logo_container">
							<a href="#">colo<span>shop</span></a>
						</div>
						<nav class="navbar">
							<ul class="navbar_menu">
								<li><a href="index.html">home</a></li>
								<li><a href="#">shop</a></li>
								<li><a href="#">promotion</a></li>
								<li><a href="#">pages</a></li>
								<li><a href="#">blog</a></li>
								<li><a href="contact.html">contact</a></li>
							</ul>
							<ul class="navbar_user">
								<li><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-user" aria-hidden="true"></i></a></li>
								<li class="checkout">
									<a href="#">
										<i class="fa fa-shopping-cart" aria-hidden="true"></i>
										<span id="checkout_items" class="checkout_items">2</span>
									</a>
								</li>
							</ul>
							<div class="hamburger_container">
								<i class="fa fa-bars" aria-hidden="true"></i>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>

	</header>

	<div class="fs_menu_overlay"></div>

	<!-- Hamburger Menu -->

	<div class="hamburger_menu">
		<div class="hamburger_close"><i class="fa fa-times" aria-hidden="true"></i></div>
		<div class="hamburger_menu_content text-right">
			<ul class="menu_top_nav">
				<li class="menu_item has-children">
					<a href="#">
						usd
						<i class="fa fa-angle-down"></i>
					</a>
					<ul class="menu_selection">
						<li><a href="#">cad</a></li>
						<li><a href="#">aud</a></li>
						<li><a href="#">eur</a></li>
						<li><a href="#">gbp</a></li>
					</ul>
				</li>
				<li class="menu_item has-children">
					<a href="#">
						English
						<i class="fa fa-angle-down"></i>
					</a>
					<ul class="menu_selection">
						<li><a href="#">French</a></li>
						<li><a href="#">Italian</a></li>
						<li><a href="#">German</a></li>
						<li><a href="#">Spanish</a></li>
					</ul>
				</li>
				<li class="menu_item has-children">
					<a href="#">
						My Account
						<i class="fa fa-angle-down"></i>
					</a>
					<ul class="menu_selection">
						<li><a href="#"><i class="fa fa-sign-in" aria-hidden="true"></i>Sign In</a></li>
						<li><a href="#"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a></li>
					</ul>
				</li>
				<li class="menu_item"><a href="#">home</a></li>
				<li class="menu_item"><a href="#">shop</a></li>
				<li class="menu_item"><a href="#">promotion</a></li>
				<li class="menu_item"><a href="#">pages</a></li>
				<li class="menu_item"><a href="#">blog</a></li>
				<li class="menu_item"><a href="#">contact</a></li>
			</ul>
		</div>
	</div>

	<div class="container contact_container">
		<div class="row">
			<div class="col">

				<!-- Breadcrumbs -->

			<!-- 	<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li class="active"><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>판매자등록</a></li>
					</ul>
				</div>

			</div>
		</div> -->

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
		<form id="frm" name="frm" action="boardWriteOK.do" method="post" onsubmit="return formCheck()">
			<table>
				<tr height="30">
					<th>*상호명</th><td><input style="width:730px;" type="text" id="sname" name="sname"></td>
				</tr>
				<tr height="30">
					<th>*가게위치</th><td><input style="width:730px;" type="text" id="lc" name="lc"></td>
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
				<tr height="30">
					<th>*판매자등급</th><td><input style="width:730px;" type="text" id="grade" name="grade"></td>
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
		</form>
		<script type="text/javascript">
			document.getElementById('date').value = new Date().toISOString().substring(0, 10);
		</script>
	</div>
</body>
</html>