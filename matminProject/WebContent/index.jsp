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
        
        /* 전체 구조 비율 */
        .wrap>div{width: 100%;}
        #header{height: 170px;}
        #navigator{height: 45px;}
        #banner{height: 275px;} /* margin-bottom: 20px */
        #content{height: 1600px;}
        #footer{height: 120px;}

        /* header 비율 */
        #header>div{height: 100%; float: left;}
        #header_1{width: 20%; padding-left: 50px;}
        #header_2{width: 56%;}
        #header_3{width: 8%;}
        #header_4{width: 8%;}
        #header_5{
            width: 8%; padding-top: 50px; 
            display: flex;
            justify-content: center;
            align-items: center;}
		
		/* header 스타일 - 로고, 검색창, 로그인, 회원가입, 최근본식당 */
			/* logo 스타일 */
	        #logo{width: 80%; height: 140%;}
	
	        /* 검색창 스타일 */
	        /* 검색창 div id="header_2" class="sc-cmfmEs leAvxd"
	            그안에 div class="sc-UFtxY OqZgF Input__Wrap" */
	        /* input 클래스 : sc-hnmMDg bccLDB Search__Input */
	        /* button 클래스 : sc-jPQLIr gZgnOG search */
	        .leAvxd {  
	                    padding-left: 300px;
	                    padding-top: 80px;  
	                    min-width: 430px;
	                }
	
	        .OqZgF {
	                border: 2px solid #E4910D;
	                position: relative;
	                box-sizing: border-box;
	                display: grid;
	                grid-auto-flow: column;
	                grid-auto-columns: auto 18px 22px;
	                gap: 20px;
	                -webkit-box-align: center;
	                align-items: center;
	                width: 100%;
	                max-width: 506px;
	                min-width: 430px;
	                height: 42px;
	                padding-right: 20px;
	                border-radius: 21px;
	                background-color: rgb(245, 245, 245); 
	            }
	
	        .bccLDB {
	            display: block;
	            max-width: 72.5%;
	            width: 100%;
	            height: 30px;
	            margin-left: 24px;
	            padding: 0px 0px 2px;
	            background-color: transparent;
	            outline: transparent;
	            border: transparent;
	            font-size: 0.9375rem;
	            line-height: 1.3125rem;
	            letter-spacing: -0.0469rem;
	            color: rgb(32, 32, 32);
	            padding-top: 6px;
	        }
	
	        input {
	                text-rendering: auto;
	                color: fieldtext;
	                letter-spacing: normal;
	                word-spacing: normal;
	                line-height: normal;
	                text-transform: none;
	                text-indent: 0px;
	                text-shadow: none;
	                display: inline-block;
	                text-align: start;
	                appearance: auto;
	                -webkit-rtl-ordering: logical;
	                cursor: text;
	                background-color: field;
	                margin: 0em;
	                padding: 1px 0px;
	                border-width: 2px;
	                border-style: inset;
	                border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
	                border-image: initial;
	                padding-block: 1px;
	                padding-inline: 2px;
	            }
	
	        /* 검색버튼 */
	        .gZgnOG {
	                    width: 22px;
	                    height: 22px;
	                    background-image: url(https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/web/react_components/SearchQueryInput/search.png);
	                    background-size: 100%;
	                }
	                
	        * {
	            letter-spacing: -.0437rem;
	            outline: none;
	        }
	        
	        button {
	                background-color: transparent;
	                border: transparent;
	                cursor: pointer;
	            }
	
	        /* button {
	                appearance: auto;
	                text-rendering: auto;
	                color: buttontext;
	                letter-spacing: normal;
	                word-spacing: normal;
	                line-height: normal;
	                text-transform: none;
	                text-indent: 0px;
	                text-shadow: none;
	                display: inline-block;
	                text-align: center;
	                align-items: flex-start;
	                cursor: default;
	                box-sizing: border-box;
	                background-color: buttonface;
	                margin: 0em;
	                padding-block: 1px;
	                padding-inline: 6px;
	                border-width: 2px;
	                border-style: outset;
	                border-color: buttonborder;
	                border-image: initial;
	            } */
	         
	        /* 로그인, 회원가입 버튼 스타일 */
	
	        #header a{
	            text-decoration: none;
	            color: rgb(150, 150, 150);
	            font-size: 18px;
	            font-weight: 600;
	
	            width: 100%; height: 100%;
	            /* display: block; */
	            line-height: 210px;
	            text-align: center;
	
	        }
	
	        #header_3{padding-left: 90px;}
	        #header_4{padding-left: 40px;}
			
        /* navigator 비율 */
        #navigator>div{height: 100%; float: left;}
        #navigator_1{width: 20%;}
        #navigator_2{
            width: 70%; 
            padding-left: 80px;
            padding-right: 80px;
        }
        #navigator_3{width: 10%;}
        
        /* navigator 스타일 */
	        #navi{
	            list-style-type: none;
	            padding: 0;
	            margin: 0;
	            height: 100%;
	        }
	
	        #navi>li{
	            float: left;
	            width: 33%;
	            height: 100%;
	            text-align: center;
	        }
	
	        #navi a{
	            text-decoration: none;
	            color: rgb(150, 150, 150);
	            font-size: 18px;
	            font-weight: 600;
	
	            width: 100%;
	            height: 100%;
	            display: block;
	            line-height: 40px;
	        }

        /* banner 비율 */

        #banner>div{width: 100%; float: left;}
        #banner_1{height: 20%;}
        #banner_2{height: 20%;}
        #banner_3{height: 60%;}
        #banner_3>div{height: 100%; width: 20%; float: left;}
        #banner_3_1>div{width: 100%; height: 45%; float: left;}
        #banner_3_2>div{width: 100%; height: 45%; float: left;}
        #banner_3_3>div{width: 100%; height: 45%; float: left;}
        #banner_3_4>div{width: 100%; height: 45%; float: left;}
        #banner_3_5>div{width: 100%; height: 45%; float: left;}

		/* 배너 스타일 */
        #banner{
            background-color: #E4910D;
            /* padding-bottom: 5px; */
            margin-bottom: 20px;
        }
        #banner_1>h1{
            text-align: center;
            color: white;
            line-height: 15px;
        }

        #banner_2{
            padding-left: 830px;
            padding-top: 5px;
        }
        #banner_3>div{
            text-align: center;
            padding-top: 30px;
        }

        #banner_3_1{padding-left: 200px;}
        #banner_3_2{padding-left: 100px; padding-right: 50px;}
        #banner_3_3{padding-left: 80px; padding-right: 80px;}
        #banner_3_4{padding-right: 100px;}
        #banner_3_5{padding-right: 200px;}

        #banner_3 button {
            background-color: white;
            color: #E4910D;
            border-radius: 20px;
            font-weight: 1000;
            width: 100px;
            height: 50px;
            
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
	      
	      	/* 슬라이더 스타일 */

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
	        }
	        .swiper-slide img {
	            /* box-shadow:0 0 5px #555; */
	            /*max-width:100%; 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
	            width: 100%;
	            height: 100%;
	            /* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
	            border-radius: 10px;
	        }
			
        /* footer 비율 */
        #footer>div{height: 100%; float: left;}
        #footer_1{width: 100%;}
        #topBtn{
            position: fixed;
            left: 93%;
            top: 90%;
            z-index: 999;
        }
        
        #footer_1>div{width: 100%; float: left;}
        #footer_1_1{height: 20%;}
        #footer_1_2{height: 40%;}

		 /* 푸터바 스타일 */
        #p1{
            width: 100%; 
            box-sizing: border-box;
            margin: 0;
            font-size: 15px;
            color: rgb(58, 58, 58);
            padding-left: 100px;
        }

        #p2{
            width: 100%; 
            box-sizing: border-box;
            margin: 0;
            font-size: 14px;
            color: rgb(58, 58, 58);
            padding-left: 100px;
        }
        
        #topBtn>svg{
            /* padding-top: 850px; */
            /* padding-left: 200px; */
            cursor: pointer;
            position: sticky;
        }
       
    </style>
</head>
<body>
	<div class="wrap">
        <div id="header">
            <div id="header_1">
                <img id="logo" src="resources/logo/투명배경로고.png">
            </div>

                <div id="header_2" class="sc-cmfmEs leAvxd" >
                <div class="sc-UFtxY OqZgF Input__Wrap">
                    <input id="searchInput" class="sc-hnmMDg bccLDB Search__Input" placeholder="지역, 음식 또는 식당명 입력" value="">
                    <button id="searchBtn" class="sc-jPQLIr gZgnOG search" type="button" aria-label="검색하기 버튼"></button>
                </div>
            </div>
            
            <div id="header_3">
                <a href="#">로그인</a>
            </div>
            <div id="header_4">
                <a href="#">회원가입</a>
            </div>
            <div id="header_5">
                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 48 48" data-svg-content="true" fill="#000000">
                    <path d="M6 10H2v32c0 2.21 1.79 4 4 4h32v-4H6V10zm36-8H14c-2.21 0-4 1.79-4 4v28c0 2.21 1.79 4 4 4h28c2.21 0 4-1.79 4-4V6 c0-2.21-1.79-4-4 -4zm0 32H14V6h28v28z"></path>
                </svg>
            </div>
        </div>
        <div id="navigator">
            <div id="navigator_1"></div>
            <div id="navigator_2">
                <ul id="navi">
                    <li><a href="#" id="navi1">맛집등록/삭제</a></li>
                    <li><a href="#" id="navi2">맛슐랭</a></li>
                    <li><a href="#" id="navi3">맛집뺑뺑이</a></li>
                </ul>
            </div>
            <div id="navigator_3"></div>
        </div>

        <script>
            // $("#navi").children().children().mouseenter("color","#E4910D");
            $("#navi a, #header_3 a, #header_4 a").mouseenter(function(){
                $(this).css("color","#E4910D");
            });

            $("#navi a, #header_3 a, #header_4 a").mouseout(function(){
                $(this).css("color", "rgb(150, 150, 150)");
            });

        </script>
        <div id="banner">
            <div id="banner_1"><h1>오늘 당신의 지갑 상태는?!</h1></div>
            <div id="banner_2">
                <img src="resources/money/wallet_7155311.png" width="70px" height="70px">
                <img src="resources/money/funding_11794734.png" width="70px" height="70px">
            </div>
            <div id="banner_3">
                <div id="banner_3_1">
                    <div id="banner_3_1_1"><button id="bannerBtn1">사원</button></div>
                    <div id="banner_3_1_2"></div>
                    
                </div>
                <div id="banner_3_2">
                    <div id="banner_3_2_1"><button id="bannerBtn2">대리</button></div>
                    <div id="banner_3_2_2"></div>
                    
                </div>
                <div id="banner_3_3">
                    <div id="banner_3_3_1"><button id="bannerBtn3">과장</button></div>
                    <div id="banner_3_3_2"></div>
                    
                </div>
                <div id="banner_3_4">
                    <div id="banner_3_4_1"><button id="bannerBtn4">차장</button></div>
                    <div id="banner_3_4_2"></div>
                    
                </div>
                <div id="banner_3_5">
                    <div id="banner_3_5_1"><button id="bannerBtn5">부장</button></div>
                    <div id="banner_3_5_2"></div>
                    
                </div>  
            </div>
        </div>

        <script>
            $("#bannerBtn1").hover(
                // mouseenter
                function () {
                    $("#banner_3_1_2").css({
                        "background-color": "white",
                        "color": "#E4910D",
                        "border-radius": "10px",
                        "line-height": "60px"
                    }).text("7000원 이하");
                },
                // mouseout
                function () {
                    $("#banner_3_1_2").css({
                        "background-color": "",
                        "color": "",
                        "border-radius": "",
                        "line-height": ""
                    }).text("");
                }
            );

            $("#bannerBtn2").hover(
                // mouseenter
                function () {
                    $("#banner_3_2_2").css({
                        "background-color": "white",
                        "color": "#E4910D",
                        "border-radius": "10px",
                        "line-height": "60px"
                    }).text("7000원 초과 12000원 이하");
                },
                // mouseout
                function () {
                    $("#banner_3_2_2").css({
                        "background-color": "",
                        "color": "",
                        "border-radius": "",
                        "line-height": ""
                    }).text("");
                }
            );

            $("#bannerBtn3").hover(
                // mouseenter
                function () {
                    $("#banner_3_3_2").css({
                        "background-color": "white",
                        "color": "#E4910D",
                        "border-radius": "10px",
                        "line-height": "60px"
                    }).text("12000원 초과 20000원 이하");
                },
                // mouseout
                function () {
                    $("#banner_3_3_2").css({
                        "background-color": "",
                        "color": "",
                        "border-radius": "",
                        "line-height": ""
                    }).text("");
                }
            );
            
            $("#bannerBtn4").hover(
                // mouseenter
                function () {
                    $("#banner_3_4_2").css({
                        "background-color": "white",
                        "color": "#E4910D",
                        "border-radius": "10px",
                        "line-height": "60px"
                    }).text("20000원 초과 35000원 이하");
                },
                // mouseout
                function () {
                    $("#banner_3_4_2").css({
                        "background-color": "",
                        "color": "",
                        "border-radius": "",
                        "line-height": ""
                    }).text("");
                }
            );

            $("#bannerBtn5").hover(
                // mouseenter
                function () {
                    $("#banner_3_5_2").css({
                        "background-color": "white",
                        "color": "#E4910D",
                        "border-radius": "10px",
                        "line-height": "60px"
                    }).text("35000원 초과");
                },
                // mouseout
                function () {
                    $("#banner_3_5_2").css({
                        "background-color": "",
                        "color": "",
                        "border-radius": "",
                        "line-height": ""
                    }).text("");
                }
            );
        </script>
        <div id="content">
            <div  id="topBtn">
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
                            <div class="swiper-slide"> <img src="https://d12zq4w4guyljn.cloudfront.net/20231003115336_photo1_8e6b5858a3af.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231216120911_photo1_df8d74769f81.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/20230212040901_photo2_7467b46fb0da.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20230906025829_photo1_49cacd37483c.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231106095944_photo1_f769c663e6ec.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231230165122_photo1_8847da7f1f72.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20230112044337_photo3_0c355c4fe535.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20210702100024643_photo_Fq7SKl7ZXsiR.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20221030075729_photo1_f845b5a58a5c.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20240118030819_photo1_3661b9018bc4.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231229103113_photo1_2361cbab2346.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20220322054308_photo1_a34786fb2510.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/20210401120511281_photo_0c8f0ee03560.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/20231002092833980_photo_f8089d108807.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20220327022445420_photo_d05e684f1a83.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20240129165655_photo1_f5829e5fe9a2.jpg"></div>
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
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/20231003115336_photo1_8e6b5858a3af.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231216120911_photo1_df8d74769f81.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/20230212040901_photo2_7467b46fb0da.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20230906025829_photo1_49cacd37483c.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231106095944_photo1_f769c663e6ec.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231230165122_photo1_8847da7f1f72.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20230112044337_photo3_0c355c4fe535.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20210702100024643_photo_Fq7SKl7ZXsiR.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20221030075729_photo1_f845b5a58a5c.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20240118030819_photo1_3661b9018bc4.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231229103113_photo1_2361cbab2346.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20220322054308_photo1_a34786fb2510.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/20210401120511281_photo_0c8f0ee03560.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/20231002092833980_photo_f8089d108807.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20220327022445420_photo_d05e684f1a83.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20240129165655_photo1_f5829e5fe9a2.jpg"></div>
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
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/20231003115336_photo1_8e6b5858a3af.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231216120911_photo1_df8d74769f81.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/20230212040901_photo2_7467b46fb0da.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20230906025829_photo1_49cacd37483c.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231106095944_photo1_f769c663e6ec.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231230165122_photo1_8847da7f1f72.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20230112044337_photo3_0c355c4fe535.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20210702100024643_photo_Fq7SKl7ZXsiR.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20221030075729_photo1_f845b5a58a5c.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20240118030819_photo1_3661b9018bc4.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231229103113_photo1_2361cbab2346.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20220322054308_photo1_a34786fb2510.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/20210401120511281_photo_0c8f0ee03560.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/20231002092833980_photo_f8089d108807.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20220327022445420_photo_d05e684f1a83.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20240129165655_photo1_f5829e5fe9a2.jpg"></div>
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
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/20231003115336_photo1_8e6b5858a3af.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231216120911_photo1_df8d74769f81.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/20230212040901_photo2_7467b46fb0da.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20230906025829_photo1_49cacd37483c.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231106095944_photo1_f769c663e6ec.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231230165122_photo1_8847da7f1f72.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20230112044337_photo3_0c355c4fe535.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20210702100024643_photo_Fq7SKl7ZXsiR.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20221030075729_photo1_f845b5a58a5c.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20240118030819_photo1_3661b9018bc4.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231229103113_photo1_2361cbab2346.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20220322054308_photo1_a34786fb2510.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/20210401120511281_photo_0c8f0ee03560.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/20231002092833980_photo_f8089d108807.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20220327022445420_photo_d05e684f1a83.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20240129165655_photo1_f5829e5fe9a2.jpg"></div>
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
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/20231003115336_photo1_8e6b5858a3af.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231216120911_photo1_df8d74769f81.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/20230212040901_photo2_7467b46fb0da.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20230906025829_photo1_49cacd37483c.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231106095944_photo1_f769c663e6ec.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231230165122_photo1_8847da7f1f72.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20230112044337_photo3_0c355c4fe535.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20210702100024643_photo_Fq7SKl7ZXsiR.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20221030075729_photo1_f845b5a58a5c.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20240118030819_photo1_3661b9018bc4.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20231229103113_photo1_2361cbab2346.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20220322054308_photo1_a34786fb2510.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/20210401120511281_photo_0c8f0ee03560.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/20231002092833980_photo_f8089d108807.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20220327022445420_photo_d05e684f1a83.jpg"></div>
                            <div class="swiper-slide"><img src="https://d12zq4w4guyljn.cloudfront.net/750_750_20240129165655_photo1_f5829e5fe9a2.jpg"></div>
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
			            spaceBetween : 10, // 슬라이드간 간격
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
        
        <div id="footer">
            <div id="footer_1">
                <div id="footer_1_1">
                    <p id="p1">
                        ㈜ 맛집의 민족  | 사업자 등록번호 : 267-12-11237 | ℡☎ : 02-111-2222 | email : matmin@gmail.com
                    </p>
                </div>
                <div id="footer_1_2">
                    <p id="p2">
                        Copyright © 2024 - 2024 The Nation Of Delicious Restaurants All Right Reserved
                    </p>
                </div>
            </div>
        </div>
    </div>
  
</body>
</html>