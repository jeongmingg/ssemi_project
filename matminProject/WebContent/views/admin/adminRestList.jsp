<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>

	<style>
        table {
            border-collapse: collapse;
            width: 80%;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

      <%@ include file="../common/header.jsp"%>
      <%@ include file="../common/navigator.jsp"%>
  <div id="list1">

    <table style="border: 1px solid gray;">

<h2 align="center">Restaurant List</h2>

<button onclick="showRestaurants()">Show All Restaurants</button>


<table id="subscribersTable">
    <tr>
        <th>RestNo</th>
        <th>RestImg</th>
        <th>RestName</th>
        <th>Category</th>
        <th>Address</th>
        <th>PhoneNumber</th>
        <th>Grade</th>
        

        <!-- Add more columns as needed -->
    </tr>
  
    <tr>
        <td>R1</td>
        <td>대표img</td>
        <td>스즈란테이</td>
        <td>(C3)일식</td>
        <td>서울시 용산구</td>
        <td>02-1234-9874</td>
        <td>2</td>
    </tr>
    <tr>
        <td>R2</td>
        <td>대표img</td>
        <td>한우사랑</td>
        <td>(C1)한식</td>
        <td>서울시 강남구</td>
        <td>02-9874-3214</td>
        <td>1</td>
    </tr>
    <!-- Add more rows as needed -->
</table>

<script>
    function showRestaurans() {
        // Code to fetch and display subscribers
        // You can use AJAX or any other method to fetch data dynamically
        alert("현재 등록된 식당목록");
    }
</script>

</body>
</body>
</html>