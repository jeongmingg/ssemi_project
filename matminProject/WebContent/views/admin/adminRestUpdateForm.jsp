<%@page import="com.kh.board.model.vo.ImgFile"%>
<%@page import="com.kh.common.model.vo.Attachment"%>
<%@page import="com.kh.common.model.vo.Location"%>
<%@page import="com.kh.common.model.vo.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.rest.model.vo.Rest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% Rest r = (Rest)request.getAttribute("r");
    ArrayList<Category> list = (ArrayList<Category>)request.getAttribute("list");
    ArrayList<Location> lList = (ArrayList<Location>)request.getAttribute("lList");
    ImgFile img  = (ImgFile)request.getAttribute("img");
    ArrayList<Rest> menuList = (ArrayList<Rest>)request.getAttribute("menuList");
    
    String mainMenuName = "";
    String mainMenuPrice = "";
    
    for(int i = 0; i < menuList.size(); i++) {
    	// 대표 메뉴
    	if(menuList.get(i).getRepMenu().equals("Y")) {
    		mainMenuName = menuList.get(i).getMenuName();
    		mainMenuPrice = menuList.get(i).getMenuPrice();
    		
    		menuList.remove(i);
    		
    		break;
    	}
    }
    
    String sideMenuName1 = "";
    String sideMenuPrice1 = "";
    String sideMenuName2 = "";
    String sideMenuPrice2 = "";
    
    for(int i = 0; i < menuList.size(); i++) {
    	if(i == 0) {
    		sideMenuName1 = menuList.get(i).getMenuName();
    		sideMenuPrice1 = menuList.get(i).getMenuPrice();
    	} else if(i == 1) {
    		sideMenuName2 = menuList.get(i).getMenuName();
    		sideMenuPrice2 = menuList.get(i).getMenuPrice();
    	}
    }
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
    select {
    border: 1px solid lightgray;
    height: 27px;
    width: 206px;
    }
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
        <form id="form" action="<%=contextPath %>/updateRest.ad" method="post" enctype ="multipart/form-data">
			<input type="hidden" name="num" value="<%= r.getRestNo() %>">
            <table>
                <tr>
                    <td> 식당이름</td>
                    <td><input type="text" name="restName" value= "<%= r.getRestName() %>" ></td>
                    <td>대표메뉴 입력&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" name="menuName1" value= "<%= mainMenuName %>" required placeholder="필수 입력"></td>
                    <td></td>
                </tr>
                <tr>
                    <td> 영업시간</td>
                    <td><input type="text" name="bizHour" value= "<%= r.getRestTime() %>"></td>
                    <td>대표메뉴가격 입력<input type="number" name = "menuPrice1" value="<%= mainMenuPrice %>" required placeholder="필수 입력"></td>
                </tr>
                <tr>
                    <td> 식당주소</td>
                    <td><input type="text" name="address" value= "<%= r.getRestAddress() %>"></td>
                    <td>추가메뉴 입력&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" name="menuName2" value= "<%= sideMenuName1 %>"></td>
                    <td></td>
                </tr>
                <tr>
                    <td> 로케이션</td>
                    <td>&nbsp;&nbsp; <select name="location" id="">
							<!--  category table로 부터 조회 할꺼임 -->
							<%for (Location l : lList) { %>
							<option value="<%=l.getLocalId()%>">
								<%=l.getLocalName()%>
							</option>
							<%} %>
					</select>
					</td>
                    <td>가격 입력&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="number" name = "menuPrice2" value="<%= sideMenuPrice1 %>"></td>
                    
                </tr>
                <tr>
                    <td> 식당전화번호</td>
                    <td><input type="text" name="phone" value= "<%= r.getRestTel() %>"></td>
                    <td>추가메뉴 입력&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" name="menuName3" value= "<%= sideMenuName2 %>"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>카테고리</td>
                    <td>&nbsp;&nbsp; <select name="category" id="">
							<!--  category table로 부터 조회 할꺼임 -->
							<%for (Category c : list) { %>
							<option value="<%=c.getCtgId()%>"><%=c.getCtgName()%></option>
							<%} %>
					</select>
					</td>
                    <td>가격 입력&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="number" name = "menuPrice3" value="<%= sideMenuPrice2 %>"></td>               
                </tr>
                <br><br>
  
                <tr>
						<th height="0">사진</th>
						
						<td colspan="4">	
						<% if (r.getRestImgUrl() != null){ %>
								<label>
									<input type="file" id="originFileNo" name="upfile" class="btnOfInput" style="display: none;">
									<span class="file_name">
										<a class="file" href="<%= r.getRestImgUrl()%>" >대표이미지 확인하기</a>							
									</span>
									<span class="file_btn">파일선택</span>
								</label>
						<% } else { %>
								<label>
									<input type="file" id="file" name="upfile" class="btnOfInput" multiple style="display: none;">
									<span class="file_name">파일을 선택해주세요</span>
									<span class="file_btn">파일선택</span>
								</label>
						</td>
						<% } %>
					</tr>
                
                <tr>
				    <td>&nbsp;&nbsp;기타여부</td>
				    <td colspan="2">
				        <input type="checkbox" name="parking" id="parking" value="Y" <% if ("Y".equals(r.getRestParking())) { %> checked <% } %> />
				        <label for="parking">주차</label>
				        
				        <input type="checkbox" name="dt" id="dt" value="Y" <% if ("Y".equals(r.getDt())) { %> checked <% } %> /> 
				        <label for="dt">DT</label> 
				        
				        <input type="checkbox" name="conAnimal" id="comAnimal" value="Y" <% if ("Y".equals(r.getAnmial())) { %> checked <% } %> /> 
				        <label for="conAnimal">반려동물</label> 
				        
				        <input type="checkbox" name="prvRoom" id="prvRoom" value="Y" <% if ("Y".equals(r.getRoom())) { %> checked <% } %> /> 
				        <label for="prvRoom">개별룸</label> 
				        
				        <input type="checkbox" name="bigRoom" id="bigRoom" value="Y" <% if ("Y".equals(r.getBigRoom())) { %> checked <% } %> /> 
				        <label for="bigRoom">대형룸</label> <br />
				    </td>
				</tr>

            </table>

            <br><br>

            <div align="center">
                <button type="submit" class="btn btn-sm btn-warning" id="btn-update">수정</button>
				<a href="<%= contextPath %>/rest.ad?num=<%= r.getRestNo() %>" class="btn btn-sm btn-secondary">취소</a>
				<!-- <button type="button" class="btn btn-dark btn-sm" onclick="history.back();">뒤로가기</button> -->
            </div>
            
         
            <br>

        </form>
        
           <script>
		
		$(function() {
			 $("input[type=file]").on("change", function() {
			        const fileName = $(this).val().split("\\").pop();
			        $(this).siblings(".file_name").text(fileName || "파일을 선택해주세요.");
		 	});
			 
				let location = document.querySelector("select[name=location]").options;
				for (let i=0; i<location.length; i++) {
				    if (location[i].label == '<%= r.getLocalName() %>'){
				    	location[i].selected = true;
				    }
				}
				
				let category = document.querySelector("select[name=category]").options;
				for (let i=0; i<category.length; i++) {
					console.log(category[i].innerText)
				    if (category[i].innerText == '<%= r.getCtgName() %>'){
				    	category[i].selected = true;
				    }
				}
		});
		
	
		
		
		</script>
        
    


    </div>
 <%@ include file="../common/footer.jsp" %>

</body>
</html>