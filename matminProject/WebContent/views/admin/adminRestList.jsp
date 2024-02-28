<%@page import="com.kh.rest.model.vo.Rest"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%ArrayList<Rest> list = (ArrayList<Rest>)request.getAttribute("list"); %>
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

<div id="list1">


	<h2 align="center">Restaurant List</h2>

	<button onclick="showRestaurants()">Show All Restaurants</button>

		
        <table id="restsTable">
            <thead>
                <tr>
                    <th>RestNo</th>
                    <th>Location</th>
                    <th>RestName</th>
                    <th>Category</th>
                    <th>Address</th>
                    <th>PhoneNumber</th>
                    <th>Grade</th>
                </tr>
            </thead>
            <tbody>
                <% if (list != null && !list.isEmpty()) { %>
                    <% for (Rest r : list) { %>
                        <tr>
                            <td><%= r.getRestNo() %></td>
                            <td><%= r.getRestLocalId() %></td>
                            <td><%= r.getRestName() %></td>
                            <td><%= r.getCtgId() %></td>
                            <td><%= r.getRestAddress() %></td>
                            <td><%= r.getRestTel() %></td>
                            <td><%= r.getRestGrade() %></td>
                        </tr>
                    <% } %>
                <% } else { %>
                    <tr>
                        <td colspan="7">No restaurants found</td>
                    </tr>
                <% } %>
                <!-- Add more rows as needed -->
            </tbody>
        </table>



</div>
<script>
    function showRestaurants() {
        // Code to fetch and display subscribers
        // You can use AJAX or any other method to fetch data dynamically
        alert("현재 등록된 식당목록");
    }
</script>

</body>

</html>