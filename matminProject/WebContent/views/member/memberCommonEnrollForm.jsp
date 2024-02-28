<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<!-- css -->
	<link rel="stylesheet" href="resources/css/member/memberCommonEnrollForm.css">
	
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
	<script src="resources/js/member/memberCommonEnrollForm.js"></script>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>

	<div class="enroll-form">
		<div id="topBtn">
			<a href="#">
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="45" height="45" viewBox="0 0 32 32" fill="rgb(230, 126, 34)" data-svg-content="true">
		        	<g>
		            	<path d="M 17,2C 8.716,2, 2,8.716, 2,17S 8.716,32, 17,32S 32,25.284, 32,17S 25.284,2, 17,2z M 23.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0L 18,11.414L 18,27 C 18,27.552, 17.552,28, 17,28S 16,27.552, 16,27L 16,11.414 L 11.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0c-0.39-0.39-0.39-1.024,0-1.414l 6-6C 16.296,8.29, 16.298,8.29, 16.3,8.288 c 0.090-0.088, 0.198-0.162, 0.316-0.21c 0.244-0.102, 0.52-0.102, 0.764,0C 17.504,8.128, 17.614,8.2, 17.708,8.292l 6,6 C 24.098,14.684, 24.098,15.316, 23.708,15.708z"></path>
		        	</g>
	    		</svg>
			</a>
		</div>

		<h3 align="center">회원가입</h3>

		<form action="#">
			<div id="required-area">
				<p>기본정보 <small>(필수)</small></p>
				<hr id="hr">
				<div>
					<input type="text" name="userId" placeholder="아이디" oninput="idCheck();"> <br>
					<span id="idMsg" class="message" style="display: none;"></span>

					<input type="password" name="userPwd" placeholder="비밀번호"> <br>
					<span id="pwdMsg" class="message" style="display: none;"></span>

					<input type="password" placeholder="비밀번호 확인"> <br>
					<span id="pwdCheckMsg" class="message" style="display: none;"></span>

					<input type="text" name="userName" placeholder="이름"> <br>
					<span id="nameMsg" class="message" style="display: none;"></span>

					<input type="text" name="nickname" placeholder="닉네임"> <br>
					<span id="nicknameMsg" class="message" style="display: none;"></span>

					<input type="text" name="email" placeholder="이메일">
					@
					<input type="text" name="domain">
					<select id="selectDomain" onchange="input_domain();">
						<option value="input-self">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
					</select>
					<button type="button" class="btn btn-secondary" id="check-email-btn">인증하기</button>
					<span id="emailMsg" class="message" style="display: none;"></span>
				</div>
			</div>
	
			<br>
	
			<div id="additional-area">
				<p>추가정보 <small>(선택)</small></p>
				<hr id="hr">
	
				<table>
					<tr>
						<th width="70">거주지</th>
						<td>
							서울특별시
							<select name="address" id="selectAddress">
								<option value="">선택안함</option>
								<option>강남구</option>
								<option>강북구</option>
								<option>강서구</option>
								<option>강동구</option>
								<option>관악구</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
	
			<br>
	
			<div id="btn-area" align="center">
				<button type="submit" class="btn btn-secondary" id="enroll-btn" onclick="return validate();">가입하기</button>
			</div>
		</form>
	</div>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>