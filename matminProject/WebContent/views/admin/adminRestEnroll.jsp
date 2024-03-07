
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.common.model.vo.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    	ArrayList<Category> list = (ArrayList)request.getAttribute("list");
    
    %>
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

	select{
	border: 1px solid lightgray;
    height: 27px;
    width: 206px;
    }
    .outer{
	border: 2px solid orange;
	color: orange;
	width: 1100px;
	margin: auto;
	margin-bottom: 50px;
    }
	#enroll-form table{margin:auto;}
	#enroll-form input{margin:10px;}
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
	td input{
	border: 1px solid lightgray;
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
                    <li><a href="<%= contextPath %>/rest.list?cpage=1">식당전체조회</a></li>
                </ul>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="<%= contextPath %>/memList.ad" style="color: orange;font-size: 30px;">Member</a>
                <ul>
                    <li><a href="<%= contextPath %>/memList.ad">회원전체조회</a></li>
                   
                </ul>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="<%= contextPath %>/list.bo?cpage=1" style="color: orange;font-size: 30px;">Board</a>
                <ul>
                    <li><a href="<%= contextPath %>/list.bo?cpage=1">식당 등록/삭제 게시판</a></li>
                    <li><a href="<%= contextPath %>/report.bo"> 신고 게시판</a></li>
                </ul>
            
            </li>
        </ul>
    </div>



    <div class="outer">

        <br>
        <!-- <h2 align="center">식당등록</h2> -->

        <form id="enroll-form" action="<%=contextPath %>/restEnroll.ad" method="post" enctype="multipart/form-data">

            <table>
                <tr>
                    <td> 식당이름</td>
                    <td><input type="text" name="restName" maxlength="20" placeholder="- 식당이름 등록"required></td>
    
                </tr>
                <tr>
                    <td>카티고리</td>
                    <td>
                    	&nbsp;&nbsp;
						<select name="category" id="">
                    	<!--  category table로 부터 조회 할꺼임 -->
                    	<%for (Category c : list) { %>
                    	<option value="<%=c.getCtgId()%>"><%=c.getCtgName() %></option>
                    	<%} %>
                    	</select>
                    
                    </td>
                    
                </tr>
                <tr>
                    <td> 식당주소</td>
                    <td><input type="text" name="address" maxlength="30" placeholder="- 식당주소"required></td>
                   
                </tr>
                <tr>
                    <td> 식당번호</td>
                    <td><input type="text" name="restNo" maxlength="20" placeholder="- 포함해서 입력"required></td>
                   
                </tr>
                <tr>
                    <td>주차여부</td>
                    <td><input type="text" name="status" placeholder="- 'Y' 또는 'N' 입력"></td>
                    
                </tr>

                <tr>
                    <th>첨부파일</th>
                    <td><input type="file" name="upfile" required></td>
                </tr>
                
                <!-- <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;등급</td>
                    <td colspan="2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="grade" id="first" value="1등급">
                        <label for="first">1등급</label>

                        <input type="checkbox" name="grade" id="second" value="2등급">
                        <label for="second">2등급</label>

                        <input type="checkbox" name="grade" id="third" value="3등급">
                        <label for="third">3등급</label>
                        <br>
                        
                    </td>
                </tr> -->
            </table>

            <br><br>

            <div align="center">
                <button type="submit" class="btn btn-success btn-sm">등록하기</button>
				<button type="reset" class="btn btn-info btn-sm" >초기화</button>
				<button type="button" class="btn btn-dark btn-sm" onclick="history.back();">뒤로가기</button>
            </div>

            <br>

        </form>


    </div>
 <%@ include file="../common/footer.jsp" %>

</body>
</html>