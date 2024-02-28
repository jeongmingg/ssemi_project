<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
		font-size: 25px;
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
		border: 1px solid red;
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
	.star {
		display: inline-block;
		width: 100px;
		height: 20px;
		background: url(https://s3-ap-northeast-1.amazonaws.com/dcicons/new/images/web/common/rating-off@2x.png) repeat-x left;
		background-size: 20px;
		margin-top: 10px;
		margin-left: 80px;
	}
	.star i{
		display: inline-block;
		width: 100px;
		height: 20px;
		background: url(https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/mobile/common_react/review__newstar__img.png) repeat-x left;
   		background-size: 20px;
	}
	.avg-num{
		font-size: 20px;
		font-weight: 600;
		text-align: center;
	}
	.star-detail>ul>li{
		list-style: none;
		display: flex;
		display: inline-block;
		font-size: 13px;
		padding-left: 2px;
	}
	.star-detail{
		padding-left: 10px;
	}
	.graph-aria>li{
		list-style: none;
    	display: flex;
    	flex-direction: row;
		align-content: center;
		justify-content: flex-end;
		align-items: baseline;
		margin-right: 100px;
		height: 30px;
	}
	.graph{
		width: 340px;
		height: 10px;
		vertical-align: middle;
		background: #e6e6eb;
		border-radius: 50px;
	}
	.graph span{
		height: 10px;
    	display: block;
		border-radius: 50px;
		background: rgb(243, 156, 18);
		
	}
	.btxt{
		padding-right: 40px;
		padding-top: 2px;
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
				<h1 style="display: contents;">홍루이젠</h1> 
				<span class="score">4.0</span>
			</div>
				<span class="short-menu">간단 메뉴 소개</span>
			<div class="rest-add">
				<span class="short-add">서울-강남 > 청남동</span>
				<div class="heart-count-area">
					<img src="https://img.icons8.com/sf-black-filled/64/f39c12/like.png" width="25px" style="padding-bottom: 4px;" >
					<span>찜꽁(20)</span>
				</div>
				<div class="btn-share-area">
					<a href="" class="btn-share">
						<div style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.3em; border-radius: 4px; background-color: rgb(243, 156, 18); padding-right: 8px;">
							<svg xmlns="http://www.w3.org/2000/svg" width="40" height="25" viewBox="0 0 48 55" data-svg-content="true" fill="rgb(255, 255, 255)">
								<path d="M42 6.02H6c-2.21 0-4 1.79-4 4V18h4V9.98h36v28.06H6V30H2v8.02c0 2.21 1.79 3.96 4 3.96h36c2.21 0 4-1.76 4-3.96v-28c0-2.21-1.79-4-4-4zM22 32l8-8-8-8v6H2v4h20v6z"></path>
							</svg>공유
						</div>
					</a>
				</div>
			</div>
		</div>
		<div class="text-line"></div>


		<!-- 식당상세정보 -->

		<div class="rest-detail">
			<div class="list">
				<div class="list-add">
					<div class="list-add-1">주소</div>
					<span>서울특별시 블라블라</span>
				</div>
				<div class="list-map">
					<%@ include file = "../map/restDetailMap.jsp" %>
				</div>
				<div class="list-tel">
					<div class="list-tel-1">연락처</div>
					<span>02-999-9999</span>
				</div>
				<div class="list-time">
					<div class="list-time-1">영업시간</div>
					<span>09:00 - 17:00</span>
				</div>
				<div class="list-park">
					<div class="list-park-1">주차</div>
					<span>가능</span>
				</div>
				<div class="list-menu">
						<div class="list-menu-name">
							<div class="list-menu-name-title">메뉴정보</div>
						
							<div class="list-menu-detail">
								<ul>
									<div class="menu-list-1">
										<li>
											<p class="menu-item">
												<span class="rest-menu">햄치즈샌드위치</span>
												<span class="icon">추천</span>
												<span class="menu-price">3,900원</span>
											</p>
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

			
		<div class="review">
			<div class="review title-area">
				<div class="review-title">13건의 맛민이들 리뷰
				</div>
				<div class="btn-review-area">
				<a href="" id="btn-review" class="btn btn-sm btn-secondary">리뷰작성</a>
				</div>
			</div> 
			<br>
		<div class="text-line" style="margin-left:-10px"></div>
			<br>
			<div class="score-area">
				<div class="score-img">
					<div class="star-detail">
						<div class="avg-title">총 별점 평균</div>
						<span class="star">
							<i style="width: 70%;"></i>
						</span>
						<div class="avg-num">4.5</div>
							<ul>
								<li>
								</li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
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
		</div>
	</div>
	<br><br><br>
	</div>

	<script>
	 
	 /* 더보기 버튼 클릭시 접기*/

			// $(".btn-more").click(function(){
			// 		$(".list-menu-2").show();
			// 		$(".btn-more").text("접기");
			// 		$(".r").css({background:'url(https://s3-ap-northeast-1.amazonaws.com/dcicons/new/images/web/common/list-more-up@2x.png) no-repeat right'
			// 					,position: 'relative'
			// 					,right: '-3px'
			// 					,'text-align': 'right'
			// 					,'background-size': '20px'
			// 					});
			// }) 
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>