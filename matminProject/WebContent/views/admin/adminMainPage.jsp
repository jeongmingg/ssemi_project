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
            width: 100%;
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

<h2>Subscribers List</h2>

<button onclick="showSubscribers()">Show All Subscribers</button>

<table id="subscribersTable">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <!-- Add more columns as needed -->
    </tr>
    <!-- Sample data, replace it with your actual subscriber data -->
    <tr>
        <td>1</td>
        <td>John Doe</td>
        <td>john@example.com</td>
    </tr>
    <tr>
        <td>2</td>
        <td>Jane Smith</td>
        <td>jane@example.com</td>
    </tr>
    <!-- Add more rows as needed -->
</table>

<script>
    function showSubscribers() {
        // Code to fetch and display subscribers
        // You can use AJAX or any other method to fetch data dynamically
        alert("Fetching and showing subscribers...");
    }
</script>

</body>
</body>
</html>