
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.getAttribute("restCount"); 
request.getAttribute("nameCount");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .outer {
            border: 1px solid orange;
            color: gray;
            width: 1100px;
            margin: auto;
            margin-bottom: 50px;
        }
        #best2 {
            text-align: center;
        }   

        .table1 {
          text-align: center;
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px; /* Adjusted margin */
        }

      #navi{
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
  </head>
<body>

    <%@ include file="../common/header.jsp" %>
    <%@ include file="../common/navigator.jsp" %>
    
    <% if (loginUser != null && loginUser.getMemNo().equals("M1")) { %>

    <div class="container" width="82%">
      <ul id="navi" class="nav nav-tabs nav-justified">
        <li class="nav-item">
          <a
          href="<%= contextPath %>/stat.ad"
          class="nav-link active"
          style="color: orange; font-size: 30px"
          >Statistics</a
          >
        </li>
        <li class="nav-item">
          <a
          href="<%= contextPath %>/rest.list?cpage=1"
          class="nav-link"
          style="color: orange; font-size: 30px"
          >Restaurants</a
          >
          <ul>
            <li><a href="<%= contextPath %>/restEnroll.ad">식당등록</a></li>
            <!-- <li><a href="<%= contextPath %>/rest.list?cpage=1">식당전체조회</a></li> -->
          </ul>
        </li>
        <li class="nav-item">
          <a
          class="nav-link"
          href="<%= contextPath %>/memList.ad"
          style="color: orange; font-size: 30px"
          >Member</a
          >
          <ul>
            <li align="center">
              <a href="<%= contextPath %>/memList.ad">회원전체조회</a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a
          class="nav-link"
          href="<%= contextPath %>/list.bo?cpage=1"
          style="color: orange; font-size: 30px"
          >Board</a
          >
          <ul>
            <li align="center">
              <a href="<%= contextPath%>/list.bo?cpage=1"
                >식당 등록/삭제 게시판</a
                >
              </li>
            </ul>
          </li>
      </ul>
    </div>
    <br><br><br>
<div class=" outer">
    <div class="table1">
      <table class="table table-bordered" align="center">
        <tr>
          <th width="200" style=" background-color: #f2f2f2;">총 등록 식당 수</th>
          <th width="200" style=" background-color: #f2f2f2;">총 회원 수</th>
        </tr>

        <tr>
          <th><%= request.getAttribute("restCount") %>개</th>
          <th><%= request.getAttribute("memCount") %>명</th>
        </tr>
 
      </table>
    </div>

    <div id="best2" style="margin: auto;">
      <table class="table table-bordered">
        <tr>
          <th style=" background-color: #f2f2f2;">순위</th>
          <th style=" background-color: #f2f2f2;">식당명</th>
          <th style=" background-color: #f2f2f2;">리뷰수</th>
          <th style=" background-color: #f2f2f2;">찜꽁수</th>
          <th style=" background-color: #f2f2f2;">공유수</th>
        </tr>
        <tr>
          <th>1</th>
          <th>스즈란테이</th>
          <th>100</th>
          <th>700</th>
          <th>50</th>
        </tr>
        <tr>
          <th>2</th>
          <th>한우사랑</th>
          <th>90</th>
          <th>603</th>
          <th>45</th>
        </tr>
        <tr>
          <th>3</th>
          <th>돈까스</th>
          <th>87</th>
          <th>600</th>
          <th>43</th>
        </tr>
        <tr>
            <th>4</th>
          <th>신라마라탕</th>
          <th>79</th>
          <th>589</th>
          <th>37</th>
        </tr>

        <tr>
          <th>5</th>
          <th>온기정</th>
          <th>72</th>
          <th>550</th>
          <th>35</th>
        </tr>
      </table>
    </div>
  </div>

   <% } else { %>
        <h2>관리자만 볼수 있는 페이지입니다.</h2>
        <% } %>
   <%@ include file="../common/footer.jsp"%>
      
  </body>
</html>