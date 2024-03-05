<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛슐랭</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<style>

	div{
            box-sizing: border-box;
            /* border: 1px solid red; */
            margin: 0;
            padding: 0;
            display: block;
        }

	.wrap{
		width: 1800px;
		margin: auto;
		box-sizing: border-box;
	}

	/* content 전체 */
	#m-content{
		width: 1000px;
		height: 1650px;
		margin: 0 auto;
		margin-top: 50px;
		margin-bottom: 50px;
	}

	/* content 나누기, 스타일 */
	#m-content>div{width: 100%;}
	#m-content1{height: 300px;}
	#m-content2{height: 1350px;}

	#m-content1>div{width: 100%;}

	/* 맛슐랭 로고 */
	#m-title1{
		height: 200px;
		display: flex;
		justify-content: center;
		
	}

	#mat-title-logo{width: 200px; height: 200px;}

	/* 강남구 맛슐랭 */
	#m-title2{height: 100px;}

	#m-title2>div{
		height: 100%; width: 50%; 
		float: left;
		line-height: 100px;
	}
	
	#m-location{
		font-size: 30px;
		color: rgb(243, 156, 18);
		text-align: right;
		padding-right: 20px;
		
	}
	#m-matchelin{
		font-size: 25px;
		color: rgb(127, 127, 127);
	}

	#m-content2>div{width: 100%; height: 450px;}


	.slide>div{width: 100%;}
	.s-title{height: 150px;}
	.s-content{height: 300px;}

	.s-title>div{height: 100%; width: 50%; float: left;}

	/* 별로고 idv */
	.s-star{
		padding-top: 25px;
		padding-left: 50px;
	}

	/* 더보기 div */
	.s-btn{
		padding-top: 100px;
		padding-right: 30px;
	}

	/* 더보기 버튼 */
	.moreBtn{
		background-color: rgb(243, 156, 18);
		color: #fff;
		float: right;
		border-radius: 7px;
		width: 70px;
		height: 30px;
	}

	/* 슬라이더(slide) 스타일 */

	.swiper-container {
		height:250px;
		border:2px solid silver;
		border-radius:7px;
		margin-top: 20px;
		margin-bottom: 20px;
		/* box-shadow:0 0 20px #ccc inset; */
		
	}
	.swiper-slide {
		text-align:center;
		display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
		align-items:center; /* 위아래 기준 중앙정렬 */
		justify-content:center; /* 좌우 기준 중앙정렬 */
		position: relative;
		z-index: -2;
		padding-top: 30px;
	}
	.swiper-slide img {
		/* box-shadow:0 0 5px #555; */
		/*max-width:100%; 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
		width: 210px;
		height: 210px;
		/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
		border-radius: 10px;
	}
	
	/* 식당이름 스타일 */
	.swiper-slide figcaption{
		text-align: left; 
		font-weight: 600; font-size: 14px;
		padding-top: 2px;
	}

</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>

	<div id="m-content">
		<div id="m-content1">
			<div id="m-title1">
				<img src="resources/matchelin/5.png" id="mat-title-logo">
			</div>
			<div id="m-title2">
				<div id="m-location">
					강남구
				</div>
				<div id="m-matchelin">
					맛슐랭
				</div>
			</div>
		</div>
		<div id="m-content2">
			<div id="slide1" class="slide">
				<div id="slide1-title" class="s-title">
					<div class="s-star">
						<img src="resources/matchelin/matchelin3.png" width="120px" height="120px">
					</div>
					<div class="s-btn">
						<button class="moreBtn">더보기</button>
					</div>
				</div>
				<div id="slide1-content" class="s-content">
					<div class="swiper-container">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <figure>
                                    <img src="https://d12zq4w4guyljn.cloudfront.net/20231003115336_photo1_8e6b5858a3af.jpg">
                                    <figcaption>돼지삼겹살</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231216120911_photo1_df8d74769f81.jpg">
                                <figcaption>양고기엔 칭따오</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/20230212040901_photo2_7467b46fb0da.jpg">
                                <figcaption>나이스샤워</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20230906025829_photo1_49cacd37483c.jpg">
                                <figcaption>왕돈가스</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231106095944_photo1_f769c663e6ec.jpg">
                                <figcaption>파슷하</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231230165122_photo1_8847da7f1f72.jpg">
                                <figcaption>마초쉐프</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20230112044337_photo3_0c355c4fe535.jpg">
                                <figcaption>J bar</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20210702100024643_photo_Fq7SKl7ZXsiR.jpg">
                                <figcaption>오늘 와인어때</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20221030075729_photo1_f845b5a58a5c.jpg">
                                <figcaption>운멜로</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20240118030819_photo1_3661b9018bc4.jpg">
                                <figcaption>정돈</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231229103113_photo1_2361cbab2346.jpg">
                                <figcaption>똠양꿍</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20220322054308_photo1_a34786fb2510.jpg">
                                <figcaption>Garibi</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/20210401120511281_photo_0c8f0ee03560.jpg">
                                <figcaption>아웃백</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/20231002092833980_photo_f8089d108807.jpg">
                                <figcaption>파인다이닝</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20220327022445420_photo_d05e684f1a83.jpg">
                                <figcaption>스시스시</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20240129165655_photo1_f5829e5fe9a2.jpg">
                                <figcaption>왕돈가스먹어</figcaption>
                                </figure>
                            </div>
                        </div>
                        
                        <!-- 네비게이션 -->
                        <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
                        <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
						
                        <!-- 페이징 -->
                        <div class="swiper-pagination"></div>
                    </div>
				</div>
			</div>
			<div id="slide2" class="slide">
				<div id="slide2-title" class="s-title">
					<div class="s-star">
						<img src="resources/matchelin/matchelin2.png" width="120px" height="120px">
					</div>
					<div class="s-btn">
						<button class="moreBtn">더보기</button>
					</div>
				</div>
				<div id="slide2-content" class="s-content">
<div class="swiper-container">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <figure>
                                    <img src="https://d12zq4w4guyljn.cloudfront.net/20231003115336_photo1_8e6b5858a3af.jpg">
                                    <figcaption>돼지삼겹살</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231216120911_photo1_df8d74769f81.jpg">
                                <figcaption>양고기엔 칭따오</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/20230212040901_photo2_7467b46fb0da.jpg">
                                <figcaption>나이스샤워</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20230906025829_photo1_49cacd37483c.jpg">
                                <figcaption>왕돈가스</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231106095944_photo1_f769c663e6ec.jpg">
                                <figcaption>파슷하</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231230165122_photo1_8847da7f1f72.jpg">
                                <figcaption>마초쉐프</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20230112044337_photo3_0c355c4fe535.jpg">
                                <figcaption>J bar</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20210702100024643_photo_Fq7SKl7ZXsiR.jpg">
                                <figcaption>오늘 와인어때</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20221030075729_photo1_f845b5a58a5c.jpg">
                                <figcaption>운멜로</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20240118030819_photo1_3661b9018bc4.jpg">
                                <figcaption>정돈</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231229103113_photo1_2361cbab2346.jpg">
                                <figcaption>똠양꿍</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20220322054308_photo1_a34786fb2510.jpg">
                                <figcaption>Garibi</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/20210401120511281_photo_0c8f0ee03560.jpg">
                                <figcaption>아웃백</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/20231002092833980_photo_f8089d108807.jpg">
                                <figcaption>파인다이닝</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20220327022445420_photo_d05e684f1a83.jpg">
                                <figcaption>스시스시</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20240129165655_photo1_f5829e5fe9a2.jpg">
                                <figcaption>왕돈가스먹어</figcaption>
                                </figure>
                            </div>
                        </div>
                        
                        <!-- 네비게이션 -->
                        <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
                        <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
						
                        <!-- 페이징 -->
                        <div class="swiper-pagination"></div>
                    </div>
				</div>
			</div>
			<div id="slide3" class="slide">
				<div id="slide3-title" class="s-title">
					<div class="s-star">
						<img src="resources/matchelin/matchelin1.png" width="120px" height="120px">
					</div>
					<div class="s-btn">
						<button class="moreBtn">더보기</button>
					</div>
				</div>
				<div id="slide3-content" class="s-content">
					<div class="swiper-container">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <figure>
                                    <img src="https://d12zq4w4guyljn.cloudfront.net/20231003115336_photo1_8e6b5858a3af.jpg">
                                    <figcaption>돼지삼겹살</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231216120911_photo1_df8d74769f81.jpg">
                                <figcaption>양고기엔 칭따오</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/20230212040901_photo2_7467b46fb0da.jpg">
                                <figcaption>나이스샤워</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20230906025829_photo1_49cacd37483c.jpg">
                                <figcaption>왕돈가스</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231106095944_photo1_f769c663e6ec.jpg">
                                <figcaption>파슷하</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231230165122_photo1_8847da7f1f72.jpg">
                                <figcaption>마초쉐프</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20230112044337_photo3_0c355c4fe535.jpg">
                                <figcaption>J bar</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20210702100024643_photo_Fq7SKl7ZXsiR.jpg">
                                <figcaption>오늘 와인어때</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20221030075729_photo1_f845b5a58a5c.jpg">
                                <figcaption>운멜로</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20240118030819_photo1_3661b9018bc4.jpg">
                                <figcaption>정돈</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231229103113_photo1_2361cbab2346.jpg">
                                <figcaption>똠양꿍</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20220322054308_photo1_a34786fb2510.jpg">
                                <figcaption>Garibi</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/20210401120511281_photo_0c8f0ee03560.jpg">
                                <figcaption>아웃백</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/20231002092833980_photo_f8089d108807.jpg">
                                <figcaption>파인다이닝</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20220327022445420_photo_d05e684f1a83.jpg">
                                <figcaption>스시스시</figcaption>
                                </figure>
                            </div>
                            <div class="swiper-slide">
                                <figure>
                                <img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20240129165655_photo1_f5829e5fe9a2.jpg">
                                <figcaption>왕돈가스먹어</figcaption>
                                </figure>
                            </div>
                        </div>
                        
                        <!-- 네비게이션 -->
                        <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
                        <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
						
                        <!-- 페이징 -->
                        <div class="swiper-pagination"></div>
                    </div>
				</div>
			</div>
		</div>
	</div>
	<script>
		new Swiper('.swiper-container', {

			slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
			spaceBetween : 1, // 슬라이드간 간격
			slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
		
			// 그룹수가 맞지 않을 경우 빈칸으로 메우기
			// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
			loopFillGroupWithBlank : true,
		
			loop : true, // 무한 반복
		
			pagination : { // 페이징
				el : '.swiper-pagination',
				clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
			},
			navigation : { // 네비게이션
				nextEl : '.swiper-button-next', // 다음 버튼 클래스명
				prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
			},
		});
	</script>

	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>