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
					<input type="text" name="userId" placeholder="아이디" onchange="idCheck();"> <br>
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
								<option value="">강남구</option>
								<option value="">강북구</option>
								<option value="">강서구</option>
								<option value="">강동구</option>
								<option value="">관악구</option>
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

		<script>
			$(function() {
				$("input[name=userPwd]").change(function() {
					// 비밀번호: 영문(대소문자 구분), 숫자, 특수문자(!@#$%^&*) 포함 8자 이상 15자 이내
					const regExp = /^[a-zA-Z\d!@#$%^&*]{8,15}$/;

					const msg = $("#pwdMsg");

					if(!regExp.test($(this).val())) {
						msg.css("display", "block");
						msg.text("* 비밀번호: 8~15자의 영문 대소문자, 숫자, 특수기호(!@#$%^&*)만 사용 가능합니다.");
					} else {
						msg.css("display", "none");
						msg.text("");
					}
				});

				$("input[name=userPwd]").siblings("input[type=password]").change(function() {
					// 비밀번호 확인: 위에 입력한 비밀번호와 동일한지 확인
					const msg = $("#pwdCheckMsg");

					if($(this).val() != $("input[name=userPwd]").val()) {
						msg.css("display", "block");
						msg.text("* 입력한 비밀번호와 일치하지 않습니다.");
					} else {
						msg.css("display", "none");
						msg.text("");
					}
				});

				$("input[name=userName]").change(function() {
					// 이름: 한글 2자 이상 10자 이내
					const regExp = /^[가-힣]{2,10}$/;

					const msg = $("#nameMsg");

					if(!regExp.test($(this).val())) {
						msg.css("display", "block");
						msg.text("* 이름: 2~10자의 한글만 사용 가능합니다.");
					} else {
						msg.css("display", "none");
						msg.text("");
					}
				});

				$("input[name=nickname]").change(function() {
					// 닉네임: 영문, 한글, 숫자, _ 포함 2자 이상 10자 이내
					const regExp = /^[가-힣\w]{2,10}$/;

					const msg = $("#nicknameMsg");

					if(!regExp.test($(this).val())) {
						msg.css("display", "block");
						msg.text("* 닉네임: 2~10자의 영문 대소문자, 한글, 숫자, 특수문자(_)만 사용 가능합니다.");
					} else {
						msg.css("display", "none");
						msg.text("");
					}
				});

				$("#check-email-btn").click(function() {
					// 이메일: 반드시 값을 채우도록 확인
					const msg = $("#emailMsg");

					if($("input[name=email]").val() == "" || $("input[name=domain]").val() == "") {
						msg.css("display", "block");
						msg.text("* 이메일을 입력해주세요");
					} else {
						msg.css("display", "none");
						msg.text("");
					}
				});
			})

			function validate() {
				const idInput = $("input[name=userId]");
				const pwdInput = $("input[name=userPwd]");
				const pwdCheckInput = $("input[name=userPwd]").siblings("input[type=password]");
				const name = $("input[name=userName]");
				const nickname = $("input[name=nickname]");
				const email = $("input[name=email]");
				const domain = $("input[name=domain]");

				// if(idInput.val() == "" || ) {

				// }

				return false;
			}

			function idCheck() {
				const $idInput = $("input[name=userId]");
				
				$.ajax({
					url: "idCheck.me",
					data: {checkId: $idInput.val()},
					success: function(result) {
						if(result == "NNNNN") {
							$("#idMsg").css("display", "block");
							$("#idMsg").text("* 이미 사용 중인 아이디입니다.");
							$idInput.select();

						} else {
							// 아이디: 영문(대소문자 구분), 숫자, _ 포함 6자 이상 15자 이내 (첫글자는 영문으로)
							const regExp = /^[a-zA-Z][\w]{5,14}$/;

							const msg = $("#idMsg");

							if(!regExp.test($idInput.val())) {
								msg.css("display", "block");
								msg.text("* 아이디: 6~15자의 영문 대소문자, 숫자, 특수기호(_)만 사용 가능합니다. (첫 글자는 영문만 사용 가능합니다.)");
							} else {
								msg.css("display", "none");
								msg.text("");
							}
						}
					},
					error: function() {
						console.log("아이디 중복체크용 ajax 통신 실패");
					}
				});
				
			}

			function input_domain() {
				// 직접입력인 경우에는 input에 입력한 값으로 넘겨주고
				// 직접입력 외의 경우에는 선택한 값을 input에 넣어주자
				// 직접입력 외의 경우에는 input 수정 불가하게 하자 (readonly)

				const domainInput = $("input[name=domain]");

				if($("#selectDomain").val() == "input-self") {
					domainInput.val("");
					domainInput.removeAttr("readonly");
					domainInput.select();

				} else {
					domainInput.val($("#selectDomain").val());
					domainInput.attr("readonly", true);
				}

			}
		</script>

	</div>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>