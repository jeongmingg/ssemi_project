<%@page import="java.lang.management.MemoryNotificationInfo"%>
<%@page import="com.kh.heart.model.vo.Heart"%>
<%@page import="com.kh.board.model.vo.ImgFile"%>
<%@page import="com.kh.review.model.vo.Review"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.rest.model.vo.Rest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% Rest r = (Rest)request.getAttribute("r"); 

	ArrayList<Search> mapList = new ArrayList<Search>();
	if(r != null && r.getRestAddress() != null && r.getRestName() != null) {
		Search s = new Search();
		
		s.setRestAddress(r.getRestAddress());
		s.setRestName(r.getRestName());
		
		mapList.add(s);
	}
	request.setAttribute("mapList", mapList);
	
   ArrayList<Review> rv = (ArrayList<Review>)request.getAttribute("rvList");
   ArrayList<Review> ra = ( ArrayList<Review>)request.getAttribute("rate");
   Review rvAvg = (Review)request.getAttribute("rv");
   ArrayList<Rest> mList = (ArrayList<Rest>)request.getAttribute("mList");
   ArrayList<Heart> hList = (ArrayList<Heart>)request.getAttribute("hList");
   
   /* 별점 채우기위한 퍼센트 변수 */
   double score = (double)rvAvg.getReviewAvg();
   double maxScore = 5.0;
   double percent = (score/maxScore) * 100;
	// 소수점 한 자리까지 반올림하여 문자열로 변환(css 속성으로 받으려면 문자열만가능)
   String star = String.format("%.1f", percent);

%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/examples/media/expand_style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>

<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

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

	.rest-img{
		height: 450px;
	}

	/* 식당 제목 스타일 */
	.rest-title{
		height: 600px;
		margin: auto;
		width: 900px;
	}

	.rest-main-img{
		width: 100%;
		height: 100%;
		margin: auto;
		position: static;
		background-size: cover;
    	background-position: center;
		border-radius: 8px;
	}

	.rest-s-title{
		margin: -64px auto 0;
		padding-bottom: 4px;
		width: 850px;
		z-index: 10;
		background-color: white;
		border-radius: 10px;
		border: solid 1px rgba(255, 253, 253, 0.76);
		box-shadow: 0px 0px 4px 0px rgba(0, 0, 0, 0.4);
	}

	.rest-s-title .rest-s-detail{
		min-height: 187px;
		padding: 28px;
	}
	.rest-s-detail .rest-name{
		text-align: center;
	}
	.rest-s-detail .short-menu{
		text-align: center;
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
		text-align: center;
		justify-content: flex-start;
		flex-direction: column;
		margin-bottom: 3px
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
		padding-left: 300px;
		padding-top: 5px;
		font-weight: 700px;
		color: rgb(88, 88, 88);
	}

	/* 공유버튼 스타일 */

	.btn-share-area{
		padding-left: 30px;
		display: flex;
		padding-top: 4px;
		display: inline-flex;
	}
	.btn-share{
		text-decoration-line: none;
		color: white;
		width: 80px;
		height: 30px;
		background: url(https://img.icons8.com/fluency-systems-filled/48/FFFFFF/share-3.png) no-repeat;
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
	/* .text-line{
		border-top: 1.5px solid rgb(161, 161, 161);
		width: 920px;
		margin: auto;
		margin-top: -10px;
	} */

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
		margin-bottom: 15px;
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
	
	.text-line {
		border-top: 1.5px solid rgb(161, 161, 161);
		width: 920px;
		margin: auto;
		margin-top: -10px;
	}
	/* 메뉴 스타일 */
	.menu-item{
		margin: 2px;
	}

	/* 메뉴 구분선 */
	.list-menu-detail>ul>div>li{
		list-style: none;
		border-bottom: dashed 0.8px gray; 
		padding : 5px;
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
		padding-bottom: 30px;
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
		height: 120px;
	}
	.score-area>div{
		height: 100%;
		float: left;
	}

	/* 별점 이미지 스타일 */
	.score-img{
		width: 30%;
		padding-top: 10PX;
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
	.score-area{
		padding-left: 50px ;
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
	.profile-img{
		width: 10%
	}
	.profile-img>img{
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
	.writer{
		font-weight: 600;
		font-size: 20px;
	}

	/* 리뷰 내 별점 스타일 */
	.w-star{
		display: inline-block;
		width:20px;
		height: 18px;
		background: url(https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/mobile/common_react/review__newstar__img.png) repeat-x left;
		background-size: 18px;
		margin-top: 2px;
	}

	/* 별점 빈 별 스타일*/
	.w-star i{
		display: inline-block;
		width: 20x;
		height: 18px;
		background: url(https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/mobile/common_react/review__newstar__img.png) repeat-x left;
   		background-size: 18px;
		margin-bottom: 2px;
	}

	/* 리뷰 날짜 */
	.write-date{
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
	.warn a{
		color: gray;
		text-decoration-line: none;
	}
	.warn a:hover{
		color: #e4910d;
		text-decoration-line: none;
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
	.rv-flv-star, .rv-pri-star{
		margin-right: 10px;
	}
	.rv1{
		padding-top: 3px;
	}
	.review-content{
		margin-top: -20px;
		margin-left: 20px;
	}
	.rv-content{
		white-space: pre-wrap; /*p태그 개행*/
		padding-top: 40px;
		font-size: large;
		padding-left: 15px;
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

	.review-like{
		display: flex;
		margin-left: 10px;
		margin-top: 5px;
		justify-content: flex-end;
		align-content: stretch;
		flex-direction: row;
	}
	.review-like>div{
		margin-right: 10px;
	}
	.like-area a {
		text-decoration: none;
	}
	.like-area .like{
		color: #F39C12;
		width: 100px;
		height: 35px;
		background: url(https://img.icons8.com/fluency-systems-regular/48/f39c12/facebook-like--v1.png) no-repeat;
		background-size: 20px;
		padding-left: 38px;
		position: relative;
		padding-top: 7px;
		background-position: 12px 6px;
		border-radius: 30px;
		border: 1px solid rgb(221 221 221);
	}
	.unlike-area{
		color: #F39C12;
		width: 110px;
		height: 35px;
		background: url(https://img.icons8.com/material-rounded/96/FFFFFF/thumbs-down.png) no-repeat;
		background-size: 20px;
		padding-left: 15px;
		position: relative;
		padding-top: 5px;
		background-position: 8px 5.5px;
		border: 1px solid rgb(221 221 221);
		border-radius: 15px;
	}
	.like, .unlike{
		margin-left: 16px;
		font-size: 16px;
		cursor: pointer;
	}

	.like span{
		font-size: 16px;
	}

	/* 공유하기 모달 스타일 */
		#kakao_btn, #normal_btn {
        font-size: 20px;
        font-weight: 600;
        color: gray;
        margin-left: 40px;
        padding-top: 9px;
    }

	#shareModal {
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
	.modal-title{
		margin-right: 150px;
	}

	#share-ctg{
		display: flex;
		margin-top: 25px;
    	margin-left: 10px;
	}
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

	#share-ctg > a{
		text-decoration: none;
	}
	/* 리뷰작성 모달 스타일 */
	.modal-content {
		text-align: center;
	}
	#reviewModal > .rv-enroll-btn{
		border-color:#F39C12;
	}
	#reviewModal .modal-content{
		margin-top: 300px
	}
	
	.review-write{
		font-size: large;
	}

    /* 리뷰작성시 모달 별창 */
	input[type="radio"] {
		appearance: none;
		border: none;
		-webkit-appearance: none; /* Safari 및 Chrome 지원 */
		-moz-appearance: none; /* Firefox 지원 */
      }

	.img-area{
		display: block;
		border: 1px dashed  #c5c5c5;
		height: 60px;
	}
	.file_name{
		line-height: 60px;
	}
	
    .rating {
    position: relative;
    width: 180px;
    background: transparent;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: .6em;
    padding-left: 5px;
    margin: auto;
    width: 300px;
	border: none;
    }

    .rating__result {
    position: absolute;
    top: 0;
    left: 0;
    transform: translateY(-10px) translateX(-5px);
    z-index: -9;
    font: 3em Arial, Helvetica, sans-serif;
    pointer-events: none;
	border: none;
    }

    .rating__star {
    font-size:xx-large;
    cursor: pointer;
    color: #ff9900d8;
    transition: filter linear .3s;
	border: none;
    }

    .rating__star:hover {
    filter: drop-shadow(1px 1px 4px #ff9900d8);
	border: none;
    }
	.modal-body .box{
		margin-left: 105px;
	}

	.share-title{
		margin-top: 30px;
	}	

	.like-area .rvhover {
		visibility: hidden;
		width: 180px;
		height: 47px;
		background-color: #3c3c3c99;
		border-radius : 10px;
		padding: 0;
		color: white;
		text-align: center;
		position :absolute;
		z-index: 1;
		bottom: 180%;
		left: 50%;
		margin-left: -90px;
		margin-bottom: -10px;
	}
	.like-area .rvhover::after {
		content: " ";
		position: absolute;
		top: 100%;
		left: 50%;
		margin-left: -10px;
		border-width: 10px;
		border-style: solid;
		border-color: #3c3c3c99 transparent transparent transparent;
	}
	.like-area:hover .rvhover { visibility: visible; }

	.rest-name>a{
		float: right;
		background-color: #e4910d;
		color: white;
	}

</style>

<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>
	<br>
<!-- 
	<div class="outer">
		<div class="slide-area">
			<div class="btn-left"></div>
			<div class="img-slide"></div>
			<div class="btn-right"></div>
		</div>
		-->
		<br><br><br><br> 

	<!-- 식당 전체 감싸는 틀-->
	<div class="rest-all">
	<br><br><br>

		<!-- 식당이름 -->
		<div class="rest-title">
			<div class="rest-img">
				<div class="rest-main-img" style="background-image:url('<%= r.getRestImgUrl() %>');"></div>
			</div>
			<div class="rest-s-title">
				<div class="rest-s-detail">
					<div class="rest-name">
						<h1 style="display: contents;"><%= r.getRestName() %></h1> 
						<span class="score"><%= rvAvg.getReviewAvg() %></span>
						<%if (loginUser != null && loginUser.getMemNo().equals("M1")) {%>
							<a href="<%= contextPath %>/updateForm.rs?num=<%= r.getRestNo() %>" class="btn btn-sm">수정</a>
						<%}%>
					</div>
						<span class="short-menu"><%= r.getCtgName() %></span>				
					<div class="rest-add">
						<span class="short-add">서울시- <%= r.getLocalName() %> </span>
					</div>
				
					<div class="add-area">
						<div class="heart-count-area">
						<% 
							boolean heartFlag = false;
							String memNo = "";
							
							if(loginUser != null) {
								memNo = loginUser.getMemNo();
							}
						
							for(Heart h : hList) {
								if(!hList.isEmpty() && loginUser != null && h.getMemNo().equals(loginUser.getMemNo())) {
									heartFlag = true;
									break;
								}
							}
						%>
						<% if(!heartFlag) { %>
							<!-- 빈하트 -->
							<img src="https://img.icons8.com/ios/50/e4910d/hearts--v1.png" width="25px" style="padding-bottom: 4px; cursor: pointer;" onclick="insertHeart('<%= memNo %>', '<%= r.getRestNo() %>');"> 
						<% } else { %>
							<!-- 채워진 하트-->
							<img src="https://img.icons8.com/sf-black-filled/64/f39c12/like.png" width="25px" style="padding-bottom: 4px; cursor: pointer;" onclick="cancelHeart('<%= memNo %>', '<%= r.getRestNo() %>');"> 
						<% } %>
							<span>찜꽁(<%= hList.size() %>)</span>
						</div>
						<div class="btn-share-area">
							<a href="#" class="btn-share" id="btn-share">
								<span>공유</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--공유하기 모달-->
		
		<div id="shareModal" class="modal">
            <div class="modal-content" id="share-modal" style="height: 250px; width: 500px; align-items: center;">
                <div class="modal-content-detail">
                    <span id="share-close-btn" class="close" style="color: gray;">&times;</span>
				</div>
				<div class="share-title">
				<h4>공유하기</h4>
				</div>
                    <div id="share-ctg">
                        <a id="kakaotalk-sharing-btn" href="javascript:shareMessage()" class="kakao" style="margin: auto; margin-right:70px; cursor: pointer;" >
                            <img src="https://developers.kakao.com/assets/img/about/logos/kakaotalksharing/kakaotalk_sharing_btn_medium.png" style="padding-left: 43px;">
                            <div id="kakao_btn">
                                카카오톡
                            </div>
                        </a>
                        <a href="#" class="normal" style="margin: auto; margin-right:60px">
                            <img src="https://img.icons8.com/external-bearicons-glyph-bearicons/64/737373/external-Link-essential-collection-bearicons-glyph-bearicons.png" style="margin-left: 40px;" width="70px" height="70px">
                            <div id="normal_btn">
                                링크
                            </div>
                        </a>
                    </div>
            </div>
        </div>

		<!-- 식당상세정보 -->

		<div class="rest-detail">
			<div class="list">
				<input type="hidden" value="<%= r.getRestNo() %>">
			
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
					<% if(r.getRestTime()== null) { %>
					<span>정보없음</span>
					<% }else { %>
					<span><%= r.getRestTime() %></span>
					<% } %>
				</div>
				<div class="list-park">
					<div class="list-park-1">주차</div>
					
					<% if(r.getRestParking() == null) { %>
					<span>정보없음</span>
					<% }else { %>
					<span><%= r.getRestParking() %></span>
					<% } %>
				</div>
				<div class="list-menu">
						<div class="list-menu-name">
							<div class="list-menu-name-title">메뉴정보</div>
						
							<div class="list-menu-detail">
								<ul>
									<div class="menu-list-1">
									<% 
									    for (int i = 0; i < Math.min(mList.size(), 3); i++) { //최대 3개까지 보이게
									%>
										<li>
											<p class="menu-item">
												<span class="rest-menu"><%= mList.get(i).getMenuName() %></span>
												<% if(mList.get(i).getRepMenu().equals("Y")) { %>
													<span class="icon">추천</span>
												<% } %>
												<span class="menu-price"><%= mList.get(i).getMenuPrice() %>원</span>
											</p>
										</li>
									<% } %>
									
									</div>

									<div class="list-menu-2">
									
									<% if(mList.size() > 3){ %>
									
										<% for(int i=3; i<mList.size(); i++){ %>
											<li>
												<p class="menu-item">
													<span class="rest-menu"><%= mList.get(i).getMenuName() %></span>
													
													<!-- 대표메뉴에만 추천 보이게 -->
													<% if(mList.get(i).getRepMenu().equals("Y")) { %>
														<span class="icon">추천</span>
													<% } %>
													<span class="menu-price"><%= mList.get(i).getMenuPrice() %>원</span>
												</p>
											</li>
										<% } %>
									<% } %>
									</div>
									<!-- 버튼 클릭시 접기로 변경됨-->
									
									<% if(mList.size() > 3){ %>
										<p class="r">
											<span class="btn-more">더보기</span>
										</p>
									<% } %>
								</ul>
							</div>
						</div>
				</div>
			</div>
			<br>
			
		<!-- 평균 리뷰 창 --->
			<div class="review">
				<div class="review title-area">
					<div class="review-title" id="like-count"><%= r.getReviewCount() %>건의 맛민이들 리뷰
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
							<div class="avg-num"><%= rvAvg.getReviewAvg() %></div>
						
					</div>
					<div class="score-graph">
						<ul class="graph-aria">
						 <% 
							// 각 평점에 대한 리뷰 있는지 확인
						    boolean hasReview;

						 	// 각 가능한 리뷰 평가에 대해 5-1까지 반복
						    for (int rate = 5; rate >= 1; rate--) {
								// 각 리뷰평가가 없는 상태를 초기화 (외부루프)
						        hasReview = false;

								// for문 반복하면서 리뷰평가가 있는 목록(ra를 찾음) (내부루프)
						        for (Review s : ra) {

									// 해당점수에 값이 있을시 목록 ra가 있다고 판단
						            if (s.getReviewRate() == rate) {
						                hasReview = true; 
						    %>
						        <li>
						             <!-- 해당 리뷰 평가에 따라 텍스트와 폭을 표시합니다. -->
						            <p class="btxt">
						                <!-- 다른 평가에 대한 switch 문을 사용합니다. -->

						                <% switch (rate) {
						                    case 5: %>
						                        매우만족 (<%= s.getReviewCount() %>)
						                        <% break;
						                    case 4: %>
						                        만족 (<%= s.getReviewCount() %>)
						                        <% break;
						                    case 3: %>
						                        보통 (<%= s.getReviewCount() %>)
						                        <% break;
						                    case 2: %>
						                        불만 (<%= s.getReviewCount() %>)
						                        <% break;
						                    case 1: %>
						                        매우불만 (<%= s.getReviewCount() %>)
						                        <% break;
						                    default:
						                    	 // 필요한 경우 기본 케이스를 처리합니다
						                        break;
						                } %>
						            </p>
						            <%-- 리뷰 개수에 따라 폭을 동적으로 계산합니다. --%>
						            <p class="graph">
						                 <span style="width: <%= (hasReview ? (double)s.getReviewCount() / r.getReviewCount() * 100 : 0) + "%" %>"></span>
						            </p>
						        </li>
						    <% 
						            }
						        } // 리뷰 객체 검색을 위한 내부 반복문 종료
						        if (!hasReview || ra.isEmpty()) {
						    %>
						        <li>
						           <%-- 리뷰 객체가 없을때는 0을 표시하는 반복문 --%>
						            <p class="btxt">
						                 <%-- 다른 평가에 대한 switch 문을 사용합니다. --%>
						                <% switch (rate) {
						                    case 5: %>
						                        매우만족 (0)
						                        <% break;
						                    case 4: %>
						                        만족 (0)
						                        <% break;
						                    case 3: %>
						                        보통 (0)
						                        <% break;
						                    case 2: %>
						                        불만 (0)
						                        <% break;
						                    case 1: %>
						                        매우불만 (0)
						                        <% break;
						                    default:
						                    	// 필요한 경우 기본 케이스를 처리합니다.
						                        break;
						                } %>
						            </p>
						              <%-- 빈 그래프 막대를 표시합니다. --%>
						            <p class="graph">
						                <span style="width: 0%"></span>
						            </p>
						        </li>
						    <% } // 리뷰 객체가 없는 경우에 대한 if 문 종료 %>   
						    <% } // 리뷰 평가를 위한 외부 반복문 종료 %>
						</ul>
					</div>
					</div>
				</div>
			
			<br>
	
		<!-- 리뷰 별점 Modal -->
		<% if(loginUser != null){ %>
			<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="reviewModal" style="margin: auto; margin-top: 10px;">솔직한 리뷰를 작성해주세요!</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<br>
						<form class="review_form" id="reviewform" action="<%= contextPath %>/insert.rv">
						<div class="modal-body">
								<div>
									<h2>별점을 남겨주세요!</h2>
									<br>
									<input type="hidden" name="restNo" value="<%= r.getRestNo() %>">
									<input type="hidden" name="userNo" value="<%= loginUser.getMemNo() %>">

									<div class="rating">
										<span class="rating__result"></span> 
										<input class="rating__star far fa-star" type="radio" id="rating5" name="rating" value="1" required><label for="rating5"></label>
										<input class="rating__star far fa-star" type="radio" id="rating4" name="rating" value="2"><label for="rating4"></label>
										<input class="rating__star far fa-star" type="radio" id="rating3" name="rating" value="3"><label for="rating3"></label>
										<input class="rating__star far fa-star" type="radio" id="rating2" name="rating" value="4"><label for="rating2"></label>
										<input class="rating__star far fa-star" type="radio" id="rating1" name="rating" value="5"><label for="rating1"></label>
										<input type="hidden" id="hidden-input-stars" value="">
									</div>
                            <br><br>
							<textarea name="reviewWrite" id="review-write" cols="70" rows="10" style="resize: none; border: 1px solid gainsboro;" required placeholder="매장에 대한 리뷰를 남겨주세요! (필수)" maxlength="200"></textarea>
							<div class="count-area" style="text-align: right;">
								<span id="count">0</span>/200
							</div>
							<br>
							<label class="img-area">
								<input type="file" id="file" name="file" class="imgFile" multiple style="display: none;">
								<span class="file_name">📷사진을 첨부해주세요</span>
								
							</label>
						</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style=" width: 100px; font-size: x-large;">취소</button>
							<button type="submit" id="review-sub" class="btn btn-primary btn-lg" style="background-color: #F39C12; border-color: #F39C12; width: 100px; font-size: x-large; ">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<% } %>

		<!-- 세부적인 리뷰 창 -->
			<div class="review-detail" name="review-detail">
				
			</div>
	</div>
	</div>
	<br><br>


		<div id="topBtn">
		<a href="#"> <svg xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" width="45" height="45"
				viewBox="0 0 32 32" fill="rgb(230, 126, 34)"
				data-svg-content="true">
					<g>
						<path
					d="M 17,2C 8.716,2, 2,8.716, 2,17S 8.716,32, 17,32S 32,25.284, 32,17S 25.284,2, 17,2z M 23.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0L 18,11.414L 18,27 C 18,27.552, 17.552,28, 17,28S 16,27.552, 16,27L 16,11.414 L 11.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0c-0.39-0.39-0.39-1.024,0-1.414l 6-6C 16.296,8.29, 16.298,8.29, 16.3,8.288 c 0.090-0.088, 0.198-0.162, 0.316-0.21c 0.244-0.102, 0.52-0.102, 0.764,0C 17.504,8.128, 17.614,8.2, 17.708,8.292l 6,6 C 24.098,14.684, 24.098,15.316, 23.708,15.708z"></path>
					</g>
					</svg>
		</a>
		</div>
		

		<%@ include file="../common/footer.jsp" %>		
		
		
		<!--  카카오톡 공유하기 -->
		<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
		  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
		
		<script>
		  Kakao.init("e902a8343d65c936edeecf8659c80312"); // 사용하려는 앱의 JavaScript 키 입력
		 			 
		</script>
		
		<script>
		  function shareMessage() {
			  
		    Kakao.Share.sendDefault({
		      objectType: 'feed',
		      content: {
		        title: '<%= r.getRestName() %>',
		        description: '#<%= r.getCtgName() %> #대표메뉴 #<%= r.getLocalName() %> #서울맛집 #맛집의민족',
		        imageUrl:
		          '<%= r.getRestImgUrl() %>',
		        link: {
		          // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
		          webUrl: '',
		        },
		      },
		      buttons: [
		        {
		          title: '웹으로 보기',
		          link: {
		            webUrl: window.location.href, // 현재주소 불러오기
		          },
		        },
		      ],
		    });
		  }
		</script>


		<!-- 현재 url 링크 복사 -->
		<script>
			$(".normal").click(function(){
				const url = window.location.href; // 현재 링크를 가져옴
				const textArea = document.createElement('textarea');
				textArea.value = url;
				document.body.appendChild(textArea);
				textArea.select();
				try {
					document.execCommand('copy');
					alert("식당의 링크가 클립보드에 복사되었습니다😊");
				} catch (err) {
					alert('클립보드 복사에 실패했습니다. 수동으로 복사해주세요.');
				}
				document.body.removeChild(textArea);
			});
						
				
				// 클립보드 복사해주는 메소드 (배포되는환경에선 사용못함 )
				// 클립보드에 복사가 완료되면 콜백함수 실행
				//window.navigator.clipboard.writeText(url).then(()=>{ 
				//	alert("식당의 링크가 클립보드에 복사되었습니다😊");
				//})
				

		</script>
	
	
		<!-- 리뷰 전체 조회 ajax -->
		
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

			            for (let i = 0; i < rvlist.length; i++) {
			            	
			                let rv = rvlist[i]; // Fixed variable name
	
							let rvno = rv.reviewNo;
			                let rvname = rv.reviewWriter;
			                let rvdate = rv.reviewDate;
			                let rvtaste = rv.rateTaste;
			                let rvprice = rv.ratePrice;
			                let rvservice = rv.rateService;
			                let rvcont = rv.reviewCont;
			                let rvrate = rv.reviewRate;
			                let rvlike = rv.reviewLike;
			                
			                value += `<div class="review-div">
								<div class="rv1">
									<div class="profile">
										<div class="profile-img">
											<img src="https://img.icons8.com/ios-filled/100/737373/user-male-circle.png">
										</div>
										<div class="profile-name">
											<div class="writer">\${rvname}</div>
											<div style="display: flex;">
												<div class="w-star">
													<i class="rvstar-avg"></i>
												</div>
												<span class="rvstar-avg-title">\${rvrate}</span>
												<span class="write-date">\${rvdate}</span>
											</div>
										</div>
										<div class="warn">
											<!--rvno를 가져오기위해서 hidden 으로 숨겨놓기 (모를때 text로 확인해보기)-->
			               					<input type ="hidden" class="reviewNo" value=\${rvno}>
			               				
			               				<!-- 로그인시에만 삭제버튼 보이게 1차 제어-->
			               				<% if (loginUser != null ) { %>
			               					<!-- 현재 로그인한 유저의 닉네임을 가져옴 -->
										    <input type="hidden" class="serverNickname" value="<%= loginUser.getNickname() %>">
										    <!-- 리뷰를 작성한 유저의 닉네임을 가져옴 -->
										    <input type="hidden" class="rvname" value=\${rvname}>
			                             	<a href="#" class="delete-review" id="rv-delete" onclick="deleteReview(this);">삭제</a>
			                  			<% } %>
											<div class="review-update">
											</div>
										</div>
									</div>
									<div class="review-content">
									<br><br>
										<p name="rv-content" class="rv-content" maxlength="182">
	\${rvcont}
										</p>
									</div>
									
									<div class="review-like">
										<div class="like-area">
											<div class="like"  data-rvno="\${rvno}" data-rvname="\${rvname}">추천 
												<span class="likeCount">(\${rvlike})</span>
												<div class="rvhover">
													<p style="line-height:50px; margin : auto;">리뷰가 도움이 되었나요?</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<br>`
			            }
						
			        // 리뷰 div에 ajax로 넘어온 값 전체 넣어줌 
					$(".review-detail").html(value);
			        
					$(document).ready(function(){
						selectLike();
					});

					
			      // 리뷰 좋아요 조회 ajax
			
			      function selectLike(){ 	
			        $(".like").each(function() {
			                	
				        var ele = $(this);
				  	    var rvno = $(this).data("rvno");
				  	    var rvname = $(this).data("rvname");
				  	    var logname = $(this).closest(".rv1").find('.serverNickname').val();
				  	    
				  	   //console.log(rvno, logname);
					       $.ajax({
					       	url:"seLike.rv",
					       	data:{
					       		rvno:rvno,
					       		logname:logname},
					       	success:function(result){
			       				$(".like").each(function(){
				        			if(result !== null && rvno === result.reviewNo && logname === result.nickName) {
				                   		ele.attr("style", "background: url('https://img.icons8.com/fluency-systems-filled/48/FFFFFF/facebook-like.png') no-repeat; background-size: 20px; background-position: 12px 6px; background-color:#f5a424; color:white; border solid 0px");
				        			}
			                	 });  
					       	},
					       	error:function(){
					       		console.log("ajax 통신실패")
					       	}
							});
					  });
			       }
			       
					
			     // 리뷰 삭제버튼 작성자에게만 보이게 제어
			       
				 $(".delete-review").each(function() { // .delete-review안의 함수를 계속 돌려줌
					    
					 	// 리뷰작성자 닉네임을 변수에 담음
					 	var rvname = $(this).siblings('.rvname').val();
				
					 	// 현재 로그인한 유저의 닉네임을 변수에 담음
					    var serverNickname = $(this).siblings('.serverNickname').val()
					    
					    if (serverNickname === rvname) {
					        $(this).show(); // 같으면 삭제버튼 보여짐
							
					    } else {
					    	$(this).hide(); // 다르면 삭제버튼 안보여짐
							
					    }
					});
					    
						
				}, error:function(){
					console.log("ajax 통신실패")
				}
					
				});

				
				// 리뷰 추천 로그인시에만 가능하게 제어
				
				$(".review-detail").on("click", ".like", function(){

					var ele = $(this);
					var rvlno = $(this).data("rvno");
					var rvlname = $(this).data("rvname");
					var logname = $(this).closest('.rv1').find('.serverNickname').val();

					//console.log(ele);
					// console.log(rvlno);
					// console.log(rvlname);
					// console.log(logname);

					if(<%= loginUser == null %>){
						alert("로그인후 이용해주세요😀");
						return;
					}else if (logname === rvlname){
						alert("📌 본인에겐 추천 할 수 없습니다");
						return;
					}else {
						$(document).ready(function(){
							checkLike(ele, rvlno, rvlname, logname); 
						});
					}
 
				});
			}

			// 리뷰 추천 인서트 및 삭제 
			function checkLike(ele, rvlno, rvlname, logname){
				//console.log(rvlno);
				//console.log(rvlname);
				//console.log(logname);
				
					$.ajax({
					url:"inLike.rv",
					data:{
						rvno:rvlno,
						rvname:rvlname,
						logname:logname
					},
					success:function(response){
						// console.log(response);					
						if ('result1' in response) {
							//console.log("인서트돼라!");
							//console.log(ele);

							$(ele).attr("style", "background: url('https://img.icons8.com/fluency-systems-filled/48/FFFFFF/facebook-like.png') no-repeat; background-size: 20px; background-position: 12px 6px; background-color:#f5a424; color:white; border solid 0px");	
							
						} else if('result2' in response){
							//console.log("삭제돼라!");
							//console.log(ele);
							$(ele).attr("style", "background: url('https://img.icons8.com/fluency-systems-regular/48/f39c12/facebook-like--v1.png') no-repeat; background-size: 20px; background-position: 12px 6px;");

						}
						countLike();
						
					},
					error:function(){
						console.log("ajax 실패");
					}
					
				});
				
			}
			
			// 리뷰 추천수 조회
			function countLike(){
				$(".like").each(function() {	
                    var ele = $(this);
		    	    var rvno = $(this).data("rvno");

				$.ajax({
					url:"coLike.rv",
					data:{rvno:rvno},
					success:function(count){
						//console.log("countLike : ajax성공");
						var likeCount = count.likeCount
						
							$(".like").each(function(){
								if(count.likeCount > 0 && count.reviewNo === rvno){
									var span = ele.find(".likeCount").text();
									
									//console.log("span : " + span)
									ele.find(".likeCount").text("(" + likeCount + ")");
								
								}else {
									ele.find(".likeCount").text("(" + 0 + ")");
								}
								});
					},

					error:function(){
						//console.log("ajax실패");
					}
					});
				});

			}

			/* 리뷰 삭제 ajax*/
			function deleteReview(ele){
				/*클릭된 this 객체 $(ele)의 형재태그인 input의 value에 값을 넣어놨음*/
				let rvNo = $(ele).siblings("input").val();		
				//console.log(rvNo);
				
				if (confirm("정말 삭제하시겠습니까? 😭")) {
					$.ajax({
						url:"delete.rv",
						type:"post",
						data: {no:rvNo},
						success:function(review){
							if(review != null){
								alert("성공적으로 삭제됐습니다! 😀");
								selectReviewList();
							}
							
						}, error:function(){
							console.log("삭제오류 ajax통신오류")
						}
					})
			
				} 
			}


		</script>	




		<!-- 리뷰 별 모달 스크립트 -->
		<script>
			const ratingStars = [...document.getElementsByClassName("rating__star")];
			const  ratingResult = document.querySelector(".rating__result");
			
			printRatingResult(ratingResult);
			
			function executeRating(stars, result) {
					const starClassActive = "rating__star fas fa-star"; // 비어있는별
					const starClassUnactive = "rating__star far fa-star"; // 색칠된별
					const starsLength = stars.length;
					let i;
					stars.map((star) => {
						star.onclick = () => {
							i = stars.indexOf(star); // 클릭된별의 인덱스
							
							if (star.className.indexOf(starClassUnactive) !== -1) {
								printRatingResult(result, i + 1); 
								for (i; i >= 0; --i) stars[i].className = starClassActive;
							} else {
								printRatingResult(result, i);
								for (i; i < starsLength; ++i) stars[i].className = starClassUnactive;
							}
						};
					});
				}
				
				function printRatingResult(result, num = 0) {
				}
				executeRating(ratingStars, ratingResult);
		</script>	

		<!-- 리뷰 별 클릭된 value값 -->
		<script>
			 function reviewstar(element) {
				 
	        // 별점을 선택한 값으로 업데이트
	        	var score = $(element).attr('value');
	
				$(element).siblings("input").val(score);  	     	
			 }

			 // 별점 선택안할시 폼 제출 안되게 제어
			 $(document).ready(function() {
				$('form').submit(function(event) {
					if ($('input[name="rating"]:checked').length === 0) {
						event.preventDefault(); // Prevent form submission if no rating is selected
					}
				});
			});

		</script>


		<!-- 리뷰 인서트시 로그인 유저만 사용하게 제어 -->

		<script>
			$(function() {				
				if("<%= loginUser %>" == "null"){
					$("#btn-review").click(function(){
						alert("📌 로그인 후 이용가능합니다!");    
						window.location.href = "<%= contextPath %>/loginForm.me";
					});
				} else {
					$("#review-sub").click(function() {
						$("#reviewform").submit();
					});
				}
			})
		</script>
	

		<!-- 리뷰 인서트시 리뷰작성시 글자수 제한 보여줌 -->
		<script>
			$(function(){
	       		 $("#review-write").keyup(function(){ 
					let length = $(this).val().length;
					$("#count").text(length);
	       		 })
			})


			$(function(){
				var text = $("#review-write").val();
				if(text.length>200){
					text = text.substring(0, 200);
					text.focus();
				}
			   })
		</script>


		<!-- 식당 메뉴창 더보기 -->		
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
				})
		</script>


		<!-- 공유 모달 -->
		<script>
			// Get the modal
			var shmodal = document.getElementById("shareModal");
	
			// Get the image and insert it inside the modal - use its "alt" text as a caption
			var btn = document.getElementById("btn-share");
			var sharemodal = document.getElementById("share-modal");
			var closeBtn = document.getElementById("share-close-btn");
			btn.onclick = function(){
			$("#map").css("display","none");	
			shmodal.style.display = "block";
			sharemodal.src = this.src;
			
			}
			// 공유모달닫기버튼
	
			// Get the <span> element that closes the modal
			var span = document.getElementsByClassName("close")[1];
	
			// When the user clicks on <span> (x), close the modal
			span.onclick = function() { 
			shmodal.style.display = "none";
			}
		</script>

		<script>
			$(function(){
				$("#share-close-btn").click(function(){
					$("#map").css("display","block");	
				})
		})
		</script>
		
		<script>
			function insertHeart(memNo, restNo) {
				if(<%= loginUser == null %>) {
					alert("로그인 후 이용 가능한 서비스입니다.");
					return;
				} else {
					$.ajax({
						url: "insertHeart.me",
						data: {
							memNo: memNo,
							restNo: restNo
						},
						success: function(result) {
							$(".heart-count-area>img").attr("src", "https://img.icons8.com/sf-black-filled/64/f39c12/like.png");
							$(".heart-count-area>img").attr("onclick", "cancelHeart('<%= memNo %>', '<%= r.getRestNo() %>');");
							$(".heart-count-area>span").text("찜꽁(" + result.length + ")");
						}
					});
				}
				
			}
			
			function cancelHeart(memNo, restNo) {
				$.ajax({
					url: "deleteHeartInRest.me",
					data: {
						memNo: memNo,
						restNo: restNo
					},
					success: function(result) {
						$(".heart-count-area>img").attr("src", "https://img.icons8.com/ios/50/e4910d/hearts--v1.png");
						$(".heart-count-area>img").attr("onclick", "insertHeart('<%= memNo %>', '<%= r.getRestNo() %>');");
						$(".heart-count-area>span").text("찜꽁(" + result.length + ")");
					}
				});
			}
		</script>
			

	

</body>
</html>