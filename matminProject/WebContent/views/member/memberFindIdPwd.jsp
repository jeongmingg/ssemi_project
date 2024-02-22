<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		.find-id-pwd{
			width: 1400px;
			height: 500px;
			margin: auto;
			margin-top: 50px;
			margin-bottom: 50px;
		}
		
		#findId, #findPwd{
			/* width: 750px; */
			width: 50%;
			height: 100%;
			float: left;
		}
		
		#findId>div, #findPwd>div{
			width: 600px;
			height: 400px;
			margin-top: 25px;
			/* border: 2px solid #E4910D; */
			/* border-radius: 20px; */
			padding-top: 30px;
		}

		/* #findId>div{padding-top: 50px;} */
		/* #findPwd>div{padding-top: 30px;} */
		
		#findIdBtn, #findPwdBtn{
			background-color: #E4910D;
			border: #E4910D;
			width: 300px;
			height: 50px;
			line-height: 35px;
		}
		
		form>input{
			width: 300px;
			height: 45px;
			margin: 10px;
			border-radius: 5px;
			border: 1px solid gray;
			padding-left: 5px;
		}

		p{
			font-size: 30px;
			color: #E4910D;
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

	<div class="find-id-pwd">
		<div id="findId" align="center">
			<div>

				<p><b>아이디 찾기</b></p>
	
				<form action="#" method="post">
	
					<input type="text" name="userName" placeholder="이름"> <br>
					<input type="text" name="email" placeholder="이메일"> <br>
	
					<br>

					<button type="submit" id="findIdBtn" class="btn btn-primary"><b>아이디 찾기</b></button>
	
				</form>

			</div>
		</div>

		<!-- <div style="width: 1px; height: 400px; float: left; border-left: 1px solid gray;"></div> -->

		<div id="findPwd" align="center">
			<div>

				<p><b>비밀번호 찾기</b></p>
	
				<form action="#" method="post">
	
					<input type="text" name="userName" placeholder="이름"> <br>
					<input type="text" name="userId" placeholder="아이디"> <br>
					<input type="text" name="email" placeholder="이메일"> <br>
	
					<br>

					<button type="submit" id="findPwdBtn" class="btn btn-primary"><b>비밀번호 찾기</b></button>
	
				</form>

			</div>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>