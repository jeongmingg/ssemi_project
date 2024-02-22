<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="resources/assets/css/lithium.css"/>
	<link rel="stylesheet" href="resources/arssets/fonts/material-icons/material-icons.css" />
<style>
	.outer {
		width: 1500px;
		height: 800px;
	    margin: auto;
	    margin-top: 50px;
	}
	.outer div{
		margin: auto;
	}
	.outerin-area{
		border: 2px solid lightgray; 
		width: 1200px; 
		height: 650px; border-radius: 5px;
	}
	h3 {
		color: #e4910d;
		margin-left: 150px;
	}
	.listView-area{
		margin: auto;
		margin-top: 50px;
		text-align: center;
		border-radius: 5px;
		height: 500px;
	}
	.listView-area tr>th{
		text-align: right ;
	}
	[type="text"]{
		border-radius: 5px;
		border: 1px solid lightgray;
		height: 35px;
	}
	.listView-area input:focus{
		outline: solid #e4910d;
	}
	.listView-area #enroll:focus{
		outline: none;
	}
	.listView-area #delete:focus{
		outline: none;
	}
	.listView-area tr>td textarea{
		width: 89%;
		height: 200px;
		resize: none;
		border-radius: 5px;
		border: 1.5px solid lightgray;
	}
	.listView-area tr>td textarea:focus{
		outline: solid #e4910d;
	}
	.listView-area tr>td{
		width: 10px;
	}
	ul.tag-group {
		display: block;
		width: auto;
		height: auto;
		font-size: 0;
		margin: 0px;
	}
	.tag-group .btn{
		width: 30px;
	}
	.btn > .label {
		vertical-align: 0;
	}
	
	/*라디오버튼 색상 변경*/
	[type="radio"]{
		appearance: none; 
		width: 15px;
		height: 15px;
		border: 2px solid #ccc; 
		border-radius: 50%;
		outline: none;
		cursor: pointer;
		margin-right: 6px;
		margin-bottom: 10px;
		accent-color: #e4910d;
		vertical-align: -13px
		}
	[type='radio']:checked {
 		background-color: #e4910d;
  		border: 3px solid white;
  		box-shadow: 0 0 0 1.6px #e4910d;
	}
	label{
		margin-top: 13px;
	}
	textarea::placeholder{
		font-size: 0.8em;
		color: gray;
		padding-top: 8px;
		padding-left: 3px;
		}
	[type="text"]::placeholder{
		font-size: 0.8em;
		color: gray;
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
<title>Insert title here</title>
</head>

<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>
	<br><br>

	<div class="outer">
		<h3 style="font-weight: 700" align="legt">맛집등록요청 / 삭제</h3>
		<div class= "outerin-area" >

		<!-- 맛집 등록 요청시 -->
			<form action="#">
				<table class="listView-area" style="width: 1200px">
					<tr>
						<th width="100" height="70" >게시판 유형</th>
						<td></td>
						<td style="width: 80px;">
						  <label>
							<input type="radio" name="enroll" value="enroll" id="enroll" checked onclick="enrollF();">맛집 등록 요청</td>
						  </label>	
						<td style="width: 80px;">
						  <label>
							<input type="radio" name="enroll" value="delete" id="delete" onclick="deleteF();"">맛집 등록 삭제</td>
						  </label>
						</tr>
					<tr>
						<th height="50">제목</th>
						<td></td>
						<td colspan="2" align="left">

						<!-- 라디오 버튼클릭시 변경-->
							<input type="text" name="title" style="width: 100%;" required>
							<!-- <input type="text" name="title" style="width: 100%;"required> -->
						</td>

						<th style="text-align: center; width: 150px";>닉네임
							<input type="text" nme="name" style="width: 150px; font-weight: lighter;" required>
						</th>
						
						<th style="width: 150px; text-align: left;">작성일자
							<input type="text" name="enrollDate" style="width: 180px; font-weight: lighter; text-align: center;">
						</th>
					</tr>
					<tr>
						<th height=50>식당이름</th>
						<td></td>
						<td colspan="2" align="left">
							
							<input type="text" name="restName" style="width: 100%;" placeholder="  식당이름을 입력하세요." required>
						</td>

					</tr>
					<tr>
						<th height=50>식당주소</th>
						<td></td>
						<td colspan="2" align="left">
							<input type="text" style="width: 100%;" name="restAdd" placeholder="  식당주소를 입력하세요." required>
						</td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<th height="40" >내용</th>
						<td></td>
						<td colspan="4" align="left">

							<!-- 라디오 버튼클릭시 변경-->
							<textarea name="content" placeholder="  추천메뉴, 식당 전화번호 등 식당 정보를 자유롭게 적어주세요(300자 이내)"  required></textarea>
							
							<!-- <textarea name="content" placeholder="  식당 삭제 요청 이유를 자유롭게 적어주세요(300자 이내)."  required></textarea> -->
						</td>
					</tr>

					<!-- 사진 
					-->
					<tr>
						<th height="0">사진</th>
						<td></td>
						<td colspan="4">	
							<ul class="tag-group">
								<li>
								<button class="btn btn-sm btn-container" style="color: #e4910d;">
									<span class="label" style="font-size: 30px;" align="center">+</span>
								  </button>
								<li>
								<li></li>
								  <span class="tag tag-with-tools tag-sm">
									<span class="label">Document.png</span>
									<span class="tools">
									  <span class="tools-item error"><i class="material-icons">error_outline</i></span>
									</span>
								  </span>
								</li>
							  </ul>
						</td>
					</tr>
				</table>

				<div align="center">
					<br>
					<a href="#" class="btn btn-sm btn-secondary">등록</a>
					<a href="#" class="btn btn-sm btn-secondary">취소</a>
				</div>
			</form>
		</div>
	</div>

		<div id="topBtn">
			<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="45" height="45" viewBox="0 0 32 32" fill="rgb(230, 126, 34)" data-svg-content="true">
				<g>
					<path d="M 17,2C 8.716,2, 2,8.716, 2,17S 8.716,32, 17,32S 32,25.284, 32,17S 25.284,2, 17,2z M 23.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0L 18,11.414L 18,27 C 18,27.552, 17.552,28, 17,28S 16,27.552, 16,27L 16,11.414 L 11.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0c-0.39-0.39-0.39-1.024,0-1.414l 6-6C 16.296,8.29, 16.298,8.29, 16.3,8.288 c 0.090-0.088, 0.198-0.162, 0.316-0.21c 0.244-0.102, 0.52-0.102, 0.764,0C 17.504,8.128, 17.614,8.2, 17.708,8.292l 6,6 C 24.098,14.684, 24.098,15.316, 23.708,15.708z"></path>
				</g>
			</svg>
		</div>


	</div>

	<%@ include file="../common/footer.jsp" %>
</body>
</html>