<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String memName = (String)request.getAttribute("memName");
	String memId = (String)request.getAttribute("memId");
	String email = (String)request.getAttribute("email");
	String memNo = (String)request.getAttribute("memNo");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<!-- css -->
	<link rel="stylesheet" href="resources/css/member/memberFindPwd.css">
	
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
	<script src="resources/js/member/memberFindPwd.js"></script>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>
	
	<div class="find-pwd-area">
		<div id="topBtn">
			<a href="#">
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="45" height="45" viewBox="0 0 32 32" fill="rgb(230, 126, 34)" data-svg-content="true">
		        	<g>
		            	<path d="M 17,2C 8.716,2, 2,8.716, 2,17S 8.716,32, 17,32S 32,25.284, 32,17S 25.284,2, 17,2z M 23.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0L 18,11.414L 18,27 C 18,27.552, 17.552,28, 17,28S 16,27.552, 16,27L 16,11.414 L 11.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0c-0.39-0.39-0.39-1.024,0-1.414l 6-6C 16.296,8.29, 16.298,8.29, 16.3,8.288 c 0.090-0.088, 0.198-0.162, 0.316-0.21c 0.244-0.102, 0.52-0.102, 0.764,0C 17.504,8.128, 17.614,8.2, 17.708,8.292l 6,6 C 24.098,14.684, 24.098,15.316, 23.708,15.708z"></path>
		        	</g>
	    		</svg>
			</a>
		</div>

		<script>
			const memName = '<%= memName %>'
			const memId = '<%= memId %>'
			const email = '<%= email %>'
			const memNo = '<%= memNo %>'
		</script>
		
		<% if(loginUser == null) { %>
			<div class="result-area">
			<% if(!"".equals(memNo)) { %>
			<!-- 1. 조회됐을 경우 -->
				<div>
					<form action="#">
						<table>
							<tr height="50">
								<td>인증번호 : </td>
								<td><input type="text" name="auth"></td>
								<td><button type="button" class="btn btn-sm btn-secondary">인증하기</button></td>
							</tr>
							<tr height="50">
								<td>새 비밀번호 : </td>
								<td><input type="password" name="newPwd"></td>
								<td></td>
							</tr>
							<tr height="50">
								<td>비밀번호 확인 : </td>
								<td><input type="password" id="checkPwd"></td>
								<td></td>
							</tr>
						</table>

						<button type="submit" class="btn btn-sm btn-secondary" id="changePwdBtn">변경하기</button>
					</form>
				</div>
			<% } else { %>
			<!-- 2. 조회되지 않았을 경우 -->
				<span><strong>고객님의 정보와 일치하는 계정이 존재하지 않습니다.</strong></span>
				<div class="btn-area">
					<a href="<%= contextPath %>/chooseForm.me" class="btn btn-sm btn-secondary" id="enrollBtn">회원가입</a>
					<a href="<%= contextPath %>/findAccountForm.me" class="btn btn-sm btn-secondary" id="mainPageBtn">ID/PWD 찾기</a>
				</div>
			<% } %>
			</div>
		<% } else { %>
			<h3>이미 로그인 상태입니다.</h3>
		<% } %>
	</div>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>