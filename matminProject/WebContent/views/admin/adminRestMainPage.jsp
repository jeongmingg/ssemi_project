<%@page import="com.kh.board.model.vo.ImgFile"%>
<%@page import="com.kh.rest.model.vo.Rest"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% Rest r = (Rest)request.getAttribute("r");
    ImgFile img = (ImgFile)request.getAttribute("img"); 
    	System.out.println("메인페이지" + r);
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

    .outer{
        border: 1px solid orange;
        color: orange;
        width: 1100px;
        margin: auto;
        margin-bottom: 50px;
    }
        #form table{margin:auto;}
        #form input{ 
        border: 1px solid lightgray;
        margin:10px;}
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

        <div id="images">
            <img src="" alt="">
            <img src="" alt="">
            <img src="" alt="">
        </div>
        
        <!-- <h2 align="center">식당등록</h2> -->
        <div>
        <form id="form" action="<%=contextPath %>/updateForm.rs" method="post">

            <table>
                <tr>
                    <td> 식당이름</td>
                    <td><input type="text" value= "<%= r.getRestName() %>" readonly ></td>
                    <td>별점 <input type="text" value= "<%= r.getHeart() %>" readonly></td>
                </tr>
                <tr>
                    <td> 영업시간</td>
                    <td><input type="text" value= "<%= r.getRestTime() %>" readonly></td>
                    <td>찜꽁<input type="text" value = "<%= r.getReviewCount() %>" readonly></td>
                </tr>
                <tr>
                    <td> 식당주소</td>
                    <td><input type="text" value= "<%= r.getRestAddress() %>"readonly></td>
                    <td>등급 <input type="text" value= "<%= r.getRestGrade() %>" readonly></td>
                </tr>
                <tr>
                    <td> 로케이션</td>
                    <td><input type="text" value= "<%= r.getLocalName() %>"readonly></td>
                    
                </tr>
                <tr>
                    <td> 식당전화번호</td>
                    <td><input type="text" value= "<%= r.getRestTel() %>" readonly></td>
                    <td></td>
                </tr>
					<tr>
						<td>카테고리</td>
						<td><input type="text" value="<%=r.getCtgName()%>" readonly></td>

					</tr>

					<tr>
						<th height="0">사진</th>
						<td></td>
						<td colspan="3">
							<%if (img == null) {%>
							<div class="file-area">
								<span>첨부파일이 없습니다</span>
								<%} else {%>
								<a class="uploadFile"
									download="<%=contextPath%>/<%=img.getImgFilePath() + img.getImgChangeName()%>"><%=img.getImgOriginName()%></a>
							</div>
						</td>
						<%}%>
					</tr>
<tr>
    <td>&nbsp;&nbsp;기타여부</td>
    <td colspan="2">
        <input type="checkbox" name="parking" id="parking" value="Y" <% if ("Y".equals(r.getRestParking())) { %> checked readonly<% } %> />
        <label for="parking">주차</label>
        
        <input type="checkbox" name="dt" id="dt" value="Y" <% if ("Y".equals(r.getDt())) { %> checked  readonly<% } %> /> 
        <label for="dt">DT</label> 
        
        <input type="checkbox" name="pet_friendly" id="pet_friendly" value="Y" <% if ("Y".equals(r.getAnmial())) { %> checked readonly <% } %> /> 
        <label for="pet_friendly">반려동물</label> 
        
        <input type="checkbox" name="private_room" id="private_room" value="Y" <% if ("Y".equals(r.getRoom())) { %> checked <% } %> /> 
        <label for="private_room">개별룸</label> 
        
        <input type="checkbox" name="big_room" id="big_room" value="Y" <% if ("Y".equals(r.getBigRoom())) { %> checked <% } %> /> 
        <label for="big_room">대형룸</label> <br />
    </td>
</tr>


				</table>

            <br><br>

            <div align="center">
                <a href="<%= contextPath %>/updateForm.rs?rno=<%= r.getRestNo() %>" class="btn btn-sm btn-warning">수정</a>
				<a href="<%= contextPath %>/delete.rs?rno=<%= r.getRestNo() %>" class="btn btn-sm btn-danger">삭제</a>
				<button type="button" class="btn btn-dark btn-sm" onclick="history.back();">뒤로가기</button>
            </div>

            <br>

        </form>
    


    </div>
 <%@ include file="../common/footer.jsp" %>

</body>
</html>