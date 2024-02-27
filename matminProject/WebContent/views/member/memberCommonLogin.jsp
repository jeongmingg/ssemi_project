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
		
		<h3>Login</h3>

		<div id="input_id_pwd">
			<form action="<%= contextPath %>/login.me" method="post">
			
				<input type="text" name="userId" placeholder="ID" required> <br>
				<input type="password" name="userPwd" placeholder="Password" required> <br>
				<input type="checkbox" name="autoLogin" id="autoLogin" style="cursor: pointer;">
				<label for="autoLogin" style="font-size: 13px; cursor: pointer;">자동 로그인</label> <br>

				<% if(loginSuccess != null && loginSuccess.equals("실패")) { 	%>
					<span id="message" style="display: block;">아이디 또는 비밀번호를 잘못 입력했습니다.<br>입력하신 내용을 다시 확인해주세요.</span>
				<% } %>
				<span id="message" style="display: none;"></span>
				
				<button type="submit" id="loginBtn" class="btn btn-primary" onclick="return validate();"><b>로그인</b></button>
				
			</form>
		</div>

		<script>
			function validate() {
				const userId = $("input[name=userId]").val();
				const userPwd = $("input[name=userPwd]").val();
				const messageArea = $("#message");

				if(userId == "") {
					messageArea.css("display", "block");
					messageArea.text("아이디를 입력해주세요.");

					return false;

				} else if(userPwd == "") {
					messageArea.css("display", "block");
					messageArea.text("비밀번호를 입력해주세요.");

					return false;
				}
			}
		</script>

		<div id="click_other">
			<a href="<%= contextPath %>/findAccountForm.me">ID/PWD 찾기</a>
			<a href="<%= contextPath %>/chooseForm.me">회원가입</a>
		</div>

		<hr id="hr">

		<div id="sns-login">
			<p><b>간편 로그인</b></p>

			<a href="#" id="naver-login-btn" class="btn btn-primary"><img src="resources/loginImg/naver_login_logo.png" align="left"><span>네이버 로그인</span></a>
				<br>
				<a href="#" id="kakao-login-btn"><img src="resources/loginImg/kakao_login.png"></a>
		</div>
	</div>

	<%@ include file="../common/footer.jsp" %>

</body>
</html>