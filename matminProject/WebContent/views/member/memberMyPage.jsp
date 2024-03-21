<%@page import="com.kh.location.model.vo.Location"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	ArrayList<Location> locationList = (ArrayList<Location>)request.getAttribute("locationList"); 
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>Insert title here</title>
	<!-- css -->
	<link rel="stylesheet" href="resources/css/member/memberMyPage.css" />
	<!-- jQuery library -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script> -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<!-- js -->
	<script src="resources/js/member/memberMyPage.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<%@ include file="../common/navigator.jsp"%>

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

		<% if(loginUser != null) { %>
		<% String memNo = loginUser.getMemNo();
			String address = (loginUser.getAddress() == null) ? "" :
			loginUser.getAddress(); String nickname = loginUser.getNickname(); 
		%>
		<!-- <h2 align="center" style="color: #E4910D;">마이페이지</h2> -->

		<div id="myPage-tab">
			<ul>
				<li id="info">
					<a class="tab active">내정보</a>
					<!-- <a href="#myInfo" class="tab active">내정보</a> -->
				</li>
				<li id="alert">
					<a class="tab">알림</a>
					<!-- <a href="#myAlert" class="tab">알림</a> -->
				</li>
				<li id="mark">
					<a onclick="markList('<%= memNo %>');" class="tab">찜꽁 리스트</a>
					<!-- <a href="#myMark" class="tab">찜꽁 리스트</a> -->
				</li>
				<li id="review">
					<a onclick="reviewList('<%= memNo %>');" class="tab">내가 쓴 리뷰</a>
					<!-- <a href="#myReview" class="tab">내가 쓴 리뷰</a> -->
				</li>
				<li id="board">
					<a onclick="boardList('<%= memNo %>');" class="tab">작성한 게시글</a>
					<!-- <a href="#myBoard" class="tab">작성한 게시글</a> -->
				</li>
			</ul>
		</div>

		<div class="myPage-info">
			<!-- 내정보 -->
			<div id="myInfo" class="info active">
				<form action="<%= contextPath %>/update.me" method="post">
					<input type="hidden" name="userId" value="<%= loginUser.getMemId() %>">
					<input type="hidden" name="email" value="<%= loginUser.getEmail() %>">
					<table>
						<tr>
							<td width="100">아이디</td>
							<td>
								<input type="text" value="<%= loginUser.getMemId() %>" disabled>
							</td>
						</tr>
						<tr>
							<td>이&nbsp;&nbsp;&nbsp;름</td>
							<td>
								<input type="text" name="userName" value="<%= loginUser.getMemName() %>">
								<span id="nameMsg" class="message" style="display: none"></span>
							</td>
						</tr>
						<tr>
							<td>닉네임</td>
							<td>
								<input type="text" name="nickname" value="<%= loginUser.getNickname() %>" oninput="nickCheck();">
								<span id="nicknameMsg" class="message" style="display: none"></span>
							</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>
								<input type="text" value="<%= loginUser.getEmail() %>" disabled>
							</td>
						</tr>
						<tr>
							<td>거주지</td>
							<td>
								<span>
									<p>서울특별시</p>
									<select name="address" id="selectAddress">
										<option value="">선택안함</option>
										<% for(int i = 0; i < locationList.size(); i++) { %>
										<option><%= locationList.get(i).getLocalName() %></option>
										<% } %>
									</select>
								</span>
								<script>
									$(function () {
										const address = "<%= address %>";

										$("select[name=address]>option").each(function () {
											if (address.includes($(this).val())) {
												$(this).attr("selected", true);
											}
										});
									});

									// 닉네임 실시간 체크
									function nickCheck() {
										const $nickInput = $("#myInfo input[name=nickname]");

										if ($nickInput.val() != "<%= nickname %>") {
											$.ajax({
												url: "nickCheck.me",
												data: { checkNick: $nickInput.val() },
												success: function (result) {
													if (result == "NNNNN") {
														$("#nicknameMsg").css("display", "block");
														$("#nicknameMsg").text("* 이미 사용 중인 닉네임입니다.");
													} else {
														// 닉네임: 영문, 한글, 숫자, _ 포함 2자 이상 10자 이내
														const regExp = /^[가-힣\w]{2,10}$/;

														const msg = $("#nicknameMsg");

														if (!regExp.test($nickInput.val())) {
															msg.css("display", "block");
															msg.text(
															"* 2~10자의 영문, 한글, 숫자, 특수문자(_)만 사용 가능합니다."
														);
														} else {
															msg.css("display", "none");
															msg.text("");
														}
													}
												},
												error: function () {
													console.log("닉네임 중복체크용 ajax 통신 실패");
												},
											});
										}
									}
								</script>
							</td>
						</tr>
					</table>
					<button type="button" id="changePwdBtn" data-toggle="modal" data-target="#changePwd">비밀번호 변경하기</button>
					<button type="submit" onclick="return validate();">개인정보 수정하기</button>
				</form>

				<a id="leaveBtn" data-toggle="modal" data-target="#leaveMem" style="color: rgb(177 177 177); cursor: pointer;">탈퇴하기 ></a>
			</div>

			<!-- The Modal -->
			<div class="modal" id="changePwd">
				<div class="modal-dialog">
				<div class="modal-content">
			
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">비밀번호 변경하기</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
			
					<!-- Modal body -->
					<div class="modal-body">
						<form action="<%= contextPath %>/updatePwd.me" method="post">
							<input type="hidden" name="memNo" value="<%= memNo %>">
							<table id="changePwdTB">
								<tr>
									<td width="120">현재 비밀번호</td>
									<td width="210">
										<input type="password" name="currentPwd">
										<span id="currentPwdMsg" class="message" style="display: none"></span>
									</td>
								</tr>
								<tr>
									<td>새 비밀번호</td>
									<td>
										<input type="password" name="newPwd">
										<span id="newPwdMsg" class="message" style="display: none"></span>
									</td>
								</tr>
								<tr>
									<td>새 비밀번호 확인</td>
									<td>
										<input type="password" id="newPwdCheck">
										<span id="newPwdCheckMsg" class="message" style="display: none"></span>
									</td>
								</tr>
							</table>
							<button class="btn btn-sm btn-secondary" type="submit" onclick="return modalValidate();">변경</button>
						</form>
					</div>
			
					<!-- Modal footer -->
					<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
			
				</div>
				</div>
			</div>

			<!-- The Modal -->
			<div class="modal" id="leaveMem">
				<div class="modal-dialog">
				<div class="modal-content">
			
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">회원 탈퇴</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
			
					<!-- Modal body -->
					<div class="modal-body">
						<span style="color: red;">* 탈퇴하고자 한다면, 비밀번호를 입력해주세요.</span>
						<form action="<%= contextPath %>/delete.me" method="post">
							<input type="hidden" name="memNo" value="<%= memNo %>">
							<table id="leaveMemTB">
								<tr>
									<td width="100">비밀번호</td>
									<td width="210">
										<input type="password" name="userPwd">
									</td>
								</tr>
							</table>
							<button class="btn btn-sm btn-danger" type="submit">탈퇴하기</button>
						</form>
					</div>
			
					<!-- Modal footer -->
					<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
			
				</div>
				</div>
			</div>

			<!-- 알림 -->
			<div id="myAlert" class="info"></div>

			<!-- 찜꽁 리스트 -->
			<div id="myMark" class="info">
				<span></span>
				<table id="rest-table" align="center"></table>
			</div>

			<!-- 내가 쓴 리뷰 -->
			<div id="myReview" class="info">
				<span></span>
				<div></div>
			</div>

			<!-- 작성한 게시글 -->
			<div id="myBoard" class="info">
				<!-- 게시판 목록-->
				<span></span> <br />
				<table class="list-area" align="center">
					<thead>
						<tr>
							<th width="150">작성번호</th>
							<th width="300">게시판유형</th>
							<th width="350">제목</th>
							<th width="150">작성자</th>
							<th>조회수</th>
							<th>작성일자</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
		<% } else { %>
			<h2>로그인이 필요한 서비스입니다.</h2>
		<% } %>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>