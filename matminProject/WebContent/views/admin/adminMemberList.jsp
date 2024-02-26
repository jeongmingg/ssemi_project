<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer{
	border: 1px solid orange;
	color: gray;
	width: 700px;
	margin: auto;
	margin-top: 50px;
	margin-bottom: 50px;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>

	<div class="outer">

		<br>
		<h2 align="center">회원목록</h2>
		<br>
		<table class="list-area" align="center" border="1">
			<!-- <thead> -->
				<tr>
					<th width="100">회원번호</th>
					<th width="100">회원이름</th>
					<th width="100">회원닉네임</th>
					<th width="200">회원이메일</th>
					<th width="200">회원거주지</th>
				</tr>

				<tr>
					<td width="100">matmin01</td>
					<th width="100">현빈</th>
					<th width="100">회원닉네임</th>
					<th width="200">회원이메일</th>
					<th width="200">회원거주지</th>
				</tr>

				<tr>
					<td width="100">matmin02</td>
					<th width="100">차은우</th>
					<th width="100">회원닉네임</th>
					<th width="200">회원이메일</th>
					<th width="200">회원거주지</th>
				</tr>

				<tr>
					<td width="100">matmin03</td>
					<th width="100">주지훈</th>
					<th width="100">회원닉네임</th>
					<th width="200">회원이메일</th>
					<th width="200">회원거주지</th>
				</tr>

				<tr>
					<td width="100">matmin04</td>
					<th width="100">김놔놔</th>
					<th width="100">회원닉네임</th>
					<th width="200">회원이메일</th>
					<th width="200">회원거주지</th>
				</tr>

				<tr>
					<td width="100">matmin05</td>
					<th width="100">김뫄뫄</th>
					<th width="100">회원닉네임</th>
					<th width="200">회원이메일</th>
					<th width="200">회원거주지</th>
				</tr>

				<tr>
					<td width="100">matmin06</td>
					<th width="100">회원이름</th>
					<th width="100">회원닉네임</th>
					<th width="200">회원이메일</th>
					<th width="200">회원거주지</th>
				</tr>

				<tr>
					<td width="100">matmin07</td>
					<th width="100">회원이름</th>
					<th width="100">회원닉네임</th>
					<th width="200">회원이메일</th>
					<th width="200">회원거주지</th>
				</tr>
			<!-- </thead> -->

		</table>

		<button align="center">back</button>
	</div>				
	<%@ include file="../common/footer.jsp" %>
</body>
</html>