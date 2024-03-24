<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% Member m = (Member)request.getAttribute("m"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script> -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
    .outer{
    border: 1px solid orange;
    color: orange;
    width: 1100px;
    margin: auto;
    margin-bottom: 50px;
    }
  
    #form input{
    border: 1px solid lightgray;
    margin:10px;}
    button {
    background-color:lightgray; 
    border:1px;
    cursor: pointer;
    }

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
    table{margin:auto;}
    input{margin:10px;}
    
</style>
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
            <a href="<%= contextPath %>/rest.list?cpage=1" class="nav-link " style="color: orange;font-size: 30px;">Restaurants</a>
                <ul>
                    <li><a href="<%= contextPath %>/restEnroll.ad">식당등록</a></li>
                    <li><a href="<%= contextPath %>/rest.list?cpage=1">식당전체조회</a></li>
                </ul>
            </li>
            <li class="nav-item">
            <a class="nav-link active" href="<%= contextPath %>/memList.ad" style="color: orange;font-size: 30px;">Member</a>
                <ul>
                    <li><a href="<%= contextPath %>/memList.ad">회원전체조회</a></li>
                   
                </ul>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="<%= contextPath %>/list.bo" style="color: orange;font-size: 30px;">Board</a>
                <ul>
                    <li><a href="<%= contextPath %>/list.bo?cpage=1">식당 등록/삭제 게시판</a></li>
                </ul>
            
            </li>
        </ul>
    </div>

  
    <div class="outer" style="text-align: center;">
        <br>
         
            <table id="form">
                <tr>
                    <td> 회원이름</td>
                    <td><input type="text" value = <%= m.getMemName() %>></td>
                    <td>가입일자 <input type="text" value = <%= m.getEnrollDate() %>></td>
                    <td>찜꽁 <input type="text">  </td>
                    <td width="70"> <img src="" alt=""></td>
                
                </tr>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" value = <%= m.getMemId() %>></td>
                    <td>가입상태&nbsp;&nbsp;&nbsp;<input type="text" value=<%=m.getMemStatus()%> ></td>
                    <td>공유 <input type="text">  </td>
                </tr>
                <tr>
                    <td> 닉네임</td>
                    <td><input type="text" value = <%= m.getNickname() %>></td>
                    <td>신고 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"></td>
                    <td>경고 <input type="text" value = <%= m.getMemWarning()%> ></td>
                </tr>
                <tr>
                    <td> 이메일</td>
                    <td><input type="text" value = <%= m.getEmail() %>></td>
                    <td></td>
                </tr>
                <tr>
                    <td>거주지</td>
                    <td><input type="text" value = <%= m.getAddress() %>></td>
                                    
                </tr>

            </table>

            <br><br>

            <div align="center">
                <button type="submit" class="btn btn-warning btn-sm">알림보내기</button>
            <button type="submit" class="btn btn-danger btn-sm" >강퇴</button>
            <button type="button" class="btn btn-dark btn-sm" onclick="history.back();">뒤로가기</button>
            </div>

            <br>
 
        
    </div>    
 <%@ include file="../common/footer.jsp" %>

</body>
</html>