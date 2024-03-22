<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@page import="com.kh.rest.model.vo.Rest"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    PageInfo pi = (PageInfo)request.getAttribute("pi");
    ArrayList<Rest> list = (ArrayList<Rest>)request.getAttribute("list"); 

    //페이징바 변수
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();


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
            <a href="<%= contextPath %>/rest.list?cpage=1" class="nav-link active" style="color: orange;font-size: 30px;">Restaurants</a>
                <ul>
                    <li><a href="<%= contextPath %>/restEnroll.ad">식당등록</a></li>
                </ul>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="<%= contextPath %>/memList.ad" style="color: orange;font-size: 30px;">Member</a>
                <ul>
                    <li><a href="<%= contextPath %>/memList.ad">회원전체조회</a></li>
                   
                </ul>
            </li>
            <li class="nav-item">
        <a class="nav-link" href="<%=contextPath%>/list.bo?cpage=1" style="color: orange;font-size: 30px;">Board</a>
            <ul>
                <li><a href="<%=contextPath%>/list.bo?cpage=1">식당 등록/삭제 게시판</a></li>
                <li><a href="<%=contextPath%>/report.bo"> 신고 게시판</a></li>
            </ul>
        
        </li>

        </ul>
    </div>


	<div class="outer">
        <br>
        <h2 align="center">식당목록</h2>
        <br>	
        <table class="list-area" align="center">
            <thead>
                <tr>
                    <th >RestNo</th>
                    <th >Location</th>
                    <th >RestName</th>
                    <th >Category</th>
                    <th >Address</th>
                    <th >PhoneNumber</th>
                    <th >RestAvgRate</th>
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
	    $(function(){
	        $(".list-area>tbody>tr").click(function(){
	            //const num = $(this).children().eq(0).text(); 아래와 같은 코드 
	            location.href= '<%=contextPath%>/rest.ad?num='+ $(this).children().eq(0).text();
	        })
	    })
	    
	    function showRestaurants() {
	        // Code to fetch and display subscribers
	        // You can use AJAX or any other method to fetch data dynamically
	        alert("현재 등록된 식당목록");
	    }
	</script>

    <div class="paging-area" align="center">
        
        <% if(currentPage != 1) {%>

        <button onclick="location.href='<%=contextPath%>/rest.list?cpage=<%= currentPage-1%>'"> &lt; </button>
        <%} %>
        <% for (int p=startPage; p<=endPage; p++) { %>
            <% if(p == currentPage) { %>
                  <button disabled><%= p %></button>
                <% }else{ %>
                    <button onclick="location.href='<%=contextPath%>/rest.list?cpage=<%=p%>'"><%= p %></button>
            <%} %>
        <%} %>
        
        <% if(currentPage != maxPage) { %>
        <button onclick="location.href='<%=contextPath%>/rest.list?cpage=<%= currentPage+1%>'"> &gt; </button>
        <%} %>
    </div>


<!-- <div align="center">
    <button type="button" class="btn btn-dark" onclick="history.back()">Back</button>
</div> -->
        <%@ include file="../common/footer.jsp" %>


	
</body>

</html>