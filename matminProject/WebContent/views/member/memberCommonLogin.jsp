<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginSuccess = (String)request.getAttribute("loginSuccess");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>

	<!-- css -->
	<link rel="stylesheet" href="resources/css/member/memberCommonLogin.css">

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

	<!-- jQuery library -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<!-- Popper JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

	<!-- js -->
	<script src="resources/js/member/memberCommonLogin.js"></script>

	<!-- kakao login -->
	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		Kakao.init('07b8e08ffb38a692cd2c2144e0dfa010'); // 사용하려는 앱의 JavaScript 키 입력
	</script>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>

	<div class="login-form">
		<div id="topBtn">
			<a href="#">
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="45" height="45" viewBox="0 0 32 32" fill="rgb(230, 126, 34)" data-svg-content="true">
		        	<g>
		            	<path d="M 17,2C 8.716,2, 2,8.716, 2,17S 8.716,32, 17,32S 32,25.284, 32,17S 25.284,2, 17,2z M 23.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0L 18,11.414L 18,27 C 18,27.552, 17.552,28, 17,28S 16,27.552, 16,27L 16,11.414 L 11.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0c-0.39-0.39-0.39-1.024,0-1.414l 6-6C 16.296,8.29, 16.298,8.29, 16.3,8.288 c 0.090-0.088, 0.198-0.162, 0.316-0.21c 0.244-0.102, 0.52-0.102, 0.764,0C 17.504,8.128, 17.614,8.2, 17.708,8.292l 6,6 C 24.098,14.684, 24.098,15.316, 23.708,15.708z"></path>
		        	</g>
	    		</svg>
			</a>
		</div>
		
		<% if(loginUser == null) { %>
			<h3>Login</h3>
	
			<div id="input_id_pwd">
				<form action="<%= contextPath %>/login.me" method="post">
				
					<input type="text" name="userId" placeholder="ID"> <br>
					<input type="password" name="userPwd" placeholder="Password"> <br>
	
					<% if(loginSuccess != null && loginSuccess.equals("실패")) { 	%>
						<span id="message" style="display: block;">* 아이디 또는 비밀번호를 잘못 입력했습니다.<br>입력하신 내용을 다시 확인해주세요.</span>
					<% } %>
					<span id="message" style="display: none;"></span>
					
					<button type="submit" id="loginBtn" class="btn btn-primary" onclick="return validate();"><b>로그인</b></button>
					
				</form>
			</div>
	
			<div id="click_other">
				<a href="<%= contextPath %>/findAccountForm.me">ID/PWD 찾기</a>
				<a href="<%= contextPath %>/chooseForm.me">회원가입</a>
			</div>
	
			<hr id="hr">
	
			<div id="sns-login">
				<p><b>간편 로그인</b></p>
	
				<a href="#" id="naver-login-btn" class="btn btn-primary"><img src="resources/loginImg/naver_login_logo.png" align="left"><span>네이버 로그인</span></a>
					<br>
				<a href="javascript:kakaoLogin()" id="kakao-login-btn"><img src="resources/loginImg/kakao_login.png"></a>
			</div>
		<% } else { %>
			<h3>이미 로그인 상태입니다.</h3>
		<% } %>
	</div>

	<script>
		function kakaoLogin() {
	        Kakao.Auth.login({
	            success: function (response) {
	                Kakao.API.request({
	                    url: '/v2/user/me',
	                    success: function (response) {
							$.ajax({
								url: 'idCheck.me',
								data: {checkId: response.id},
								success: function(result) {
									if(result == "NNNNN") {
										// 카카오로그인
										loginKakaoUser(response.id);
									} else {
										// 카카오 회원가입
										insertKakaoUser(response.id, response.kakao_account.email, response.kakao_account.name, response.properties.nickname);
									}
								},
								error: function() {
									console.log("카카오 로그인/회원가입용 ajax 통신 실패");
								}
							});

	                    },
	                    fail: function (error) {
	                        alert(JSON.stringify(error));
	                    },
	                })
	            },
	            fail: function (error) {
	                alert(JSON.stringify(error));
	            },
	        })
	    }

		function loginKakaoUser(id) {
			$.ajax({
				url: "kakaoLogin.me",
				type: "post",
				data: {userId: id},
				success: function() {
					location.href="<%= contextPath %>";
				},
				error: function() {
					console.log("kakao user login ajax 실패");
				}
			});
		}

		function insertKakaoUser(id, email, name, nickname) {
			$.ajax({
				url: "kakaoInsert.me",
				type: "post",
				data: {
					userId: id,
					email: email,
					userName: name,
					nickname: nickname
				},
				success: function() {
					alert(nickname + "님, 회원가입이 완료되었습니다.");
					location.href="<%= contextPath %>";
				},
				error: function() {
					console.log("kakao user insert ajax 호출 실패");
				}
			});
		}
	</script>

	<%@ include file="../common/footer.jsp" %>

</body>
</html>