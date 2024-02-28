<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

Latest compiled and minified CSS
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
	.outer {
	    width: 1300px;
	    height: auto;
	    margin: auto;
	    margin-top: 50px;
	}
	.slide-area{
		height:300px;
		margin: auto;
	}
	.slide-area div{
		height: 100%;
		float: left;
	}
	.btn-left, .btn-right{
		width: 15%;
	}
	.img-slide{
		width: 70%;
	}
	.rest-title{
		height: 140px;
		margin: auto;
		width: 1000px;
	}
	span{
		font-size: 18px;
	}
	.score{
		font-size: 25px;
		font-weight: 700;
		color: #e4910d;
		padding-left: 3px;
	}
	.short-menu{
		display: block;
		color: gray;
	}
	.short-menu, .short-locate{
		padding: 5px 0px;
	}
	.short-locate{
		font-weight: 800;
	}
	.heart-count-area, .btn-share-area{
		display: inline-block;
		padding: 0px 10px;
	}
	.heart-count-area{
		padding-left: 650px;
		font-weight: 700px;
		color: rgb(88, 88, 88)
	}
	.btn-share-area{
		float:inline-end;
	}
	#btn-share{
		background-color: #e4910d;
		border: none;
		font-size: 18px;
		height: 30px;
		width: 80px;
		line-height: 1.2;
	}
	h1{
		font-size: 35px;
		font-weight: 700;
	}
	.text-line{
		border-top: 1.5px solid gray;
		width: 1020px;
		margin: auto
	}
	.rest-detail{
		height: 1000px;
		width: 1000px;
		margin: auto;
		padding-top: 30px;
	}
	.list{
		padding: 40px 80px;
	}

	.list>div{
		background-size: 25px;
		padding-left: 35px;
		padding-bottom: 0px;
		box-sizing: border-box;
		font-size: 18px;
		margin-bottom: 7px;
	}
	.list-locate{
		background: url(https://s3-ap-northeast-1.amazonaws.com/dcicons/new/images/web/profile/profile-location@2x.png) no-repeat top left;
	}
	.list-tel{
		background: url(https://s3-ap-northeast-1.amazonaws.com/dcicons/new/images/web/profile/profile-pnum@2x.png)
   		 no-repeat left;
	}
	.list-tel>span{
		padding-left:56px 
	}
	.list-time>span, .list-menu>span{
		padding-left: 37px;
	}
		
	.list-time{
		background: url(https://e7.pngegg.com/pngimages/8/839/png-clipart-telephone-computer-icons-windows-phone-store-iphone-iphone-electronics-mobile-phones-thumbnail.png) no-repeat left;
	}
	.list-park{
		background: url(https://e7.pngegg.com/pngimages/836/364/png-clipart-the-daily-dot-internet-online-newspaper-queerbaiting-actor-parking-miscellaneous-text-thumbnail.png) no-repeat left;
	}
	.list-menu{
		background: url(https://e7.pngegg.com/pngimages/648/123/png-clipart-computer-icons-computer-file-apple-icon-format-room-menu-para-restaurante-hand-room-thumbnail.png) no-repeat top left;
		
	}
	.list-menu{
		height: auto;
	}

	.menu-item{
		margin: 0px;
	}

	ul>li{
		list-style: none;
		border-bottom: dashed 0.8px gray; 
		padding-top: 5px;
	}
	.menu>span{
		padding-left: 34px;
	}
	.icon {
		line-height: 26px;
		border: 2px solid #e4910d;
		background-color: #e4910d;
		border-radius: 10px;
		color: aliceblue;
		font-size: 13px;
		font-weight: 600;
		padding: 0px 11px;
		margin-left: 8px;
		vertical-align: top;
		}

	.menu-price{
		float: right
	}
	.text-line2{
		color: gray;
		padding-left: 30px;
		margin-bottom: 5px;
		width: 100px;
		display: none;
	}

</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>
	<br>
	<div class="outer">
		<div class="slide-area">
			<div class="btn-left"></div>
			<div class="img-slide"></div>
			<div class="btn-right"></div>

		</div>
		<br>
			<div class="rest-title">
				<div class="rest-name">
					<h1 style="display: contents;">홍루이젠</h1> 
					<span class="score">4.0</span>
				</div>
					<span class="short-menu">간단 메뉴 소개</span>
				<div>
					<span class="short-locate">서울-강남 > 청남동</span>
					<div class="heart-count-area">
						<img src="">
						<span>찜꽁()</span>
					</div>
					<div class="btn-share-area">
						<a href="" id="btn-share" class="btn btn-sm btn-secondary">
							<img src="" alt="">
							<span>공유</span>
						</a>
					</div>
				</div>
			</div>
			<div class="text-line"></div>

			<div class="rest-detail">
				<div class="list">
					<div class="list-locate">주소
						<span>서울특별시 블라블라</span>
					</div>
					<div class="list-add"><img src="https://m.imaeil.com/photos/2019/01/17/2019011721343483904_l.jpg"></div>
					<div class="list-tel">연락처
						<span>02-999-9999</span>
					</div>
					<div class="list-time">영업시간
						<span>09:00 - 17:00</span>
					</div>
					<div class="list-park">주차
						<span>가능</span>
					</div>
					<div class="list-menu">
							<div class="list-menu-name">
								<div class="list-menu-name-title">메뉴정보</div>
							
								<div class="list-menu-detail">
									<ul>
										<li>
											<p class="menu-item">
												<span class="rest-menu">햄치즈샌드위치</span>
												<span class="icon">추천</span>
												<span class="text-line2">-------------------------------------------------------------------</span>
												<span class="menu-price">3,900원</span>
											</p>
										<li>
											<p class="menu-item">
												<span class="rest-menu">감자샌드위치</span>
												<span class="icon">추천</span>
												<span class="text-line2">-------------------------------------------------------------------</span>
												<span class="menu-price">3,900원</span>
											</p>
										</li>
										</li>
										<li>
											<p class="menu-item">
												<span class="rest-menu">치즈샌드위치</span>
												<span class="text-line2">-------------------------------------------------------------------</span>
												<span class="menu-price">3,900원</span>
											</p>
										</li>
										<li>
											<p class="menu-item">
												<span class="rest-menu">토마토샌드위치</span>
												<span class="text-line2">-------------------------------------------------------------------</span>
												<span class="menu-price">3,900원</span>
											</p>
										</li>
										<li>
											<p class="menu-item">
												<span class="rest-menu">베이컨샌드위치</span>
												<span class="icon">추천</span>
												<span class="text-line2">-------------------------------------------------------------------</span>
												<span class="menu-price">3,900원</span>
											</p>
										</li>
									</ul>
								</div>
							</div>

					</div>
				</div>

			
			

			</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>