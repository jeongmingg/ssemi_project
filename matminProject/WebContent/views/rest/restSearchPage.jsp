<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 식당 검색결과 페이지 </title>
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

    }
    
    .content>div{
        height: 100%;
        margin-top: 30px;
       
    }
    #content_1{
        width: 400px;
        border: 1px solid #E4910D;
        border-radius: 80px;
        margin-right: 40px;
        
    }
    #content_2{
        width: 1000px;
        border: 1px solid #E4910D;
        border-radius: 80px;
    }

</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>

    <div class="wrap">
        <div class="content">
            <div id="content_1">
               
            </div>
            <div id="content_2">
    
            </div>
        </div>



    </div>
	
    
	
	
	
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>