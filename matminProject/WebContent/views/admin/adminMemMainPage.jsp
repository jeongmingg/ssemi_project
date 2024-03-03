<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminRestMainPage</title>

<style>
#navi {
            list-style-type: none;
            max-width: 1200px;
            margin: 0;
            height: 100%;
        }

        #navi > li > a {
            color: orange;
            font-size: 16px;
            position: relative;
            display: block;
            padding: 15px;
        }

        #navi > li > ul {
            list-style-type: none;
            padding: 0;
            display: none;
            position: absolute;
            text-align: center;
            z-index: 1;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        #navi > li > ul a {
            font-size: 15px;
            color: orange;
            display: block;
            padding: 10px;
            transition: all 0.3s;
        }

        #navi > li > ul a:hover {
            background-color: lightgray;
            color: orange;
            text-decoration: none;
        }

        #navi > li:hover > ul {
            display: block;
            opacity: 1;
        }

</style>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script> -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> -->
</head>
<body>

  <%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>
    
  <div class="container" width="82%">
    <!-- <p>Justified tabs:</p> -->
    <br><br>
    <ul id="navi" class="nav nav-tabs nav-justified">
        <li class="nav-item" >
        <a href="<%= contextPath %>/stat.ad" class=" nav-link"  style="color: orange; font-size: 30px;" >Statistics</a>
        </li>
        <li class="nav-item">
        <a href="<%= contextPath %>/rest.list" class="nav-link" style="color: orange;font-size: 30px;">Restaurants</a>
            <ul>
                <li><a href="<%= contextPath %>/restEnroll.ad">식당등록</a></li>
                <li><a href="<%= contextPath %>/rest.list">식당전체조회</a></li>
            </ul>
        </li>
        <li class="nav-item">
        <a class="nav-link active" href="<%= contextPath %>/memList.ad" style="color: orange;font-size: 30px;">Member</a>
            <ul>
                <li><a href="<%= contextPath %>/memList.ad">회원전체조회</a></li>
               
            </ul>
        </li>
        <li class="nav-item">
        <a class="nav-link" href="<%=contextPath%>/list.bo %>" style="color: orange;font-size: 30px;">Board</a>
            <ul>
                <li><a href="<%=contextPath%>/list.bo">식당 등록/삭제 게시판</a></li>
                <li><a href="<%=contextPath%>/report.bo"> 신고 게시판</a></li>
            </ul>
        
        </li>
    </ul>
</div>

</body>
</html>