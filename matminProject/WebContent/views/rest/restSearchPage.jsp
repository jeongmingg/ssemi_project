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
        height: 1700px;
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
        font-size: 18px;
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


    .ll:focus{
        border: 1px solid #9B51E0;
        box-sizing: border-box;
        border-radius: 10px;
        outline: 3px solid #F8E4FF;
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
        background: #F8E4FF;
        width: 184px;
        border-radius: 8px;
        box-sizing: border-box;
        text-align: left;
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
                            <li><input type="radio" name="category" id="rest"><label for="rest">밥집</label></li>
                            <li><input type="radio" name="category" id="cafe"><label for="cafe">카페</label></li>
                            <li><input type="radio" name="category" id="ko"><label for="ko">한식</label></li>
                            <li><input type="radio" name="category" id="ch"><label for="ch">중식</label></li>
                            <li><input type="radio" name="category" id="we"><label for="we">양식</label></li>
                            <li><input type="radio" name="category" id="ja"><label for="ja">일식</label></li>
                        </ul>
                        </div>
                        
                        <div id="category_list2">
                        <ul>
                            <li><input type="radio" name="category" id="bs"><label for="bs">분식</label></li>
                            <li><input type="radio" name="category" id="vf"><label for="vf">뷔페</label></li>
                            <li><input type="radio" name="category" id="soju"><label for="soju">술집</label></li>
                            <li><input type="radio" name="category" id="meat"><label for="meat">고깃집</label></li>
                            <li><input type="radio" name="category" id="fish"><label for="fish">횟집</label></li>
                            <li><input type="radio" name="category" id="ff"><label for="ff">패스트푸드</label></li>
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
                    <div id="function_content"></div>
                </div>
            </div>
            <div id="content_2">
                <div id="search-list">
                   
                    <div class="arrayList"></div>
                    <div class="location-name"></div>
                    <div class="rs-content">


                        
                    </div>
                    <div class=""></div>
                    <div class=""></div>

                </div>
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