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
        height: 1000px;
        margin: 0 auto;
        display: flex;
        justify-content: center;
        margin-bottom: 60px;
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

    #content_1>div{width: 100%;}
    #social{height: 20%;}
    #category{height: 30%;}
    #location{height: 20%;}
    #function{height: 30%;}

    #content_2{
        width: 900px;
        border: 1px solid #E4910D;
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

    #list-Btn button {
        width:85%;
        height: 35px;
        margin: 10px;
        border-radius: 5px;
        cursor: pointer;
    }
</style>
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
                        <div id="list-Btn"><button type="button" id="listBtn">펼치기</button></div>
                    </div>  
                </div>
                <div id="location">
                    <div id="location_title" class="content-title">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 48 48" data-svg-content="true" fill="rgb(241, 196, 15)"><path d="M36 8H12c-2.21 0-4 1.79-4 4v24c0 2.21 1.79 4 4 4h24c2.21 0 4-1.79 4-4V12c0-2.21-1.79-4-4-4zm0 28H12V12h24v24z"></path></svg>
                        <p>지역</p>
                    </div>
                    <div id="location_content">
                        
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