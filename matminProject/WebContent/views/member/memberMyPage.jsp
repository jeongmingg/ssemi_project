<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- css -->
	<link rel="stylesheet" href="resources/css/member/memberMyPage.css">
	<!-- jQuery library -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<!-- js -->
	<script src="resources/js/member/memberMyPage.js"></script>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>

	<% if(loginUser != null) { %>
		<div class="myPage">
			<div id="topBtn">
				<a href="#">
					<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="45" height="45" viewBox="0 0 32 32" fill="rgb(230, 126, 34)" data-svg-content="true">
			        	<g>
			            	<path d="M 17,2C 8.716,2, 2,8.716, 2,17S 8.716,32, 17,32S 32,25.284, 32,17S 25.284,2, 17,2z M 23.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0L 18,11.414L 18,27 C 18,27.552, 17.552,28, 17,28S 16,27.552, 16,27L 16,11.414 L 11.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0c-0.39-0.39-0.39-1.024,0-1.414l 6-6C 16.296,8.29, 16.298,8.29, 16.3,8.288 c 0.090-0.088, 0.198-0.162, 0.316-0.21c 0.244-0.102, 0.52-0.102, 0.764,0C 17.504,8.128, 17.614,8.2, 17.708,8.292l 6,6 C 24.098,14.684, 24.098,15.316, 23.708,15.708z"></path>
			        	</g>
		    		</svg>
				</a>
			</div>
	
			<!-- <h2 align="center" style="color: #E4910D;">마이페이지</h2> -->
	
			<div id="myPage-tab">
				<ul>
					<li>
						<a class="tab active">내정보</a>
						<!-- <a href="#myInfo" class="tab active">내정보</a> -->
					</li>
					<li id="alert">
						<a class="tab">알림</a>
						<!-- <a href="#myAlert" class="tab">알림</a> -->
					</li>
					<li id="mark">
						<a class="tab">찜꽁 리스트</a>
						<!-- <a href="#myMark" class="tab">찜꽁 리스트</a> -->
					</li>
					<li id="review">
						<a class="tab">내가 쓴 리뷰</a>
						<!-- <a href="#myReview" class="tab">내가 쓴 리뷰</a> -->
					</li>
					<li>
						<a class="tab">작성한 게시글</a>
						<!-- <a href="#myBoard" class="tab">작성한 게시글</a> -->
					</li>
				</ul>
			</div>
	
			<div class="myPage-info">
				<!-- 내정보 -->
				<div id="myInfo" class="info active">
					<table>
						<tr>
							<td width="100">이름</td>
							<td><input type="text" value="<%= loginUser.getMemName() %>" disabled></td>
						</tr>
						<tr>
							<td>아이디</td>
							<td><input type="text" value="<%= loginUser.getMemId() %>" disabled></td>
						</tr>
						<tr>
							<td>닉네임</td>
							<td><input type="text" value="<%= loginUser.getNickname() %>" disabled></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" value="<%= loginUser.getEmail() %>" disabled></td>
						</tr>
						<tr>
							<td>거주지</td>
							<% if(loginUser.getAddress() != null) { %>
								<td><input type="text" value="<%= loginUser.getAddress() %>" disabled></td>
							<% } else { %>
								<td><input type="text" value="선택안함" disabled></td>
							<% } %>
						</tr>
					</table>
	
					<a href="#">개인정보 수정</a>
				</div>
				<!-- 알림 -->
				<div id="myAlert" class="info"></div>
				<!-- 찜꽁 리스트 -->
				<div id="myMark" class="info"></div>
				<!-- 내가 쓴 리뷰 -->
				<div id="myReview" class="info"></div>
				<!-- 작성한 게시글 -->
				<div id="myBoard" class="info"></div>
			</div>
		</div>
	<% } else { %>
		<h2>로그인이 필요한 서비스입니다.</h2>
	<% } %>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>