<%@page import="com.kh.search.model.vo.Search"%>
<%@page import="com.kh.rest.model.vo.Rest"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String keyword = (String)request.getAttribute("keyword");
	ArrayList<Search> list = (ArrayList<Search>)request.getAttribute("list");
	
	ArrayList<String> addrList = new ArrayList<String>();
	
	if(!list.isEmpty()) {
		for(Search s : list) {
			addrList.add(s.getRestAddress());
		}
	}
	
	request.setAttribute("addrList", addrList);
%>
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
        /* border: 1px solid red; */
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
        height: 2000px;
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
        height: 1960px;
        border: 1px solid #E4910D;
        margin-right: 40px;
        padding: 30px;
    }

    /* 사이드바 비율, 스타일 */
    #content_1>div{width: 100%; margin-bottom: 50px;}
    #category{height: 330px;}
    #location{height: 1150px;}
    #function{height: 170px;}

    /* 사이드바 p 태그 있는 div */
    .content-title{
        display: flex;
        align-items: center;
        height: 50px;
    }

    /* 큰 content */
    #content_2{
        width: 900px;
        height: 1960px;
        border: 1px solid #E4910D;
        padding: 30px;

    }

    #content_2>div{width: 100%;}
    /* 검색결과 div */
    #search-list{height: 1570px; margin-bottom: 30px;}

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

    

    /* 사이드바 카테고리 스타일 */

    #category>div{width: 100%;}
    #category_content{height: 280px;}

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


    /* 사이드바 location 비율 및 스타일 */
    #location>div{width: 100%; float: left;}
    #location_content{height: 1100px;}
    
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

    #function>div{width: 100%;}
    #function_content{height: 120px;}
    #function_content{
        padding-top: 10px;
    }
    #function_content label{
        width: 45%;
        font-size: 18px;
        cursor: pointer;
    }
    
    /* 큰div 비율 */
    #search-list>div{width:100%;}
    #rs-arr{height:50px;}
    #lc-name{height:70px;}
    #rs-content{height:1450px;}

    /* 정렬 비율 및 스타일 */
    #rs-arr>div{height: 100%; float: left;}
    #rs-arr1{width: 80%;}
    #rs-arr2{width: 20%;}
    
    #rs-arr1-ul>li{
        float: left;
        width: 14%;
        height: 100%;
        line-height: 45px;
        list-style: none;
    }

    #rs-arr1-ul a{
        color: rgb(58, 58, 58);
        text-decoration: none;
        font-weight: 800;
    }

    #rs-arr2 a{
        color: rgb(58, 58, 58);
        line-height: 45px;
    }

    /* 지역이름 버튼 스타일 */
    #lc-name{
        display: flex; /* 부모 컨테이너를 플렉스박스로 설정 */
        align-items: center; 
        padding-left: 40px;
        padding-top: 40px;
    }
    #lc-name-btn{
        width: 150px;
        height: 45px;
        background-color: rgb(243, 156, 18);
        color: rgb(255, 255, 255);
        border-radius: 10px;

    }

    #lc-name-btn>a{
        padding-left: 30px;
        color: rgb(255, 255, 255);
        font-size: 20px;
        text-decoration: none;

    }
    /* 검색결과 비율 */
    #rs-content>div{width:100%;}
    #rs-title{height:150px;}
    #map{
        width: 90%;
        height:350px;
        display: flex;
        justify-content: center;
    }
    #search-rest{height:900px; padding-top: 50px;}
    #moreBtn{
        height:50px;
        display: flex;
        justify-content: center;
    }
    
    /* 식당정보 타이틀 스타일*/
    #rs-title>div{height:100%; float:left;}
    #kw-title{width:40%; padding-top: 10px;}

    /* 공유버튼 */
    #share-btn{
        width:20%;
        position: relative;
        display: flex; /* 부모 컨테이너를 플렉스박스로 설정 */
        align-items: center; /* 수직 정렬을 위한 스타일 */
        justify-content: center; /* 수평 정렬을 위한 스타일 */
        padding-top: 11px;
        
    }
    
    /* 공유버튼 */
    #share-btn > .group {
        width: 80px;
        height: 70px;
        position: fixed;
        display: flex; /* 자식 요소를 플렉스박스로 설정 */
        flex-direction: column; /* 자식 요소들을 수직으로 배치 */
        align-items: center; /* 수직 정렬을 위한 스타일 */
        justify-content: center; /* 수평 정렬을 위한 스타일 */
    }

    /* 공유하기 box 비율 및 스타일 */
    #share-div>div{width:100%;}
    #share-div{
        background-color: rgb(240, 240, 240);
        width: 40%;
        border-radius: 10px;
        margin-bottom: 15px;
    }
    #share{
        height:50px;
        line-height: 50px;
        color: rgb(228, 145, 13);
        font-weight: bold;
        font-size: large;
        text-align: center;
        
    }

    #icon{height:100px;}
    #icon>div{height:100px; width:50%; float: left;}
    
    #kw-title-p{

        font-size: 20px;
        font-weight: bold;
        padding-left: 40px;
        line-height: 150px;

    }

    /* 카카오톡 공유 스타일 */
    #kakao-div>div{width:100%;}
    #kakao-icon{
        height:70px;
        display: flex;
        justify-content: center;
        padding-top: 4px;
    }
    #kakao, #copy{
        height:30px;
        font-weight: 500;
        font-size: 16px;
        text-align: center;
    }

    #kakaoImg{
        width:60px; height: 60px;
    }

    /* 링크복사 스타일 */
    #copy-div>div{width:100%;}
    #copy-icon{

        height:70px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #copySvg{
        width:30px; height: 30px;
        cursor: pointer;
    }
    
    /* 공유버튼 스타일 */
    #share-group{
        cursor: pointer;
    }

    /* 맛집리스트테이블 */
    #rest-table{
        /* border: 1px solid blue; */
        width: 750px;
        height: 150px;
    }

    /* 맛집 대표 이미지 */
    .rest-img{
        width: 120px;
        height: 120px;
        border-radius: 10px;
    }

    /* 리뷰별 이미지 */
    #star, #heart{width: 15px; height: 15px;}

    /* 검색결과 더보기 버튼 스타일 */
    #moreBtn>#more-btn{
        width: 80%; height: 100%;
        background-color: rgb(224, 224, 224);
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

    #rest-rq-btn>a{
        text-decoration: none;
        color: rgb(58, 58, 58);
        font-size: 17px;
        font-weight: bold;
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
                <div id="category">
                    <div id="category_title" class="content-title">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 48 48" data-svg-content="true" fill="rgb(230, 126, 34)"><path d="M36 8H12c-2.21 0-4 1.79-4 4v24c0 2.21 1.79 4 4 4h24c2.21 0 4-1.79 4-4V12c0-2.21-1.79-4-4-4zm0 28H12V12h24v24z"></path></svg>
                        <p>카테고리</p>
                    </div>
                    <div id="category_content">
                        <div id="category_list1">
                        <ul>
                            <li><input type="radio" name="category" id="ko"><label for="ko">&nbsp;&nbsp;한식</label></li>
                            <li><input type="radio" name="category" id="ja"><label for="ja">&nbsp;&nbsp;일식</label></li>
                            <li><input type="radio" name="category" id="ch"><label for="ch">&nbsp;&nbsp;중식</label></li>
                            <li><input type="radio" name="category" id="we"><label for="we">&nbsp;&nbsp;양식</label></li>
                            <li><input type="radio" name="category" id="bs"><label for="bs">&nbsp;&nbsp;분식</label></li>
                            <li><input type="radio" name="category" id="cafe"><label for="cafe">&nbsp;&nbsp;카페</label></li>
                        </ul>
                        </div>
                        
                        <div id="category_list2" style="display: none;">
                        <ul>
                            <li><input type="radio" name="category" id="soju"><label for="soju">&nbsp;&nbsp;술집</label></li>
                            <li><input type="radio" name="category" id="fish"><label for="fish">&nbsp;&nbsp;횟집</label></li>
                            <li><input type="radio" name="category" id="meat"><label for="meat">&nbsp;&nbsp;고깃집</label></li>
                            <li><input type="radio" name="category" id="vf"><label for="vf">&nbsp;&nbsp;뷔페</label></li>
                            <li><input type="radio" name="category" id="etc"><label for="etc">&nbsp;&nbsp;기타</label></li>
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
                    <div id="location_content">
                        <button class="ll on" onclick="select();">지역 검색</button>
                            <ul class="location-list" id="location-list">
                                <li><button class="list">강남구</button></li>
                                <li><button class="list">강동구</button></li>
                                <li><button class="list">강북구</button></li>
                                <li><button class="list">강서구</button></li>
                                <li><button class="list">관악구</button></li>
                                <li><button class="list">광진구</button></li>
                                <li><button class="list">구로구</button></li>
                                <li><button class="list">금천구</button></li>
                                <li><button class="list">노원구</button></li>
                                <li><button class="list">도봉구</button></li>
                                <li><button class="list">동대문구</button></li>
                                <li><button class="list">동작구</button></li>
                                <li><button class="list">마포구</button></li>
                                <li><button class="list">서대문구</button></li>
                                <li><button class="list">서초구</button></li>
                                <li><button class="list">성동구</button></li>
                                <li><button class="list">성북구</button></li>
                                <li><button class="list">송파구</button></li>
                                <li><button class="list">양천구</button></li>
                                <li><button class="list">영등포구</button></li>
                                <li><button class="list">용산구</button></li>
                                <li><button class="list">은평구</button></li>
                                <li><button class="list">종로구</button></li>
                                <li><button class="list">중구</button></li>
                                <li><button class="list">중랑구</button></li>
                            </ul>
                    </div>
                </div>
            
                <div id="function">
                    <div id="function_title" class="content-title">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 48 48" data-svg-content="true" fill="rgb(39, 174, 96)"><path d="M36 8H12c-2.21 0-4 1.79-4 4v24c0 2.21 1.79 4 4 4h24c2.21 0 4-1.79 4-4V12c0-2.21-1.79-4-4-4zm0 28H12V12h24v24z"></path></svg>
                        <p>편의기능</p>
                    </div>
                    <div id="function_content">
                        <input type="checkbox" id="pk"><label for="pk">&nbsp;&nbsp;주차</label>
                        <input type="checkbox" id="24"><label for="24">&nbsp;&nbsp;24시</label>
                        <input type="checkbox" id="er"><label for="er">&nbsp;&nbsp;개별룸</label>
                        <input type="checkbox" id="br"><label for="br">&nbsp;&nbsp;대형룸</label>
                        <input type="checkbox" id="dt"><label for="dt">&nbsp;&nbsp;드라이브 스루</label>
                        <input type="checkbox" id="an"><label for="an">&nbsp;&nbsp;반려동물 동반</label>
                    </div>
                </div>
            </div>
            
            <div id="content_2">
                <div id="search-list">
                    <div id="rs-arr">
                        <div id="rs-arr1">
                            <ul id="rs-arr1-ul">
                                <li><a href="#" id="rest-li1">⇅ 정렬</a></li>
                                <li><a href="#" id="rest-li2">거리순</a></li>
                                <li><a href="#" id="rest-li3">평점순</a></li>
                                <li><a href="#" id="rest-li4">찜꽁많은순</a></li>
                            </ul>
                        </div>
                        <div id="rs-arr2">
                            <a href="#">현위치 : 위치없음</a>
                        </div>
                    </div>
                    <div id="lc-name">
                        <button type="button" id="lc-name-btn">
                            강남구
                            <a href="#">x</a>
                        </button>
                        
                    </div>
                    <div id="rs-content">
                        <div id="rs-title">
                            <div id="kw-title">
                                <p id="kw-title-p"><%= keyword %> 검색결과(<%= list.size() %>건)</p>
                            </div>
                            <div id="share-div" style="visibility: hidden;">
                                <div id="share">공유하기</div>
                                <div id="icon">
                                    <div id="kakao-div">
                                        <div id="kakao-icon">
                                            <a href="#">
                                                <img id="kakaoImg" src="resources/logo/kakao-logo.png">
                                            </a>
                                        </div>
                                        <div id="kakao">카카오톡 공유</div> 
                                    </div>
                                    <div id="copy-div">
                                        <div id="copy-icon">
                                            <svg id="copySvg" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32.06999969482422 33.58000183105469" fill="rgb(228, 145, 13)" data-svg-content="true">
                                                <g><path d="M 7.54,15.77c 1.278,1.278, 3.158,1.726, 4.868,1.216L 2.96,7.54C 2.652,7.232, 2.49,6.786, 2.49,6.254 c0-0.88, 0.46-2.004, 1.070-2.614c 0.8-0.8, 2.97-1.686, 3.98-0.682l 9.446,9.448c 0.138-0.462, 0.208-0.942, 0.208-1.422 c0-1.304-0.506-2.526-1.424-3.446L 9.364,1.134C 7.44-0.79, 3.616-0.068, 1.734,1.814C 0.642,2.906-0.036,4.598-0.036,6.23 c0,1.268, 0.416,2.382, 1.17,3.136L 7.54,15.77zM 24.46,16.23c-1.278-1.278-3.158-1.726-4.868-1.216l 9.448,9.448c 0.308,0.308, 0.47,0.752, 0.47,1.286 c0,0.88-0.46,2.004-1.070,2.614c-0.8,0.8-2.97,1.686-3.98,0.682L 15.014,19.594c-0.138,0.462-0.208,0.942-0.208,1.422 c0,1.304, 0.506,2.526, 1.424,3.446l 6.404,6.404c 1.924,1.924, 5.748,1.202, 7.63-0.68c 1.092-1.092, 1.77-2.784, 1.77-4.416 c0-1.268-0.416-2.382-1.17-3.136L 24.46,16.23zM 9.164,9.162C 8.908,9.416, 8.768,9.756, 8.768,10.116s 0.14,0.698, 0.394,0.952l 11.768,11.77 c 0.526,0.524, 1.38,0.524, 1.906,0c 0.256-0.254, 0.394-0.594, 0.394-0.954s-0.14-0.698-0.394-0.952L 11.068,9.162 C 10.544,8.638, 9.688,8.638, 9.164,9.162z"></path></g>
                                            </svg>
                                        </div>
                                        <div id="copy">링크복사</div>
                                    </div>
                                </div>
                                
                            </div>
                            <div id="share-btn">
                                <div id="share-group" data-obj-type="group" data-obj-id="9wUZ8" class="" style="width: 80px; height: 40px;">
                                    <!-- <div data-obj-id="3emRF" data-obj-type="element" data-text-editable="true" class="" style="position: absolute; top: 0px; left: 0px; width: 80px; height: 70px;"> -->
                                        <div data-text-content="true" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.3em; border-radius: 4px; background-color: rgb(243, 156, 18);" class="" spellcheck="false">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 48 48" data-svg-content="true" fill="rgb(255, 255, 255)">
                                                <path d="M42 6.02H6c-2.21 0-4 1.79-4 4V18h4V9.98h36v28.06H6V30H2v8.02c0 2.21 1.79 3.96 4 3.96h36c2.21 0 4-1.76 4-3.96v-28c0-2.21-1.79-4-4-4zM22 32l8-8-8-8v6H2v4h20v6z"></path>
                                            </svg>
                                            &nbsp;&nbsp;공유
                                        </div>
                                    <!-- </div> -->
                                    <!-- <div data-obj-id="r2XD6" data-obj-type="icon" class="" style="position: absolute; top: 3px; left: 4px; width: 25px; height: 25px; padding-bottom: 5px;"> -->
                                        
                                    <!-- </div> -->
                                </div>
                            </div>
                        </div>
                        <div id="map">
                        	<%@ include file="../map/restDetailMap.jsp" %>
                        </div>
                        <div id="search-rest">
                            <table id="rest-table" align="center">
                            	<% if(list.isEmpty()) { %>
	                            	<!-- 게시글이 없는 경우 -->
	                            	<tr>
	                            		<td colspan="3">조회된 결과가 없습니다.  다시 검색해주세요!</td>
	                            	</tr>
                                    <tr>
                                        <td colspan="3"><hr></td>
                                    </tr>
                            	<% }else { %>
	                            	<!-- 게시글이 있는 경우 -->
		                            	<% for(Search s : list) { %>
                                            
			                               <tr>
			                                    <td rowspan="2" width="150" height="80" style="padding-left: 15px; padding-right: 15px; padding-top: 10px; padding-bottom: 10px;"><img class="rest-img" src="<%= s.getRestImgUrl() %>"></td>
			                                    <th colspan="4" width="600" style="padding-top: 15px; padding-left: 15px; font-size: 22px;"> <%= s.getRestName() %></th>
			                               </tr>
			                               <tr>  
			                                    <td colspan="3" style="padding-left: 15px; padding-bottom: 15px; font-size: 20px;"> <img id="star" src="resources/star, heart/star.png">&nbsp;&nbsp;<%= s.getRestAvg() %> (80개)&nbsp;&nbsp;|&nbsp;&nbsp;<img id="heart" src="resources/star, heart/heart.png">&nbsp; <%= s.getHeart() %></td>
			                               </tr>
			                               <tr>
			                                    <td colspan="3" height="45" style="padding-left: 15px; font-size: 15px;"> "여기 진짜 너무 맛있어요!!! 삼겹살하면 돼지삼겹살이져 진짜 꼭가세요~~"</td>
			                               </tr>
                                            <tr>
                                            <td colspan="3"><hr></td>
                                            </tr>
	                               		<% } %>
                             	<% } %>
                            </table>
                        </div>
                        <div id="moreBtn">
                            <button type="button" id="more-btn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 48 48" data-svg-content="true" fill="#000000"><path d="M6 26h4v-4H6v4zm0 8h4v-4H6v4zm0-16h4v-4H6v4zm8 8h28v-4H14v4zm0 8h28v-4H14v4zm0-20v4h28v-4H14z"></path></svg>
                            검색 결과 더보기
                            </button>
                        </div>   
                    </div>
                </div>
                <div id="rest-rq">
                    <br>
                    <br>
                    <h5 align="center">찾으시는 식당이 없으신가요?</h5>
                    <br><br>
                    <div id="rsrq-btn-div">
                    <button id="rest-rq-btn"><a href="<%= contextPath %>/listForm.bo">맛집 등록 요청하기</a></button>
                    </div>
                    <br>
                    <p id="rest-rq-p">보통 당일 등록이 이루어지며, 등록시 푸시 알림을 드립니다.</p>
                </div>
            </div>
        </div>

        <script>
            $(function(){

                // 카테고리 리스트 펼치기 버튼 눌렀을때
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
                });

                // 공유버튼 눌렀을때
                $("#share-group").click(function(){
                    const $shareDiv = $("#share-div");

                    if($shareDiv.css("visibility") == "hidden"){
                   
                        $shareDiv.css("visibility", "visible");
                    }else {
                        $shareDiv.css("visibility", "hidden");
                        
                    }
                });

              
            })
        </script>

    </div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>