<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style>
    
        .outer {
            border: 1px solid orange;
            color: gray;
            width: 700px;
            margin: auto;
            margin-top: 50px;
            margin-bottom: 50px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px; /* Adjusted margin */
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        button {
            display: block;
            margin: auto;
            margin-top: 20px; /* Adjusted margin */
        }
    </style>
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


    <div class="outer">
        <br>
        <h2 align="center">회원목록</h2>
        <br>
        <table class="list-area" align="center">
            <tr>
                <th width="100">회원번호</th>
                <th width="100">회원이름</th>
                <th width="100">회원닉네임</th>
                <th width="200">회원이메일</th>
                <th width="200">회원거주지</th>
            </tr>

            <tr>
                <td>matmin01</td>
                <td>현빈</td>
                <td>현이</td>
                <td>hyun@naver.com</td>
                <td>서울 강남구</td>
            </tr>

            <!-- Add more rows as needed -->

        </table>

        <button align="center">Back</button>
    </div>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>