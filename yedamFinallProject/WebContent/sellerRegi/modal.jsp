<%@page import="co.nambbang.app.seller.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div class="container">

	<div class="modal fade login" id="loginModal">
		<div class="modal-dialog login animated">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Login Owith</h4>
				</div>
				<div class="modal-body">
					<div class="box">
						<div class="content">
							<div class="social">

							</div>
							<div class="division">
								<div class="line l"></div>
								<span>NAM BBANG</span>
								<div class="line r"></div>
							</div>
							<div class="error"></div>
							
							<!-- 로그인 화면 -->
							<div class="form loginBox">
								<form  id ="loginForm" action="./index.do" method="post" onsubmit="return LoginClick();" accept-charset="UTF-8">
									<input id="userid" class="form-control" type="text" placeholder="id"
										name="userid"><br />
									<input id="password" class="form-control" type="password" placeholder="Password"
										name="password"><br />
									
									
									<input class="btn btn-default btn-login" type="submit" value="Login"
										name="submit">
								</form>
								<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"
									class="mt-3" width="100%" />
							</div>
							
						</div>
					</div>




					<!-- 회원가입  -->
					<div class="box">
						<div class="content registerBox" style="display:none;">
							<div class="form">
								<!-- <form method="" html="{:multipart=>true}" data-remote="true" action="" accept-charset="UTF-8">-->
								<form id ="registerForm"  method="post" accept-charset="UTF-8">
									<div class="input-group">
										<input id="userid" class="form-control" type="text" placeholder="id"
											name="userid" onkeyup  ="isIdDuplicationSame()" value="asd">
										<span class="input-group-btn">
											<button id="idDuplication" class="btn btn-success" type="button"
												style="height: 46px;" onclick="location.href='javascript: duplicationCheck();'" value="unCheck">중복확인</button>
										</span>
									</div>
									<input id="username" class="form-control" type="text" placeholder="name"
										name="username" value="asd">
									<input id="email" class="form-control" type="email" placeholder="Email(abc@naver.com)"
										name="email" onkeyup  ="registerEmailCheck()" value="asd@naver.com">
									<input id="password" class="form-control" type="password" placeholder="Password"
										name="password" onkeyup  ="isPwSame()" value="asd">
									<input id="password_confirmation" class="form-control" type="password" placeholder="Repeat Password" 
										name="password_confirmation" onkeyup  ="isPwSame()" value="asd">

									<input id="usertel" class="form-control" type="tel" placeholder="phone(ex)010-0000-0000)"
										name="usertel" onkeyup="registerTelCheck()" value="010-1111-1111">

									<input id="birth" class="form-control" type="text" placeholder="birthday(ex)2000-01-01)"
										name="birth" onkeyup="birthdayDateCheck()" value="1111-11-11">
									
									<br />
									<label><input id="gender" class="form-control" type="radio" placeholder="gender"
											name="gender" value="man" checked="checked">men</label>
									<label><input id="gender" class="form-control" type="radio" name="gender"
											value="women">women</label>

									<input class="btn btn-default btn-register" type="button" value="Create account"
										name="submit" onclick="location.href='javascript: registerClick();'" >
										
										
								</form>
							</div>
						</div>
					</div>
				
					<!-- 회원가입 축하메시지 -->
					<div class="box">
						<div class="content registerCheckBox" style="display:none;">
							<div class="form">
								<form method="" html="{:multipart=>true}" data-remote="true" action=""
									accept-charset="UTF-8">
								<span>
									<h3>"OOO"고객님 회원가입을 축하합니다.</h3>
								</span><br /> 
								<input class="btn btn-danger" type="button" onclick="location.href='javascript: createCheckForm();'" value="홈" name="goHome">
								</form>
							</div>
						</div>
					</div>
					
					
					<!-- 아이디 찾기 -->
					<div class="box">
						<div class="content idFindBox" style="display:none;">
							<div class="form">
								<form method="" html="{:multipart=>true}" data-remote="true" action=""
									accept-charset="UTF-8">
									<input id="username" class="form-control" type="text" placeholder="name"
										name="username"><br />
									<div class="input-group">
										<input id="tel" class="form-control" type="text" placeholder="phone" name="tel">
										<span class="input-group-btn">
											<button class="btn btn-success" type="button"
												style="height: 46px;">인증번호</button>
										</span>
									</div>
									<br /> <input id="Certification Number" class="form-control" type="text"
										placeholder="인증번호" name="Certification Number"><br />
									
									<input class="btn btn-default btn-register" type="button" value="Create account"
										name="commit" onclick="location.href='javascript: showFindId();'">
								</form>
							</div>
						</div>
					</div>
					
					
					<!-- 아이디 결과 찾기 결과 -->
					<div class="box">
						<div class="content idFindResultBox" style="display:none;">
							<div class="form">
								<form method="" html="{:multipart=>true}" data-remote="true" action=""
									accept-charset="UTF-8">
								<span>
									<h3>아이디는 "ID" 입니다.</h3>
								</span><br /> 
							
								<input class="btn btn-default btn-register" type="button" value="Create account"
										name="commit" onclick="location.href='javascript: showFindIdResultForm();'">
								</form>
							</div>
						</div>
					</div>
					
					<!-- 비밀번호 찾기 -->
					<div class="box">
						<div class="content findPwBox" style="display:none;">
							<div class="form">
								<div class="form">
								<form method="" html="{:multipart=>true}" data-remote="true" action=""
									accept-charset="UTF-8">
									<input id="userid" class="form-control" type="text" placeholder="id"
										name="userid"><br />
									<div class="input-group">
										<input id="tel" class="form-control" type="text" placeholder="phone" name="tel">
										<span class="input-group-btn">
											<button class="btn btn-success" type="button"
												style="height: 46px;">인증번호</button>
										</span>
									</div>
									<br /> 
									<input id="Certification Number" class="form-control" type="text"
										placeholder="인증번호" name="Certification Number"><br />
									<input class="btn btn-default btn-register" type="button" value="Create account"
										name="commit" onclick="location.href='javascript: showFindPwResultForm();'">
								</form>
							</div>
							</div>
						</div>
					</div>
					
					<!-- 비밀번호 찾기 결과-->
					<div class="box">
						<div class="content findPwResultBox" style="display:none;">
							<div class="form">
								<div class="form">
								<form method="" html="{:multipart=>true}" data-remote="true" action=""
									accept-charset="UTF-8">
									
								<input id="password" class="form-control" type="password" placeholder="Password"
									name="password"> 
								<input id="password_confirmation" class="form-control"
									type="password" placeholder="Repeat Password" name="password_confirmation">
								<input class="btn btn-default btn-register" type="button" value="Create account"
										name="commit" onclick="location.href='javascript: showChangePwResultForm();'">
								
								</form>
							</div>
							</div>
						</div>
					</div>
					
					

				</div>
				
				
				<div class="modal-footer">

					<div class="forgot login-footer">
						<span>
							<a href="javascript: showRegisterForm();">회원가입</a>&nbsp;&nbsp;&nbsp;
							<a href="javascript: showFindIdForm();">아이디찾기</a>&nbsp;&nbsp;&nbsp;
							<a href="javascript: showFindPwForm();">비번찾기</a>
						</span>
					</div>

					<div class="forgot register-footer" style="display:none">
						<span>Already have an account?</span>
						<a href="javascript: showLoginForm();">Login</a>
					</div>
					
					<!-- 아이디 가입축하  -->
					<div class="forgot registerCheck-footer" style="display:none">
						<span></span>
					</div>
					
					<!-- 아이디 찾기  -->
					<div class="forgot idFind-footer" style="display:none">
						<span>로그인창으로돌아가기</span>
						<a href="javascript: showLoginIdFindForm();">Login</a>
					</div>
					<!-- 아이디 찾기 결과 -->
					<div class="forgot idFindResult-footer" style="display:none">
						<span>ㄴㅁㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇ</span>
						
					</div>
					<!-- 비밀번호 찾기 -->
				 	<div class="forgot findPw-footer" style="display:none">
						<span>로그인창으로돌아가기</span>
						<a href="javascript: findPw_Login();">Login</a>
					</div>
					<!-- 비밀번호 찾기 결과 -->
					<div class="findPwResult-footer" style="display:none">
						<span>로그인창으로돌아가기</span>
						<a href="javascript: findPwResult_Login();">Login</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>