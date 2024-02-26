<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸터바</title>
<style>
   
    /* 전체 구조 비율 */
    #footer{height: 120px;}

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