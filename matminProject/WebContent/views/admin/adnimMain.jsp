<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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