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
	h3 {
		color: #e4910d;
		border: 2px solid;
		border-width: 0 0 2px;
		width: 300px;
		margin: auto;
	}

	.list-area{
		width: 1200px;
		margin: auto;
		text-align: center;
		border-color: rgb(177, 177, 177);
	}
	
	.list-area th{
		background-color:rgba(231, 231, 231, 0.842)
	}

	.search-area input{
		border: 1px solid gray;
		border-radius: 2px;
		border-width: 0 0 1px;
		outline: none;
	}
	.list-area tr{
		height: 40px;
	}
	.list-area>tbody>tr:hover{
    	background: #e4910d;
    	cursor:pointer;
    }
	.paging-area button{		
		background-color: #F4F4F4;
		border-radius: 2px;
	}
	.paging-area button:hover{		
		background-color: #e4910d;
		color: white;
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
		<h3 align="center" style="font-weight: 700;">맛집 등록 요청 / 삭제 </h3>
		<br>
			<div align="right" style="width: 1350px;">
				
				<!-- 검색창-->
				<table class="search-area">
				<tr>
					<td><input type="text" placeholder="닉네임을 입력해주세요" height="100%"></td>
					<td><a href="#" class="btn btn-sm btn-secondary">검색</a></td>
				</tr>
				</table>
			</div>
			<br>

			<!-- 게시판 목록-->
			<table class="list-area" align="center" border="1px">
				<thead>
					<tr>
						<th width="150">작성번호</th>
						<th width="300">게시판유형</th>
						<th width="380">제목</th>
						<th width="190">작성자</th>
						<th>작성일자</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="5">존재하는 공지사항이 없습니다.</td>
					</tr>

					<tr>
						<td>작성번호</td>
						<td>게시판유형</td>
						<td>제목</td>
						<td>사용자닉네임</td>
						<td>작성일자</td>
					</tr>
				</tbody>
		</table>
		<br>
		<div class="insert-area" align="right" style="width: 1350px;">
			<a href="#" class="btn btn-sm btn-secondary">등록</a>
		</div>

		<br><br>
		<!-- 페이징바-->

		<div class="paging-area" align="center">
			<button>&lt</button>
			<button>&gt</button>
		</div>

	</div>

	<%@ include file="../common/footer.jsp" %>
</body>
</html>