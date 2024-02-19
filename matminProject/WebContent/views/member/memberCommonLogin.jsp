<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		.login-form{
			width: 1800px;
			height: 1000px;
			margin: auto;
			margin-top: 50px;
			margin-bottom: 50px;
			text-align: center;
		}

		#loginBtn{
			background-color: #E4910D;
			border: #E4910D;
			width: 300px;
			height: 50px;
			line-height: 35px;
		}

		hr{
			width: 500px;
			border-top: 1px solid gray;
		}

		#naver-login-btn{
			background-color: #03c75a;
			border: #03c75a;
			width: 300px;
			height: 50px;
			line-height: 35px;
		}

		#kakao-login-btn{
			background-color: #f9e003;
			border: #f9e003;
			color: black;
			width: 300px;
			height: 50px;
			line-height: 35px;
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
		<div id="input_id_pwd">
			<input type="text"> <br>
			<input type="password"> <br>
			<button type="submit" id="loginBtn" class="btn btn-primary"><b>로그인</b></button>
		</div>
		<div id="click_other">
			<a href="#">ID/PWD 찾기</a>
			<a href="#">회원가입</a>
		</div>

		<hr>

		<div id="sns-login">
			<p><b>간편 로그인</b></p>

			<br>

			<a href="#" id="naver-login-btn" class="btn btn-primary"><b>네이버로 시작하기</b></a>
			<br><br>
			<a href="#" id="kakao-login-btn" class="btn btn-primary"><b>카카오로 시작하기</b></a>
		</div>
	</div>

	<%@ include file="../common/footer.jsp" %>

</body>
</html>