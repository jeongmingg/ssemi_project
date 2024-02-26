<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		.enroll-form{
			width: 1500px;
			margin: auto;
			margin-top: 50px;
			margin-bottom: 50px;
			/* text-align: center; */
		}

		.enroll-form>div{
			width: 700px;
			margin: auto;
		}

		.enroll-form>h3{
			color: #E4910D;
			font-weight: bold;
			font-size: 30px;
			margin-bottom: 20px;
		}

		.enroll-form p{
			font-weight: bold;
			font-size: 18px;
			padding-left: 10px;
			margin-bottom: 10px;
			color: #E4910D;
		}

		.enroll-form small{
			font-weight: bold;
			color: gray;
		}

		#hr{
			border-top: 2px solid #E4910D;
			margin-top: 10px;
		}

		.enroll-form input{
			width: 300px;
			height: 45px;
			margin: 5px;
			border-radius: 5px;
			border: 1px solid gray;
			padding-left: 5px;
		}

		input[name=email], input[name=domain]{
			width: 150px;
		}

		#selectDomain{
			height: 45px;
			border-radius: 5px;
		}
		
		#check-email-btn{
			height: 45px;
			margin: 15px;
		}
		
		#required-area>div{
			padding-left: 100px;
		}

		#additional-area>table{
			margin-left: 100px;
		}

		#enroll-btn{
			background-color: #E4910D;
			border: #E4910D;
			/* width: 300px; */
			height: 40px;
			/* line-height: 25px; */
			margin: 15px;
		}

		#selectAddress{
			height: 45px;
    		border-radius: 5px;
			margin-left: 5px;
		}
	</style>
	
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

		<div id="required-area">
			<p>기본정보 <small>(필수)</small></p>
			<hr id="hr">
			<div>
				<input type="text" name="userId" placeholder="아이디" required> <br>
				<input type="password" name="userPwd" placeholder="비밀번호" required> <br>
				<input type="password" placeholder="비밀번호 확인" required> <br>
				<input type="text" name="userName" placeholder="이름" required> <br>
				<input type="text" name="nickname" placeholder="닉네임" required> <br>
				<input type="text" name="email" placeholder="이메일" required>
				@
				<input type="text" name="domain" required>
				<select name="domain" id="selectDomain" onchange="input_domain();">
					<option value="input-self">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
				</select>

				<button class="btn btn-secondary" id="check-email-btn">인증하기</button>
			</div>
		</div>

		<script>
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
			<button type="submit" class="btn btn-secondary" id="enroll-btn">가입하기</button>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>