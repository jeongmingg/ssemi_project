<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>맛집의 민족</title>
	
	<!-- css -->
	<link rel="stylesheet" href="resources/css/member/memberFindIdPwd.css">

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
	<script src="resources/js/member/memberFindIdPwd.js"></script>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>

	<div class="find-id-pwd">
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
			<div id="findId" align="center">
				<div>
	
					<p><b>아이디 찾기</b></p>
		
					<form action="<%= contextPath %>/findId.me" method="post">
		
						<input type="text" name="userName" id="nameInput1" placeholder="이름"> <br>
						<span class="message" id="nameMsg1" style="display: none;"></span>
	
						<input type="text" name="email" id="emailInput1" placeholder="이메일"> <br>
						<span class="message" id="emailMsg1" style="display: none;"></span>
		
						<br>
	
						<button type="submit" id="findIdBtn" class="btn btn-primary" onclick="return findId();"><b>아이디 찾기</b></button>
		
					</form>
	
				</div>
			</div>
	
			<!-- <div style="width: 1px; height: 400px; float: left; border-left: 1px solid gray;"></div> -->
	
			<div id="findPwd" align="center">
				<div>
	
					<p><b>비밀번호 찾기</b></p>
		
					<form action="<%= contextPath %>/findPwd.me" method="post">
		
						<input type="text" name="userName" id="nameInput2" placeholder="이름"> <br>
						<span class="message" id="nameMsg2" style="display: none;"></span>

						<input type="text" name="userId" id="idInput" placeholder="아이디"> <br>
						<span class="message" id="idMsg" style="display: none;"></span>

						<input type="text" name="email" id="emailInput2" placeholder="이메일"> <br>
						<span class="message" id="emailMsg2" style="display: none;"></span>
		
						<br>
	
						<button type="submit" id="findPwdBtn" class="btn btn-primary" onclick="return findPwd();"><b>비밀번호 찾기</b></button>
		
					</form>
	
				</div>
			</div>
		<% } else { %>
			<h3>이미 로그인 상태입니다.</h3>
		<% } %>
	</div>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>