<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
       
    /* 전체 구조 비율 */
    #navigator{height: 45px;}

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
</style>
</head>
<body>
    <div class="wrap">
    <div id="navigator">
        <div id="navigator_1"></div>
        <div id="navigator_2">
            <ul id="navi">
                <li><a href="<%= request.getContextPath() %>/list.bo" id="navi1">맛집등록/삭제</a></li>
                <li><a href="#" id="navi2">맛슐랭</a></li>
                <li><a href="#" id="navi3">맛집뺑뺑이</a></li>
            </ul>
        </div>
        <div id="navigator_3"></div>
    </div>

    <script>
        // $("#navi").children().children().mouseenter("color","#E4910D");
        $("#navi a").mouseenter(function(){
            $(this).css("color","#E4910D");
        });

        $("#navi a").mouseout(function(){
            $(this).css("color", "rgb(150, 150, 150)");
        });

    </script>
    </div>
</body>
</html>