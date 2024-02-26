<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 식당 검색결과 페이지 </title>
<!-- <link rel="stylesheet" href="resources/assets/css/lithium.css"/> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>

    div{
        box-sizing: border-box;
        border: 1px solid red;
        margin: 0;
        padding: 0;
        display: block;
        }

    .main-content{
        width: 1800px;
        margin: auto;
        box-sizing: border-box;
    }
    
    .content{
        height: 1600px;
        margin: 0 auto;
        display: flex;
        justify-content: center;
        margin-bottom: 50px;
    }
    
    .content>div{
        height: 100%;
        margin-top: 30px;
        border-radius: 30px;
    }
    #content_1{
        width: 400px;
        border: 1px solid #E4910D;
        margin-right: 40px;
        padding: 30px;
    }

    /* 사이드바 비율, 스타일 */
    #content_1>div{width: 100%; margin-bottom: 50px;}
    #social{height: 250px;}
    #category{height: 300px;}
    #location{height: 400px;}
    #function{height: 400px;}

    /* 큰 content */
    #content_2{
        width: 900px;
        border: 1px solid #E4910D;
        padding: 30px;
        /* padding-left: 20px;
        padding-right: 40px;
        padding-bottom: 40px; */
    }

    #content_2>div{width: 100%; float: left;}
    /* 검색결과 div */
    #search-list{height: 80%;}

    /* 맛집등록요청 div */
    #rest-rq{
        height: 300px;
        border: 2px solid rgb(230, 126, 34);
        border-radius: 20px;
        margin-top: 30px;
    }

    #content_1 p {
        font-weight: bold;
        font-size: 25px;
        padding-left: 10px;
    }

    .content-title{
        display: flex;
        align-items: center;
    }

    

    /* 카테고리 스타일 */
    #category_content ul {
        display: flex;
        flex-wrap: wrap; /* 여러 행을 만들 수 있도록 허용하는 속성 */
        list-style: none;
        padding: 0;
        margin: 0;
    }

    #category_list1 li, #category_list2 li{
        width: 50%; /* 한 행에 두 개의 아이템을 표시하도록 설정 */
        list-style: none;
        font-size: 18px;
    }
    #category_content li input {
        margin-right: 5px;
    }
    #category_content li label{
        cursor: pointer;
    }

    /* 펼치기 버튼 */
    #list-Btn button {
        width:85%;
        height: 35px;
        margin: 10px;
        border-radius: 5px;
        cursor: pointer;
        background-color: lightgray;
        font-weight: 500;
        border-color: lightgray;
    }

    /* 지역검색 스타일 */

    .ll>ul{
        margin: 0;
        padding: 0;
    }

    /* 지역검색 창 */
    .ll{
        width: 250px;
        border: 1px solid #C4C4C4;
        box-sizing: border-box;
        border-radius: 10px;
        padding: 12px 13px;
        font-family: 'Roboto';
        font-style: normal;
        font-weight: 400;
        font-size: 14px;
        line-height: 16px;
        background: url(./img/Polygon_up.png) 93% no-repeat; /*화살표 이미지 삽입*/
        appearance: none;
        text-align: left;
    }


    .ll:hover{
        border: 1px solid #E4910D;
        box-sizing: border-box;
        border-radius: 10px;
        /* outline: 3px solid #F8E4FF; */
        border-radius: 10px;
    }

    /* ul 스타일 */
    .location-list{
        width: 250px;
        list-style: none;
        background: #FFFFFF;
        border: 1px solid #C4C4C4;
        box-sizing: border-box;
        box-shadow: 4px 4px 14px rgba(0, 0, 0, 0.15);
        border-radius: 10px;
        margin-top: 9px;
    }

    /* li 스타일 */
    .list{
        border: none;
        background-color: #FFFFFF;
        font-family: 'Roboto';
        font-style: normal;
        font-weight: 400;
        font-size: 14px;
        line-height: 16px;
        padding: 7px 10px;
        margin: 5px 7px;
        box-sizing: border-box;
    }

    .list:hover{
        background: #FFE9D2;
        width: 184px;
        border-radius: 8px;
        box-sizing: border-box;
        text-align: left;
    }

    /* 편의기능 스타일 */

    #function_content label{
        width: 45%;
        font-size: 18px;
        cursor: pointer;
    }
    
    /* 맛집등록요청 버튼 div */
    #rsrq-btn-div{
        display: flex;
        justify-content: center;
    }

    /* 맛집등록 요청하기 버튼 */
    #rest-rq-btn{
        width: 350px;
        height: 80px;
        background-color: rgb(246, 184, 84);
        border: none;
        border-radius: 20px;
    }

    /* 맛집등록 요청 밑에 p태그 */
    #rest-rq-p{
        text-align: center;
        color: rgb(185, 185, 185);
        font-weight: bold;
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
    
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>

    <div class="wrap">
        <div class="content">
            <div id="content_1">
                <div id="social">
                    <div id="social_title" class="content-title">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 48 48" data-svg-content="true" fill="rgb(242, 24, 24)"><path d="M36 8H12c-2.21 0-4 1.79-4 4v24c0 2.21 1.79 4 4 4h24c2.21 0 4-1.79 4-4V12c0-2.21-1.79-4-4-4zm0 28H12V12h24v24z"></path></svg>
                        <p>소셜</p>
                    </div>
                    <div id="social_content">
                        <div class="myHeartList1">
                            
                            나의 찜꽁목록
                        </div>
                        <div class="myHeartList2"></div>
                    </div>
                    
                </div>
                <div id="category">
                    <div id="category_title" class="content-title">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 48 48" data-svg-content="true" fill="rgb(230, 126, 34)"><path d="M36 8H12c-2.21 0-4 1.79-4 4v24c0 2.21 1.79 4 4 4h24c2.21 0 4-1.79 4-4V12c0-2.21-1.79-4-4-4zm0 28H12V12h24v24z"></path></svg>
                        <p>카테고리</p>
                    </div>
                    <div id="category_content">
                        <div id="category_list1">
                        <ul>
                            <li><input type="radio" name="category" id="rest"><label for="rest">&nbsp;&nbsp;밥집</label></li>
                            <li><input type="radio" name="category" id="cafe"><label for="cafe">&nbsp;&nbsp;카페</label></li>
                            <li><input type="radio" name="category" id="ko"><label for="ko">&nbsp;&nbsp;한식</label></li>
                            <li><input type="radio" name="category" id="ch"><label for="ch">&nbsp;&nbsp;중식</label></li>
                            <li><input type="radio" name="category" id="we"><label for="we">&nbsp;&nbsp;양식</label></li>
                            <li><input type="radio" name="category" id="ja"><label for="ja">&nbsp;&nbsp;일식</label></li>
                        </ul>
                        </div>
                        
                        <div id="category_list2">
                        <ul>
                            <li><input type="radio" name="category" id="bs"><label for="bs">&nbsp;&nbsp;분식</label></li>
                            <li><input type="radio" name="category" id="vf"><label for="vf">&nbsp;&nbsp;뷔페</label></li>
                            <li><input type="radio" name="category" id="soju"><label for="soju">&nbsp;&nbsp;술집</label></li>
                            <li><input type="radio" name="category" id="meat"><label for="meat">&nbsp;&nbsp;고깃집</label></li>
                            <li><input type="radio" name="category" id="fish"><label for="fish">&nbsp;&nbsp;횟집</label></li>
                            <li><input type="radio" name="category" id="ff"><label for="ff">&nbsp;&nbsp;패스트푸드</label></li>
                        </ul>
                        </div>
                        <div id="list-Btn"><button type="button" id="listBtn" class="btn">펼치기</button></div>
                    </div>  
                </div>
                <div id="location">
                    <div id="location_title" class="content-title">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 48 48" data-svg-content="true" fill="rgb(241, 196, 15)"><path d="M36 8H12c-2.21 0-4 1.79-4 4v24c0 2.21 1.79 4 4 4h24c2.21 0 4-1.79 4-4V12c0-2.21-1.79-4-4-4zm0 28H12V12h24v24z"></path></svg>
                        <p>지역</p>
                    </div>
                    <button class="ll on" onclick="select();">지역 검색</button>
                        <ul class="location-list" id="location-list">
                            <li><button class="list">강남구</button></li>
                            <li><button class="list">강동구</button></li>
                            <li><button class="list">강북구</button></li>
                            <li><button class="list">강서구</button></li>
                            <li><button class="list">관악구</button></li>
                        </ul>
                    <div id="location_content">
                        
                        <!-- <select name="" id="" width="500px">
                            <option value="" selected>지역 검색</option>
                             <option value="">강남구</option>
                             <option value="">강동구</option>
                             <option value="">강북구</option>
                             <option value="">강서구</option>
                             <option value="">관악구</option>
                             <option value="">광진구</option>
                             <option value="">구로구</option>
                             <option value="">금천구</option>
                             <option value="">노원구</option>
                             <option value="">도봉구</option>
                             <option value="">동대문구</option>
                             <option value="">동작구</option>
                             <option value="">마포구</option>
                             <option value="">서대문구</option>
                             <option value="">서초구</option>
                             <option value="">성동구</option>
                             <option value="">성북구</option>
                             <option value="">송파구</option>
                             <option value="">양천구</option>
                             <option value="">영등포구</option>
                             <option value="">용산구</option>
                             <option value="">은평구</option>
                             <option value="">종로구</option>
                             <option value="">중구</option>
                             <option value="">중랑구</option>
                        </select> -->
                    </div>
                </div>
                <div id="function">
                    <div id="function_title" class="content-title">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 48 48" data-svg-content="true" fill="rgb(39, 174, 96)"><path d="M36 8H12c-2.21 0-4 1.79-4 4v24c0 2.21 1.79 4 4 4h24c2.21 0 4-1.79 4-4V12c0-2.21-1.79-4-4-4zm0 28H12V12h24v24z"></path></svg>
                        <p>편의기능</p>
                    </div>
                    <div id="function_content">
                        <input type="checkbox" id="pk"><label for="pk">&nbsp;&nbsp;주차</label>
                        <input type="checkbox" id="bl"><label for="bl">&nbsp;&nbsp;발렛</label>
                        <input type="checkbox" id="24"><label for="24">&nbsp;&nbsp;24시</label>
                        <input type="checkbox" id="pl"><label for="pl">&nbsp;&nbsp;놀이방</label>
                        <input type="checkbox" id="er"><label for="er">&nbsp;&nbsp;개별룸</label>
                        <input type="checkbox" id="br"><label for="br">&nbsp;&nbsp;대형룸</label>
                        <input type="checkbox" id="ot"><label for="ot">&nbsp;&nbsp;야외좌석</label>
                        <input type="checkbox" id="ck"><label for="ck">&nbsp;&nbsp;콜키지 무료</label>
                        <input type="checkbox" id="dt"><label for="dt">&nbsp;&nbsp;드라이브 스루</label>
                        <input type="checkbox" id="an"><label for="an">&nbsp;&nbsp;반려동물 동반</label>
                    </div>
                </div>
            </div>
            <div id="content_2">
                <div id="search-list">
                   
                    <div id="rs-arr">정렬 거리순 평점순 찜꽁많은순</div>
                    <div id="lc-name">강남구</div>
                    <div id="rs-content">
                        <div id="rs-title">
                            <div id="kw-title">강남구 삼겹살 맛집</div>
                            <div id="share-div">
                                <div id="share">공유하기</div>
                                <div id="kakao-icon">
                                    <img src="data:image/png;base64,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">
                                </div>
                                <div id="copy-icon">
                                    
                                </div>
                                <div id="kakao">카카오톡 공유</div>
                                <div id="copy">링크복사</div>
                            </div>
                            <div id="share-btn"><div data-obj-type="group" data-obj-id="9wUZ8" class="" style="position: absolute; left: 1021.13px; top: 339.087px; width: 100px; height: 70px;"><div data-obj-id="3emRF" data-obj-type="element" data-text-editable="true" class="" style="position: absolute; top: 0px; left: 0px; width: 100px; height: 70px;"><div data-text-content="true" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2em; border-radius: 4px; background-color: rgb(243, 156, 18);" class="" spellcheck="false">&nbsp;&nbsp;&nbsp;공유</div></div><div data-obj-id="r2XD6" data-obj-type="icon" class="" style="position: absolute; top: 5.997px; left: 10px; width: 25px; height: 25px; padding-bottom: 5px;"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 48 48" data-svg-content="true" fill="rgb(255, 255, 255)"><path d="M42 6.02H6c-2.21 0-4 1.79-4 4V18h4V9.98h36v28.06H6V30H2v8.02c0 2.21 1.79 3.96 4 3.96h36c2.21 0 4-1.76 4-3.96v-28c0-2.21-1.79-4-4-4zM22 32l8-8-8-8v6H2v4h20v6z"></path></svg></div></div></div>
                            
                        </div>
                        <div id="map"></div>
                        <div id="rest"></div>
                        <div id="moreBtn"></div>   
                    </div>
                </div>

                /* 큰div 비율 */
                #search-list>div{width:100%;}
                #rs-arr{}
                #lc-name{}
                #rs-content{}

                #rs-content>div{width:100%;}
                #rs-title{}
                #map{}
                #rest{}
                #moreBtn{}


                /* 식당정보 타이틀 스타일 */
                #rs-title>div{}
                #kw-title{}
                #share{}
                #share-btn{}


                <div id="rest-rq">
                    <br>
                    <br>
                    <h5 align="center">찾으시는 식당이 없으신가요?</h5>
                    <br><br>
                    <div id="rsrq-btn-div">
                    <button id="rest-rq-btn">맛집 등록 요청하기</button>
                    </div>
                    <br>
                    <p id="rest-rq-p">보통 당일 등록이 이루어지며, 등록시 푸시 알림을 드립니다.</p>
                </div>
            </div>
        </div>

        <script>
            $(function(){
                $("#listBtn").click(function(){
                    const $ul2 = $("#category_list2");

                    if($ul2.css("display") == "none"){
                        // 안보이는 상태 => 보여지게
                        $ul2.slideDown();
                        $("#listBtn").text("접기");
                    }else {
                        // 보이는 상태 => 안보여지게
                        $ul2.slideUp();
                        $("#listBtn").text("펼치기");
                        
                    }
                })
            })
        </script>

    </div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>