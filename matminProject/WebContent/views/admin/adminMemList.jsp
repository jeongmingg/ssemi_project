<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% ArrayList<Member> list=  (ArrayList<Member>)request.getAttribute("list"); %>
    
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
            <a href="<%= contextPath %>/stat.ad" class="nav-link "  style="color: orange; font-size: 30px;" >Statistics</a>
            </li>
            <li class="nav-item">
            <a href="<%= contextPath %>/rest.list?cpage=1" class="nav-link" style="color: orange;font-size: 30px;">Restaurants</a>
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
            <a class="nav-link" href="<%= contextPath %>/list.bo?cpage=1" style="color: orange;font-size: 30px;">Board</a>
                <ul>
                    <li align="center"><a href="<%= contextPath%>/list.bo?cpage=1">식당 등록/삭제 게시판</a></li>
                    <li><a href="<%= contextPath %>/report.bo"> 신고 게시판</a></li>
                </ul>
            
            </li>
        </ul>
    </div>


    <div class="outer">
        <br>
        <h2 align="center">회원목록</h2>
        <br>
        <table class="list-area" align="center">
        	<thead>
	            <tr>
	                <th width="100">회원번호</th>
	                <th width="100">회원아이디</th>
	                <th width="100">회원이름</th>
	                <th width="200">회원닉네임</th>
	                <th width="200">회원경고수</th>
	                <th width="200">회원등록일</th>
	            </tr>
			</thead>
			
			<tbody>
		
				<% if (list != null && !list.isEmpty()) { %>
	            		<% for(Member m : list) { %>
	            
	            <tr>
	                <td><%= m.getMemNo()%></td>
	                <td><%= m.getMemId()%></td>
	                <td><%= m.getMemName()%></td>
	                <td><%= m.getNickname()%></td>
	                <td><%= m.getMemWarning()%></td>
	                <td><%= m.getEnrollDate()%></td>
	            </tr>
	            <% } %>
	            <%}else{ %>
					<tr>
                        <td colspan="7">No member found</td>
                    </tr>
                <% } %>
			</tbody>
        </table>

    </div>

    <script>
        $(function(){
            $(".list-area>tbody>tr").click(function(){
            	var num = $(this).children().eq(1).text();
            location.href= '<%= contextPath%>/member.ad?num='+num;
            });
        });
        

    </script>

    <div align="center">
        <button type="button" class="btn btn-dark" onclick="history.back()">Back</button>
    </div>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>