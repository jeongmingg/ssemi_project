<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        .main-content{
            width: 1800px;
            margin: auto;
            box-sizing: border-box;
        }
        
        /* 전체 구조 비율 */
        #banner{height: 450px; margin-bottom: 20px; margin-top: 10px;}
        #content{height: 1620px;}

        /* banner 비율 */
        #banner>div{height: 100%; float: left;}
        #banner_1, #banner_3{width: 10%;}
        #banner_2{width: 80%;}

        #banner_2>div{width: 100%; float: left;}
        #banner_2_1{height: 60%;}
        #banner_2_2{height: 25%;}
        #banner_2_3{height: 15%;}

        #banner_2_2>div, #banner_2_3>div{height: 100%; width: 20%; float: left;}
        
        /* banner 스타일 */
        #banner{
            background-color: rgb(255, 170, 28);
            padding-top: 10px;
            padding-bottom: 10px;
        }

        #banner_2_1, #banner_2_2 {text-align: center;}

        #ban_img0{margin-top: 6px;}
        #banner_2_2 img{
            width: 100px;
            height: 100px;
            display: inline-block;
            margin: 0 auto;
            cursor: pointer;
        }

        #banner_2_3 button{
            width: 50%;
            height: 70%;
            background-color: white;
            color: rgb(118, 114, 115);
            
            border-radius: 30px;
            font-size: 25px;
            font-weight: 1000;
            display: inline-block;
            margin: auto;
            padding-top: 7px;
            padding-bottom: 2px;
        }
        
        #banner_2_3>div{
            text-align: center;
            display: flex;
            align-items: center;
            }
        
        /* content 비율 */
        #content>div:not(0){height: 100%; float: left;}
        /* #content_left{width: 15%;} */
        #content_box{width: 70%; margin: auto;}
        /* #content_right{width: 15%;} */

        #content_bestSearch>div{width: 100%; float: left;}
        #content_bestSearch_title{height: 15%;}
        #content_bestSearch_content{height: 85%;}

        #content_bestSearch_title>div{height: 100%; float: left;}
        #content_bestSearch_title_tagname{width: 85%;}
        #content_bestSearch_title_btn{width: 15%;}

        #content_ko>div{width: 100%; float: left;}
        #content_ko_title{height: 15%;}
        #content_ko_content{height: 85%;}

        #content_ko_title>div{height: 100%; float: left;}
        #content_ko_title_tagname{width: 85%;}
        #content_ko_title_btn{width: 15%;}

        #content_we>div{width: 100%; float: left;}
        #content_we_title{height: 15%;}
        #content_we_content{height: 85%;}

        #content_we_title>div{height: 100%; float: left;}
        #content_we_title_tagname{width: 85%;}
        #content_we_title_btn{width: 15%;}

        #content_ch>div{width: 100%; float: left;}
        #content_ch_title{height: 15%;}
        #content_ch_content{height: 85%;}

        #content_ch_title>div{height: 100%; float: left;}
        #content_ch_title_tagname{width: 85%;}
        #content_ch_title_btn{width: 15%;}

        #content_ja>div{width: 100%; float: left;}
        #content_ja_title{height: 15%;}
        #content_ja_content{height: 85%;}

        #content_ja_title>div{height: 100%; float: left;}
        #content_ja_title_tagname{width: 85%;}
        #content_ja_title_btn{width: 15%;}

		/* content 스타일 */
        	/* 태그 이름 스타일 */
	        #content_bestSearch_title_tagname, #content_ko_title_tagname, #content_we_title_tagname,
	        #content_ch_title_tagname, #content_ja_title_tagname
	        {
	            color: #E4910D;
	            font-size: 14px;
	            font-weight: 600;
	            padding-left: 20px;
	        }
		
			/* 더보기 버튼 스타일 */
			
	        #bestSearchBtn, #koBtn, #weBtn, #chBtn, #jaBtn{
	            background-color: #E4910D;
	            border: none;
	            color: white;
	            border-radius: 8px;
	        }
	        
	        #content_bestSearch_title_btn, #content_ko_title_btn, #content_we_title_btn,
	        #content_ch_title_btn, #content_ja_title_btn
	        {
	            padding-left: 120px;
	            line-height: 15px;
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
	
	<%@ include file="views/common/header.jsp" %>
    <%@ include file="views/common/navigator.jsp" %>
	
	<div class="main-content">
        <div id="banner">
            <div id="banner_1"></div>
            <div id="banner_2">
                <div id="banner_2_1">
                    <img id="ban_img0" src="resources/banner/walet-small.png">
                </div>
                <div id="banner_2_2">
                    <div id="banner_2_2_1">
                        <img class="banner_1" id="ban_img1" src="resources/banner/rank/KakaoTalk_20240212_182633118_02.png">
                    </div>
                    <div id="banner_2_2_2">
                        <img class="banner_2" id="ban_img2" src="resources/banner/rank/KakaoTalk_20240212_182633118_04.png">
                    </div>
                    <div id="banner_2_2_3">
                        <img class="banner_3"id="ban_img3" src="resources/banner/rank/KakaoTalk_20240212_182633118.png">
                    </div>
                    <div id="banner_2_2_4">
                        <img class="banner_4" id="ban_img4" src="resources/banner/rank/KakaoTalk_20240212_182633118_01.png">
                    </div>
                    <div id="banner_2_2_5">
                        <img class="banner_5" id="ban_img5" src="resources/banner/rank/KakaoTalk_20240212_182633118_03.png">
                    </div>
                </div>
                <div id="banner_2_3">
                    <div id="banner_2_3_1">
                        <button class="banner_1" id="ban_btn1">사원</button>
                    </div>
                    <div id="banner_2_3_2">
                        <button class="banner_2" id="ban_btn2">대리</button>
                    </div>
                    <div id="banner_2_3_3">
                        <button class="banner_3" id="ban_btn3">과장</button>
                    </div>
                    <div id="banner_2_3_4">
                        <button class="banner_4" id="ban_btn4">차장</button>
                    </div>
                    <div id="banner_2_3_5">
                        <button class="banner_5" id="ban_btn5">부장</button>
                    </div>
                </div>
            </div>
            
        </div>

        <script>
            // 사원 hover style
            $(".banner_1").hover(
                // mouseenter
                function () {
                    $("#ban_btn1").css({
                        "color": "#E4910D",
                        "font-size": "19px"
                    }).text("7000원 이하");
                },
                // mouseout
                function () {
                    $("#ban_btn1").css({
                        "color": "",
                        "font-size": "25px",
                        "font-weight": 1000
                    }).text("사원");
                }
            );
            
            // 대리 hover style
            $(".banner_2").hover(
                // mouseenter
                function () {
                    $("#ban_btn2").css({
                        "color": "#E4910D",
                        "font-size": "15px",
                        "padding-bottom": "43px"
                    }).text("7000원 초과 12000원 이하");
                },
                // mouseout
                function () {
                    $("#ban_btn2").css({
                        "color": "",
                        "padding-bottom": "",
                        "font-size": "25px",
                        "font-weight": 1000
                    }).text("대리");
                }
            );

            // 과장 hover style
            $(".banner_3").hover(
                // mouseenter
                function () {
                    $("#ban_btn3").css({
                        "color": "#E4910D",
                        "font-size": "15px",
                        "padding-bottom": "43px"
                    }).text("12000원 초과 20000원 이하");
                },
                // mouseout
                function () {
                    $("#ban_btn3").css({
                        "color": "",
                        "padding-bottom": "",
                        "font-size": "25px",
                        "font-weight": 1000
                    }).text("과장");
                }
            );

            // 차장 hover style
            $(".banner_4").hover(
                // mouseenter
                function () {
                    $("#ban_btn4").css({
                        "color": "#E4910D",
                        "font-size": "15px",
                        "padding-bottom": "43px"
                    }).text("20000원 초과 35000원 이하");
                },
                // mouseout
                function () {
                    $("#ban_btn4").css({
                        "color": "",
                        "padding-bottom": "",
                        "font-size": "25px",
                        "font-weight": 1000
                    }).text("차장");
                }
            );

            // 부장 hover style
            $(".banner_5").hover(
                // mouseenter
                function () {
                    $("#ban_btn5").css({
                        "color": "#E4910D",
                        "font-size": "19px"
                    }).text("35000원 초과");
                },
                // mouseout
                function () {
                    $("#ban_btn5").css({
                        "color": "",
                        "font-size": "25px",
                        "font-weight": 1000
                    }).text("부장");
                }
            );

        </script>
       
        <div id="content">
            <div id="topBtn">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="45" height="45" viewBox="0 0 32 32" fill="rgb(230, 126, 34)" data-svg-content="true">
                    <g>
                        <path d="M 17,2C 8.716,2, 2,8.716, 2,17S 8.716,32, 17,32S 32,25.284, 32,17S 25.284,2, 17,2z M 23.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0L 18,11.414L 18,27 C 18,27.552, 17.552,28, 17,28S 16,27.552, 16,27L 16,11.414 L 11.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0c-0.39-0.39-0.39-1.024,0-1.414l 6-6C 16.296,8.29, 16.298,8.29, 16.3,8.288 c 0.090-0.088, 0.198-0.162, 0.316-0.21c 0.244-0.102, 0.52-0.102, 0.764,0C 17.504,8.128, 17.614,8.2, 17.708,8.292l 6,6 C 24.098,14.684, 24.098,15.316, 23.708,15.708z"></path>
                    </g>
                </svg>
            </div>
            
            <div id="content_left">
            </div>
            <div id="content_box">
                <div id="content_bestSearch">
                    <div id="content_bestSearch_title">
                        <div id="content_bestSearch_title_tagname" style="font-size: 20px;">
                            # 인기 맛집
                        </div>
                        <div id="content_bestSearch_title_btn">
                            <button id="bestSearchBtn">더보기</button>
                        </div>
                    </div>
                    <!-- <div id="content_bestSearch_content"> -->
                        <!-- <div id="content_bestSearch_content_1"> -->
                            <!-- 클래스명은 변경하면 안 됨 -->
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
                
                <div id="content_ko">
                    <div id="content_ko_title">
                        <div id="content_ko_title_tagname" style="font-size: 20px;">
                            # 한식
                        </div>
                        <div id="content_ko_title_btn">
                            <button id="koBtn">더보기</button>
                        </div>
                    </div>
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

                <div id="content_we">
                    <div id="content_we_title">
                        <div id="content_we_title_tagname" style="font-size: 20px;">
                            # 양식
                        </div>
                        <div id="content_we_title_btn">
                            <button id="weBtn">더보기</button>
                        </div>
                    </div>

                    <!-- 클래스명은 변경하면 안 됨 -->
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

                <div id="content_ch">
                    <div id="content_ch_title">
                        <div id="content_ch_title_tagname" style="font-size: 20px;">
                            # 중식
                        </div>
                        <div id="content_ch_title_btn">
                            <button id="chBtn">더보기</button>
                        </div>
                    </div>

                    <!-- 클래스명은 변경하면 안 됨 -->
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

                <div id="content_ja">
                    <div id="content_ja_title">
                        <div id="content_ja_title_tagname" style="font-size: 20px;">
                            # 일식
                        </div>
                        <div id="content_ja_title_btn">
                            <button id="jaBtn">더보기</button>
                        </div>
                    </div>

                    <!-- 클래스명은 변경하면 안 됨 -->
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
            <div id="content_right">
            </div>
        </div>
                <script>
                new Swiper('.swiper-container', {
        
                    slidesPerView : 5, // 동시에 보여줄 슬라이드 갯수
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
        
        <%@ include file="views/common/footer.jsp" %>
    </div>
  
</body>
</html>