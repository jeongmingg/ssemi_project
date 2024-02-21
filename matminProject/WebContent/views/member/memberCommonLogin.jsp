<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<style>
		.login-form{
			width: 1800px;
			margin: auto;
			margin-top: 50px;
			margin-bottom: 50px;
			text-align: center;
		}

		.login-form>h3{
			color: #E4910D;
			font-weight: bold;
			font-size: 40px;
			margin-bottom: 20px;
		}

		form>input[type=text], form>input[type=password]{
			width: 300px;
			height: 45px;
			margin: 5px;
			border-radius: 5px;
			border: 1px solid gray;
			padding-left: 5px;
		}

		#loginBtn{
			background-color: #E4910D;
			border: #E4910D;
			width: 300px;
			height: 40px;
			line-height: 25px;
			margin: 15px;
		}

		#click_other>a{
			color: #E4910D;
			margin: 20px;
			font-size: 13px;
		}

		#hr{
			width: 400px;
			border-top: 2px solid darkgray;
			margin-top: 20px;
		}

		#sns-login>p{color: #E4910D;}

		#sns-login>a{
			width: 300px;
			height: 40px;
			line-height: 25px;
			margin: 5px;
		}

		#naver-login-btn{
			background-color: #03c75a;
			border: #03c75a;
		}

		#kakao-login-btn{
			background-color: #f9e003;
			border: #f9e003;
			color: black;
		}
	</style>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

	<!-- Popper JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>

	<div class="login-form">
		<h3>Login</h3>

		<div id="input_id_pwd">
			<form action="<%= contextPath %>/login.me" method="post">
			
				<input type="text" name="userId" placeholder="ID" required> <br>
				<input type="password" name="userPwd" placeholder="Password" required> <br>
				<input type="checkbox" name="autoLogin" id="autoLogin">
				<label for="autoLogin" style="font-size: 13px;">자동 로그인</label> <br>
				
				<button type="submit" id="loginBtn" class="btn btn-primary"><b>로그인</b></button>
				
			</form>
		</div>
		<div id="click_other">
			<a href="#">ID/PWD 찾기</a>
			<a href="#">회원가입</a>
		</div>

		<hr id="hr">

		<div id="sns-login">
			<p><b>간편 로그인</b></p>

			<a href="#" id="naver-login-btn" class="btn btn-primary"><b>네이버로 시작하기</b></a>
			<br>
			<a href="#" id="kakao-login-btn" class="btn btn-primary"><b>카카오로 시작하기</b></a>
		</div>
	</div>

	<%@ include file="../common/footer.jsp" %>

</body>
</html>