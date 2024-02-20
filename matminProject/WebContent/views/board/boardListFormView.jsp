<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	h3 {
		color: #e4910d;
		margin-left: 150px;
	}
	.listView-area{
		margin: auto;
		margin-top: 50px;
		text-align: center;
		border-color: rgb(177, 177, 177);
	}
	.listView-area tr>th{
		text-align: right;
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
<style>
	
</style>

<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>
	<br><br>

	<div class="outer">
		<h3 style="font-weight: 700" align="legt">맛집등록요청 / 삭제</h3>
		<div style="border: 1px solid rgb(202, 200, 200); width: 1200px; height: 600px;">
		
			<form action="#">
				<table class="listView-area" border="1px"> 
					<tr>
						<th>게시판 유형</th>
						<td><input type="radio"> 맛집등록요청</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th>제목</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th>식당이름</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th>식당주소</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th>내용</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th>사진</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>

				</table>


			</form>
		</div>





	</div>

	<%@ include file="../common/footer.jsp" %>
</body>
</html>