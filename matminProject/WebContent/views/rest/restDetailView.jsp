
<%@page import="com.kh.board.model.vo.ImgFile"%>
<%@page import="com.kh.review.model.vo.Review"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.rest.model.vo.Rest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% Rest r = (Rest)request.getAttribute("r"); 
   String[] restAdd = r.getRestAddress().split(" ");
   String rAdd = restAdd.length > 1 ? restAdd[1] : "";
   
   /* 별점 채우기위한 퍼센트 변수 */
   double score = (double)r.getRestAvg();
   double maxScore = 5.0;
   double percent = (score/maxScore) * 100;
	// 소수점 한 자리까지 반올림하여 문자열로 변환(css 속성으로 받으려면 문자열만가능)
   String star = String.format("%.1f", percent);
	
   ArrayList<Review> rv = (ArrayList<Review>)request.getAttribute("rvList");
   ArrayList<ImgFile> img = (ArrayList<ImgFile>)request.getAttribute("imgList");

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>

<style>

	/* 전체 클래스 스타일*/
	.outer {
	    width: 1300px;
	    height: auto;
	    margin: auto;
	    margin-top: 50px;
	}

	/* 슬라이드바 스타일*/
	.slide-area{
		height:300px;
		margin: auto;
	}
	.slide-area div{
		height: 100%;
		float: left;
	}
	.img-slide{
		width: 70%;
	}

	/* 슬라이드 버튼 스타일*/
	.btn-left, .btn-right{
		width: 15%;
	}

	/* 식당 제목 스타일 */
	.rest-title{
		height: 140px;
		margin: auto;
		width: 900px;
		
		
	}
	h1{
		font-size: 35px;
		font-weight: 700;
	}
	.score{
		font-size: 30px;
		font-weight: 700;
		color: #e4910d;
		padding-left: 3px;
	}

	/* 식당 부제목 스타일*/
	span{
		font-size: 18px;
	}

	.short-menu{
		display: block;
		color: gray;
	}
	.short-menu, .short-add{
		padding: 5px 0px;
	}

	.rest-add{
		display: flex;
	}
	/*식당 부제목 위치 스타일*/
	.short-add{
		font-weight: 800;
	}

	/* 찜꽁 스타일 */
	.heart-count-area, .btn-share-area{
		display: inline-block;
		padding: 0px px;
	}
	.heart-count-area{
		padding-left: 560px;
		padding-top: 4px;
		font-weight: 700px;
		color: rgb(88, 88, 88);
	}

	/* 공유버튼 스타일 */

	.btn-share-area{
		padding-left: 30px;
		display: flex;
		padding-top: 4px;
	}
	.btn-share{
		text-decoration-line: none;
		color: white;
		width: 80px;
		height: 30px;
		background: url(https://img.icons8.com/material-rounded/96/FFFFFF/thumbs-down.png) no-repeat;
		background-size: 20px;
		padding-left: 18px;
		position: relative;
		background-color: #F39C12;
		padding-top: 5px;
		background-position: 9px 5px;
		border-radius: 8px;
	}
	#btn-share{
		text-decoration-line: none;
	}
	#btn-share:hover{
		color: white;
	}
	.btn-share> span{
		line-height: 4px;
		padding-left: 18px;
	}

	/* 구분선 */
	.text-line{
		border-top: 1.5px solid rgb(161, 161, 161);
		width: 920px;
		margin: auto;
		margin-top: -10px;
	}

	/* 식당상세정보 전체 클래스 스타일 */
	.rest-detail{
		height: auto;
		width: 1000px;
		margin: auto;
		padding-top: 20px;
		color: rgb(87, 87, 87);

	}
	.list{
		padding: 40px 80px;
	}

	/* 상세정보 각 행 스타일 */
	.list>div{
		background-size: 25px;
		padding-left: 35px;
		box-sizing: border-box;
		font-size: 18px;
		margin-bottom: 15px;a
	}
	.list-add-1, .list-tel-1, .list-time-1, .list-park-1{
		float: left;
		font-weight: 700;
	}
	.list-add>span, .list-park>span{
		padding-left: 60px;
	}
	.list-tel>span{
		padding-left: 43px;
	}
	.list-time>span{
		padding-left: 25px;
	}
	.list-menu-name-title{
		font-weight: 700;
	}

	/* 상세정보 각 행 이미지 */
	.list-add{
		background: url(https://s3-ap-northeast-1.amazonaws.com/dcicons/new/images/web/profile/profile-location@2x.png) no-repeat top left;
	}
	.list-tel{
		background: url(https://img.icons8.com/ios-filled/100/737373/phone.png) no-repeat left;
		background-position: 0px 3px;
		/* background: url(https://s3-ap-northeast-1.amazonaws.com/dcicons/new/images/web/profile/profile-pnum@2x.png)
   		 no-repeat left; */
	}	
	.list-time{
		background: url(https://img.icons8.com/ios/50/737373/time--v1.png) no-repeat left;
		/* background: url(http://localhost:8085/mm/detail.rs) no-repeat left;		 */
	}	
	.list-park{
		background: url(https://img.icons8.com/external-regular-kawalan-studio/96/737373/external-parking-location-map-regular-kawalan-studio.png) no-repeat left;
	}
	.list-menu{
		background: url(https://img.icons8.com/ios-filled/100/737373/restaurant--v1.png) no-repeat top left;
		height: auto;
		
	}
	
	
	/* 메뉴 스타일 */
	.menu-item{
		margin: 2px;
	}

	/* 메뉴 구분선 */
	.list-menu-detail>ul>div>li{
		list-style: none;
		border-bottom: dashed 0.8px gray; 
		padding-top: 5px;
	}

	/* 메뉴 추천 버튼 스타일*/
	.icon {
		line-height: 26px;
		border: 2px solid rgb(243, 156, 18);
		background-color: rgb(243, 156, 18);
		border-radius: 10px;
		color: aliceblue;
		font-size: 13px;
		font-weight: 600;
		padding: 2px 11px;
		margin-left: 8px;
		vertical-align: top;
		}
	
	.menu-price{
		float: right
	}

	/* 더보기 버튼 스타일*/
	.btn-more{
		margin-right: 20px;
		font-size: 15px;
		cursor: pointer;
	}
	.r{
		text-align: right; 
		position: relative;
		right: -3px;
		background: url(https://s3-ap-northeast-1.amazonaws.com/dcicons/new/images/web/common/list-more-down@2x.png) no-repeat right;
    	background-size: 20px;
	}

	/* 더보기 버튼 클릭시 나오는 메뉴*/
	.list-menu-2{
		display: none;
	}

	/* 페이지 전체 선 스타일 */
	.rest-all{
		height: auto;
		width: 1100px;
		margin: auto;
		border-radius: 20px;
		border: 3px solid rgb(216, 212, 212);
	}

	/* 리뷰 전체 스타일 */
	.review{
		width: 900px;
		margin: auto;
		margin-top: -20px;
	}

	/* 리뷰 제목 부분 스타일 */
	.review-title{
		font-size: 28px;
		font-weight: 600;
		color: #e4910d;
		display: inline-block;
	}

	/* 리뷰 작성 스타일 */
	.btn-review-area{
		float: right;
		display: inline-block;
		padding-right: 10px;	
	}
	#btn-review{
		background-color: rgb(243, 156, 18);
		border: none;
		font-size: 18px;
		height: 35px;
		width: 100px;
		line-height: 1.5;
		margin-top: 6px;
		text-align: center;
	}

	/* 리뷰 평점 스타일 */
	.score-area{
		height: 150px;
	}
	.score-area>div{
		height: 100%;
		float: left;
	}

	/* 별점 이미지 스타일 */
	.score-img{
		width: 30%;
	}

	/* 별점 그래프 스타일 */
	.score-graph{
		width: 70%;
	}

	/* 별점평균 제목 스타일 */
	.avg-title{
		background-color: rgb(235, 235, 235);
		border: 3px solid rgb(235, 235, 235);
		border-radius: 30px;
		width: 120px;
		text-align: center;
		font-weight: 600;
		margin: auto;
		margin-top: 15px;
	}
	/* 별점평균 별 스타일 */
	.star {
		display: inline-block;
		width: 100px;
		height: 20px;
		background: url(https://s3-ap-northeast-1.amazonaws.com/dcicons/new/images/web/common/rating-off@2x.png) repeat-x left;
		background-size: 20px;
		margin-top: 10px;
		margin-left: 80px;
	}
	/* 별점 빈 별 스타일*/
	.star i{
		display: inline-block;
		width: 100px;
		height: 20px;
		background: url(https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/mobile/common_react/review__newstar__img.png) repeat-x left;
   		background-size: 20px;
	}
	/* 별점 평균 숫자 */
	.avg-num{
		font-size: 20px;
		font-weight: 600;
		text-align: center;
	}
	/* 세부 별점 스타일*/
	.star-detail>ul>li{
		list-style: none;
		display: flex;
		display: inline-block;
		font-size: 13px;
	}
	.star-detail{
		padding-right: 5px;
	}
	/* 식당 별점 채워진 스타일 */
	.star-s{
		display: inline-block;
		width: 12px;
		height: 12px;
		background: url(https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/mobile/common_react/review__newstar__img.png) no-repeat left;
		background-size: 12px;
		margin: 0px 4px -2px 2px;
	}
	#flv-star, #pri-star{
		margin-right: 8px;
	}
	/* 식당 별점 그래프 스타일 */
	.graph-aria>li{
		list-style: none;
    	display: flex;
    	flex-direction: row;
		align-content: center;
		justify-content: flex-end;
		align-items: baseline;
		margin-right: 80px;
		height: 30px;
	}
	.graph{
		width: 340px;
		height: 10px;
		vertical-align: middle;
		background: #e6e6eb;
		border-radius: 50px;
	}
	/* 식당 리뷰 채워진 그래프 */
	.graph span{
		height: 10px;
    	display: block;
		border-radius: 50px;
		background: rgb(243, 156, 18);
		
	}
	/* 식당 별점 그래프 카테고리*/
	.btxt{
		padding-right: 40px;
		padding-top: 2px;
	}

	/* 각 리뷰 전체 테두리 */
	.review-div{
		height: auto;
		width: 900px;
		margin: auto;
		border-radius: 20px;
		border: 2px solid rgb(216, 212, 212);
		padding:30px 40px;
		margin-top: 10px; /* 각각의 리뷰 테두리사이 띄기*/
	}

	/* 리뷰 프로필 전체 */
	.profile>div{
		height: 60px;
		float: left;
		/* border: 1px solid red; */
	}

	/* 리뷰 프로필 사진 스타일 */
	#profile-img{
		width: 10%
	}
	#profile-img>img{
		width: 60px;
		height: 60px;
		margin: auto;
   		display: block;
	}
	/* 리뷰 내 이름 칸 스타일*/
	.profile-name{
		width:48%;
		padding-left: 10px;
		padding-top: 5px;
	}
	#writer{
		font-weight: 600;
		font-size: 20px;
	}

	/* 리뷰 내 별점 스타일 */
	#w-star{
		display: inline-block;
		width:90px;
		height: 18px;
		background: url(https://s3-ap-northeast-1.amazonaws.com/dcicons/new/images/web/common/rating-off@2x.png) repeat-x left;
		background-size: 18px;
		margin-top: 2px;
	}

	/* 별점 빈 별 스타일*/
	#w-star i{
		display: inline-block;
		width: 75px;
		height: 18px;
		background: url(https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/mobile/common_react/review__newstar__img.png) repeat-x left;
   		background-size: 18px;
		margin-bottom: 2px;
	}

	/* 리뷰 날짜 */
	#write-date{
		font-size: 15px;
		padding-left: 10px;
		line-height:1.8
	}
	.review-update{
		padding-top: 5px;
		margin-right: -2px;
	}
	.review-update>a{
		padding: 2px;
		color: gray;
		text-decoration-line: none;	
	}	
	.review-update>a:hover{
		color: #e4910d;
	}
	.warn{
		width: 42%;
		text-align: right;	
		padding: 4px 10px;	
	}
	#rv-warn{
		color: gray;
		text-decoration-line: none;
	}
	#rv-warn:hover{
		color: #e4910d;
	}
	.w-star-detail ul{
		display: flex;
		list-style: none;
		padding: 5px;
		margin-left: 8px;
	}
	.rv-star-s{
		display: inline-block;
		width:10px;
		height: 12px;
		background: url(https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/mobile/common_react/review__newstar__img.png) no-repeat left;
		background-size: 10px;
		margin-top: 4px;
   		margin-left: 3px;
    	margin-right: 3px;
	}
	#rv-flv-star, #rv-pri-star{
		margin-right: 10px;
	}
	.review-content{
		margin-top: -20px;
		margin-left: 20px;
	}
	#rv-content{
		white-space: pre-wrap; /*p태그 개행*/
	}
	.review-img {
    	overflow: hidden; /* 이미지가 부모 요소를 벗어나지 않도록 설정합니다. */
		margin-top: -10px;
	}

	.review-img > div {
		float: left; /* 이미지를 왼쪽으로 정렬합니다. */
		margin-right: 8px; /* 이미지 사이의 간격을 설정합니다. */
		padding-left: 50px;
	}

	.btn-share>span{
    	text-decoration: none; /* 텍스트 밑줄 제거 */
	}

	/* 이미지 팝업창 스타일 */
			
		#myImg {
		border-radius: 5px;
		cursor: pointer;
		transition: 0.3s;
		}

		#myImg:hover {opacity: 0.7;}

		/* The Modal (background) */
		.modal {
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 1; /* Sit on top */
		padding-top: 400px; /* Location of the box */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
		}

		/* Modal Content (image) */
		.modal-content {
		margin: auto;
		display: block;
		width: 80%;
		max-width: 700px;
		}

		/* Caption of Modal Image */
		#caption {
		margin: auto;
		display: block;
		width: 80%;
		max-width: 700px;
		text-align: center;
		color: #ccc;
		padding: 10px 0;
		height: 150px;
		}

		/* Add Animation */
		.modal-content, #caption {  
		-webkit-animation-name: zoom;
		-webkit-animation-duration: 0.6s;
		animation-name: zoom;
		animation-duration: 0.6s;
		}

		@-webkit-keyframes zoom {
		from {-webkit-transform:scale(0)} 
		to {-webkit-transform:scale(1)}
		}

		@keyframes zoom {
		from {transform:scale(0)} 
		to {transform:scale(1)}
		}

		/* The Close Button */
		.close {
		position: absolute;
		top: 15px;
		right: 35px;
		color: #f1f1f1;
		font-size: 40px;
		font-weight: bold;
		transition: 0.3s;
		}

		.close:hover,
		.close:focus {
		color: #bbb;
		text-decoration: none;
		cursor: pointer;
		}

		/* 100% Image Width on Smaller Screens */
		@media only screen and (max-width: 700px){
		.modal-content {
			width: 100%;
		}
		}
	.review-like{
		display: flex;
		margin-left: 50px;
		margin-top: 20px;
	}
	.review-like>div{
		margin-right: 10px;
	}
	.like-area{
		color: white;
		width: 90px;
		height: 30px;
		background: url(https://img.icons8.com/material-rounded/24/FFFFFF/thumb-up.png) no-repeat;
		background-size: 20px;
		padding-left: 15px;
		position: relative;
		background-color: #F39C12;
		padding-top: 4px;
		background-position: 6px 5px;
		border-radius: 8px;
	}
	.unlike-area{
		color: white;
		width: 105px;
		height: 30px;
		background: url(https://img.icons8.com/material-rounded/96/FFFFFF/thumbs-down.png) no-repeat;
		background-size: 20px;
		padding-left: 15px;
		position: relative;
		background-color: #F39C12;
		padding-top: 4px;
		background-position: 6px 5px;
		border-radius: 8px;
	}
	#like, #unlike{
		margin-left: 14px;
		font-size: 16px;
		cursor: pointer;
	}

	/* 공유하기 모달 스타일 */
		#kakao_btn, #normal_btn {
        font-size: 20px;
        font-weight: 600;
        color: gray;
        margin-left: 40px;
        padding-top: 9px;
    }
	/* 리뷰작성 모달 스타일 */
	.modal-content {
		text-align: center;
	}
	#reviewModal > .rv-enroll-btn{
		border-color:#F39C12;
	}
	/* 별 창*/
	.blind {
  position: absolute;
  overflow: hidden;
  margin: -1px;
  padding: 0;
  width: 1px;
  height: 1px;
  border: none;
  clip: rect(0, 0, 0, 0);
}
.review-write{
	font-size: large;
}







.startRadio {
  display: inline-block;
  overflow: hidden;
  height: 40px;
  &:after {
    content: "";
    display: block;
    position: relative;
    z-index: 10;
    height: 40px;
    background: url("data:image/png;base64,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")
      repeat-x 0 0;
    background-size: contain;
    pointer-events: none;
   }
   &__box {
    position: relative;
    z-index: 1;
    float: left;
    width: 20px;
    height: 40px;
    cursor: pointer;
    input {
      opacity: 0 !important;
      height: 0 !important;
      width: 0 !important;
      position: absolute !important;

      &:checked + .startRadio__img {
        background-color: #F39C12;
      }
    }
   }
   &__img {
    display: block;
    position: absolute;
    right: 0;
    width: 500px;
    height: 40px;
    pointer-events: none;
  }
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
		<br><br>

	<!-- 식당 전체 감싸는 틀-->
	<div class="rest-all">
		<br><br>

		<!-- 식당이름 -->
		<div class="rest-title">
			<div class="rest-name">
				<h1 style="display: contents;"><%= r.getRestName() %></h1> 
				<span class="score"><%= r.getRestAvg() %></span>
			</div>
				<span class="short-menu">간단 메뉴 소개</span>
			<div class="rest-add">
				<span class="short-add">서울시- <%= rAdd %> </span>
				<div class="heart-count-area">
					<img src="https://img.icons8.com/sf-black-filled/64/f39c12/like.png" width="25px" style="padding-bottom: 4px;" >
					<span>찜꽁(20)</span>
				</div>
				<div class="btn-share-area">
					<a href="#" class="btn-share" id="btn-share">
						<span>공유</span>
					</a>
				</div>
			</div>
		</div>
		<div class="text-line"></div>

		<!--공유하기 모달-->
		
		<div id="shareModal" class="modal">
            <div class="modal-content" id="share-modal" style="height: 200px; width: 500px; align-items: center;">
                <div class="modal-content-detail">
                    <span id="share-close-btn" class="close" style="color: gray;">&times;</span>
                    <div id="share-ctg" style="display: flex;">
                        <a href="" id="kakao" style="margin: auto; margin-top: 50px; margin-right:70px; cursor: pointer;" >
                            <div style="padding-left: 50px;">
                            <img src="https://img.icons8.com/external-tal-revivo-color-tal-revivo/96/external-free-instant-messaging-app-for-cross-platform-devices-logo-color-tal-revivo.png" width="80px" height="80px">
                            </div>
                            <div id="kakao_btn">
                                카카오톡 공유
                            </div>
                        </a>
                        <a href="" id="normal" style="margin: auto; margin-top: 40px; margin-right:95px">
                            <img src="https://img.icons8.com/sf-regular/192/FAB005/share.png" style="margin-left: 25px;" width="90px" height="90px">
                            <div id="normal_btn">
                                링크공유
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>

		<!-- 식당상세정보 -->

		<div class="rest-detail">
			<div class="list">
				<div type="hidden"><%= r.getRestNo() %></div>
			
				<div class="list-add">
					<div class="list-add-1">주소</div>
					<span><%= r.getRestAddress() %></span>
				</div>
				<div class="list-map">
					<%@ include file = "../map/restDetailMap.jsp" %>
				</div>
				<div class="list-tel">
					<div class="list-tel-1">연락처</div>
					<span><%= r.getRestTel() %></span>
				</div>
				<div class="list-time">
					<div class="list-time-1">영업시간</div>
					<span><%= r.getRestTime() %></span>
				</div>
				<div class="list-park">
					<div class="list-park-1">주차</div>
					<span><%= r.getRestParking() %></span>
				</div>
				<div class="list-menu">
						<div class="list-menu-name">
							<div class="list-menu-name-title">메뉴정보</div>
						
							<div class="list-menu-detail">
								<ul>
									<div class="menu-list-1">
										<li>
											<p class="menu-item">
												<span class="rest-menu"><%= r.getMenuName()%></span>
												<span class="icon">추천</span>
												<span class="menu-price"><%= r.getMenuPrice() %>원</span>
											</p>
									<!--  
										<li>
											<p class="menu-item">
												<span class="rest-menu">감자샌드위치</span>
												<span class="icon">추천</span>
												<span class="menu-price">3,900원</span>
											</p>
										</li>
										</li>
										<li>
											<p class="menu-item">
												<span class="rest-menu">치즈샌드위치</span>
												<span class="menu-price">3,900원</span>
											</p>
										</li>
									</div>
									<div class="list-menu-2">
										<li>
											<p class="menu-item">
												<span class="rest-menu">토마토샌드위치</span>
												<span class="menu-price">3,900원</span>
											</p>
										</li>
										<li>
											<p class="menu-item">
												<span class="rest-menu">베이컨샌드위치</span>
												<span class="icon">추천</span>
												<span class="menu-price">3,900원</span>
											</p>
										</li>
									</div>
									-->
									<!-- 버튼 클릭시 접기로 변경됨-->
									<p class="r">
										<span class="btn-more">더보기</span>
									</p>
								</ul>
							</div>
						</div>
				</div>
			</div>
			<br>
			
		<!-- 평균 리뷰 창 --->
			<div class="review">
				<div class="review title-area">
					<div class="review-title" id="like-count">13건의 맛민이들 리뷰
					</div>
					<div class="btn-review-area">
					<button type="button" id="btn-review" class="btn btn-sm btn-secondary" data-bs-toggle="modal" data-bs-target="#reviewModal">리뷰작성</button>
					</div>
				</div> 
				<br>
				<div class="text-line" style="margin-left:-10px"></div>
				<br>
				<div class="score-area">
					<div class="score-img">				
						<div class="avg-title">총 별점 평균</div>
							<span class="star">
								<i style="width: <%= star %>%;"></i>
							</span>
						<div class="avg-num"><%= r.getRestAvg() %></div>
						<div class="star-detail">
							<ul style="margin-left:6px">
								<li>맛
									<li class="star-s"></li>
									<li id="flv-star">5</li>
								</li>
								<li>가격
									<li class="star-s"></li>
									<li id="pri-star">4</li>
								</li>
								<li>서비스
									<li class="star-s"></li>
									<li id="ser-star">5</li>
								</li>
							</ul>
						</div>
					</div>
					<div class="score-graph">
						<ul class="graph-aria">
							<li>
								<p class="btxt">매우만족 (5)</p>
								<p class="graph">
									<span style="width:50%"></span>
								</p>
							</li>
							<li>
								<p class="btxt">만족 (10)</p>
								<p class="graph">
									<span style="width:37%"></span>
								</p>
							</li>
							<li>
								<p class="btxt">보통 (1)</p>
								<p class="graph">
									<span style="width:17%"></span>
								</p>
							</li>
							<li>
								<p class="btxt">불만 (1)</p>
								<p class="graph">
									<span style="width:17%"></span>
								</p>
							</li>
							<li>
								<p class="btxt">매우불만(0)</p>
								<p class="graph">
									<span style="width:0%"></span>
								</p>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<br>
	
		<!-- Modal -->
		<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="reviewModal" style="margin: auto; margin-top: 10px;">솔직한 리뷰를 작성해주세요!</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="">
						<div>
							<h2>맛은 어땠나요?</h2>
							<div class="startRadio">
								<label class="startRadio__box">
								  <input type="radio" name="star" id="">
								  <span class="startRadio__img"><span class="blind">별 1개</span></span>
								</label>
								<label class="startRadio__box">
								  <input type="radio" name="star" id="">
								  <span class="startRadio__img"><span class="blind">별 2개</span></span>
								</label>
								<label class="startRadio__box">
								  <input type="radio" name="star" id="">
								  <span class="startRadio__img"><span class="blind">별 3개</span></span>
								</label>
								<label class="startRadio__box">
								  <input type="radio" name="star" id="">
								  <span class="startRadio__img"><span class="blind">별 4개</span></span>
								</label>
								<label class="startRadio__box">
								  <input type="radio" name="star" id="">
								  <span class="startRadio__img"><span class="blind">별 5개</span></span>
								</label>
							  </div>
							<br>
							<h2>가격은 어땠나요?</h2>
							<div id="price-star"></div>
							<br>
							<h2>서비스는 어땠나요?</h2>
							<div id="service-star"></div>
							<br>
							<textarea id="review-write" cols="70" rows="10" style="resize: none; border: 1px solid gainsboro;" required placeholder="매장에 대한 리뷰를 남겨주세요! (필수)"></textarea>
							<div class="count-area" style="text-align: right;">
								<span id="count">0</span>/300
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style=" width: 100px; font-size: x-large;">취소</button>
				<button type="button" class="btn btn-primary btn-lg" style="background-color: #F39C12; border-color: #F39C12; width: 100px; font-size: x-large; ">등록</button>
				</div>
			</div>
			</div>
		</div>


		<!-- 세부적인 리뷰 창 -->
			<div class="review-detail" name="review-detail">
				
			</div>

	<br><br>
		<%@ include file="../common/footer.jsp" %>		

	<script>
	
		$(function(){
		    selectReviewList();
		})
	
		function selectReviewList(){
			$.ajax({
				url:"review.rs",
				data:{rpage:'<%= r.getRestNo()%>'},
				success:function(rvlist){
					let value = ''; // Initialize value variable
		            
		                console.log(rvlist);
				
		            for (let i = 0; i < rvlist.length; i++) {
		            	
		                let rv = rvlist[i]; // Fixed variable name

		                console.log(rv.ratePrice);
		                let rvname = rv.reviewWriter;
		                let rvdate = rv.reviewDate;
		                let rvtaste = rv.rateTaste;
		                let rvprice = rv.ratePrice;
		                let rvservice = rv.rateService;
		                let rvcont = rv.reviewCont;
		                let rvavg = rv.rateAge;
		                
		                value += `<div class="review-div">
							<div class="rv1">
								<div class="profile">
									<div id="profile-img">
										<img src="https://img.icons8.com/ios-filled/100/737373/user-male-circle.png">
									</div>
									<div class="profile-name">
										<div id="writer">\${rvname}</div>
										<div style="display: flex;">
											<div id="w-star">
												<i id="rvstar-avg"></i>
											</div>
											<span id="write-date">\${rvdate}</span>
										</div>
									</div>
									<div class="warn">
										<a href="#" id="rv-warn">신고</a>
										<div class="review-update">
											<a href="#" id="rv-update">수정</a>
											<a href="#" id="rv-delete">삭제</a>
										</div>
									</div>
								</div>
								<div class="w-star-detail">
									<ul>
										<li>맛
											<li class="rv-star-s"></li>
											<li id="rv-flv-star">\${rvtaste}</li>
										</li>
										<li>가격
											<li class="rv-star-s"></li>
											<li id="rv-pri-star">\${rvprice}</li>
										</li>
										<li>서비스
											<li class="rv-star-s"></li>
											<li id="rv-ser-star">\${rvservice}</li>
										</li>
									</ul>
								</div>
								<div class="review-content">
									<p name="rv-content" id="rv-content">
\${rvcont}
									</p>
								</div>
								
								<div class="review-like">
									<div class="like-area">
										<span id="like">추천 (15)</span>
									</div>
									<div class="unlike-area">
										<span id="unlike">비추천 (15)</span>
									</div>
								</div>
							</div>
						</div>
						<br>`

				$(".rvstar-avg").css("width", "\${rvavg}%");
				
				}
		            console.log(value);

				$(".review-detail").html(value);
				
				}, error:function(){
					console.log("ajax 통신실패")
				}

			});
		}
	
	</script>		
			
	<script>
		$(function(){
       		 $("#review-write").keyup(function(){ 
				let length = $(this).val().length;
				$("#count").text(length);
       		 })
       })
	</script>

			
	<script>
	 
			$(".btn-more").click(function(){
				// 현재 상태를 확인하여 숨김/보임을 토글합니다.
				if ($(".list-menu-2").is(":visible")) {
					$(".list-menu-2").hide(); // 보이는 상태라면 숨깁니다.
					$(".btn-more").text("더보기"); // 버튼 텍스트를 다시 '더보기'로 변경합니다.
					$(".r").css({'text-align': 'right' 
								,position: 'relative'
								,right: '-3px'
								,background: 'url(https://s3-ap-northeast-1.amazonaws.com/dcicons/new/images/web/common/list-more-down@2x.png) no-repeat right'
								,'background-size': '20px'});
				} else {
					$(".list-menu-2").show(); // 숨겨진 상태라면 보이게 합니다.
					$(".btn-more").text("접기"); // 버튼 텍스트를 '접기'로 변경합니다.
					$(".r").css({background:'url(https://s3-ap-northeast-1.amazonaws.com/dcicons/new/images/web/common/list-more-up@2x.png) no-repeat right'
								,position: 'relative'
								,right: '-3px'
								,'text-align': 'right'
								,'background-size': '20px'
								});
				}
			});
			
	</script>

		<!-- 공유 모달 -->
		<script>
			// Get the modal
			var modal = document.getElementById("shareModal");
	
			// Get the image and insert it inside the modal - use its "alt" text as a caption
			var btn = document.getElementById("btn-share");
			var sharemodal = document.getElementById("share-modal");
			var closeBtn = document.getElementById("share-close-btn");
			btn.onclick = function(){
			$("#map").css("display","none");	
			modal.style.display = "block";
			sharemodal.src = this.src;
			
			}
			// 공유모달닫기버튼

			// Get the <span> element that closes the modal
			var span = document.getElementsByClassName("close")[1];
	
			// When the user clicks on <span> (x), close the modal
			span.onclick = function() { 
			modal.style.display = "none";
			}
		</script>

		<script>
			$(function(){
				$("#share-close-btn").click(function(){
					$("#map").css("display","block");	
				})
		})
		</script>
			

	

</body>
</html>