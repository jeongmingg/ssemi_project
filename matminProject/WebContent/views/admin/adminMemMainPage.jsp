<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</titl>

<head>
    <title>main page</title>
 
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script> -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> -->
</head>
<body>
    <%@ include file="../common/header.jsp" %>
    <%@ include file="../common/navigator.jsp" %>

    <div class="container">
        <!-- <p>Justified tabs:</p> -->
        <br><br>
        <ul class="nav nav-tabs nav-justified">
            <li class="nav-item" >
            <a class="nav-link active" style="color: orange; font-size: 30px;" >Statistics</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color: orange;font-size: 30px;">Restaurants</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color: orange;font-size: 30px;">Member</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color: orange;font-size: 30px;">Board</a>
            </li>
        </ul>
    </div>

</body>
</html>
