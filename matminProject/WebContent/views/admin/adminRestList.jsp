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
            
            .list-area>tbody>tr:hover{
			background-color: rgba(92, 92, 92, 0.342);
	    	cursor:pointer;
			font-weight: bolder;
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
            <a href="<%= contextPath %>/rest.list" class="nav-link active" style="color: orange;font-size: 30px;">Restaurants</a>
                <ul>
                    <li><a href="<%= contextPath %>/restEnroll.ad">식당등록</a></li>
                    <li><a href="<%= contextPath %>/rest.list">식당전체조회</a></li>
                </ul>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="<%= contextPath %>/memList.ad" style="color: orange;font-size: 30px;">Member</a>
                <ul>
                    <li><a href="<%= contextPath %>/memList.ad">회원전체조회</a></li>
                   
                </ul>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="#" style="color: orange;font-size: 30px;">Board</a>
                <ul>
                    <li><a href="">식당 등록/삭제 게시판</a></li>
                    <li><a href=""> 신고 게시판</a></li>
                </ul>
            
            </li>
        </ul>
    </div>


	<div class="outer">
        <br>
        <h2 align="center">식당목록</h2>
        <br>	
        <table id="list-area" align="center">
            <thead>
                <tr>
                    <th width="100">RestNo</th>
                    <th width="100">Location</th>
                    <th width="100">RestName</th>
                    <th width="100"></th>Category</th>
                    <th width="100">Address</th>
                    <th width="100">PhoneNumber</th>
                    <th width="100">Grade</th>
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

<div align="center">
    <button type="button" class="btn btn-dark" onclick="history.back()">Back</button>
</div>
        <%@ include file="../common/footer.jsp" %>
<script>
    function showRestaurants() {
        // Code to fetch and display subscribers
        // You can use AJAX or any other method to fetch data dynamically
        alert("현재 등록된 식당목록");
    }
</script>

</body>

</html>