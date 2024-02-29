<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="resources/assets/css/lithium.css"/>
	<link rel="stylesheet" href="resources/assets/fonts/material-icons/material-icons.css" />
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
		width: 260px;
		margin: auto;
	}

	.list-area{
		width: 1200px;
		margin: auto;
		text-align: center;
		border-color: rgb(177, 177, 177);
	}
	
	.list-area tr{
		border-top: 1.5px solid darkgray;
		border-bottom: 1.5px solid darkgray;
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
		background-color: rgba(92, 92, 92, 0.342);
    	cursor:pointer;
		font-weight: bolder;
    }
    .pagination{width: 350px;}

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

		<h3 align="center" style="font-weight: 700;">맛집등록요청 / 삭제 </h3>
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
				<tbody>
					<tr>
						<td colspan="6">존재하는 공지사항이 없습니다.</td>
					</tr>

					<tr>
						<td>작성번호</td>
						<td>게시판유형</td>
						<td>제목</td>
						<td>사용자닉네임</td>
						<td>조회수</td>
						<td>작성일자</td>
					</tr>
				</tbody>
		</table>
		
		<script>
			$(function(){
				$(".list-area>thead>tr").click(function(){
					location.href = '<%= contextPath %>/detail.bo?bno=' + &(this).children().eq(0).text();
				})
			})
		
		
		<br>
		<div class="insert-area" align="right" style="width: 1350px;">
			<a href="<%= contextPath %>/listForm.bo" class="btn btn-sm btn-secondary">등록</a>
		</div>

		<br><br>
		<!-- 페이징바-->
              <div class="pagination">
                <div class="pagination-group direction">
                  <ul>
                    <li class="disabled"><a href="<%= contextPath %>/list.bo?cpage=<%= " class="pagination-item left"><i class="Licon ico-left"></i></a></li>
                  </ul>
                </div>
                <div class="pagination-group">
                  <ul>
                    <li class="on"><a href="#" class="pagination-item">1</a></li>
                    <li class=""><a href="#" class="pagination-item">2</a></li>
                    <li class=""><a href="#" class="pagination-item">3</a></li>
                    <li class=""><a href="#" class="pagination-item">4</a></li>
                    <li class=""><a href="#" class="pagination-item">5</a></li>
                  </ul>
                </div>
                <div class="pagination-group direction">
                  <ul>
                    <li class=""><a href="#" class="pagination-item right"><i class="Licon ico-right"></i></a></li>
                  </ul>
                </div>
              </div>
            </div>


		<!-- -->
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