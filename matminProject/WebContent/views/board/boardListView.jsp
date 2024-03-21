<%@page import="com.kh.board.model.vo.Board"%> <%@page
import="java.util.ArrayList"%> <%@page
import="com.kh.common.model.vo.PageInfo"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
 <% PageInfo pi = (PageInfo)request.getAttribute("pi"); 
 	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
 	// 작성번호, 게시판타입, 게시판제목, 작성자닉네임, 게시판조회수, 게시판작성일

 	// 페이징바 변수
 	int currentPage = pi.getCurrentPage();
 	int startPage = pi.getStartPage();
 	int endPage = pi.getEndPage();
 	int maxPage = pi.getMaxPage();
 
 %>

    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="UTF-8" />
        <link rel="stylesheet" href="resources/assets/css/lithium.css" />
        <link
          rel="stylesheet"
          href="resources/assets/fonts/material-icons/material-icons.css"
        />
        <style>
          .outer {
            width: 1500px;
            height: 800px;
            margin: auto;
            margin-top: 50px;
          }
          h3 {
            color: #e4910d;
            border-width: 0 0 2px;
            width: 260px;
            margin: auto;
          }

          .list-area {
            width: 1200px;
            margin: auto;
            height: auto;
            text-align: center;
            border-color: rgb(177, 177, 177);
          }

          .list-area tr {
            border-top: 1.5px solid darkgray;
            border-bottom: 1.5px solid darkgray;
          }

          .list-area th {
            background-color: rgba(231, 231, 231, 0.842);
          }

          .search-area input {
            border: 1px solid gray;
            border-radius: 2px;
            border-width: 0 0 1px;
            outline: none;
          }
          .list-area tr {
            height: 40px;
          }
          .list-area > tbody > tr:hover {
            background-color: rgba(92, 92, 92, 0.342);
            cursor: pointer;
            font-weight: bolder;
          }
          .paging-area button {
            margin: 15px;
          }
        </style>
        <!-- Latest compiled and minified CSS -->
        <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        />

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

        <title>Insert title here</title>
      </head>
      <body>
        <%@ include file="../common/header.jsp" %> <%@ include
        file="../common/navigator.jsp" %>

        <br /><br />

        <div class="outer">
          <h3 align="center" style="font-weight: 700">맛집등록요청 / 삭제</h3>
          <br />
          <div align="right" style="width: 1350px">
            <!-- 검색창-->
            <table class="search-area">
              <tr>
                <td>
                  <input
                    type="text"
                    id="searchKeyWord"
                    placeholder="닉네임을 입력해주세요"
                    height="100%"
                  />
                </td>
                <td><a href="#" class="btn btn-sm btn-secondary" onclick="searchBoardList(1);" onkeyup="enterkey();" >검색</a></td>
              												<!-- 첫페이지를 소환해주기위해 1을 넣어줌 -->
              </tr>
            </table>
          </div>

          <br />

          <!-- 게시판 목록-->
          <table class="list-area" align="center">
            <thead>
              <tr>
                <th width="150">작성번호</th>
                <th width="300">게시판유형</th>
                <th width="350">제목</th>
                <th width="150">작성자</th>
                <th>조회수</th>
                <th>작성일자</th>
              </tr>
            </thead>
            <tbody>
              <% if(list.isEmpty()){ %>
              <!-- 게시글 없을 경우 -->
              <tr>
                <td colspan="6">🔉 존재하는 공지사항이 없습니다<td>
              </tr>
              <% }else{ %>
              <!--  게시글 있을 경우 -->

              <% for(Board b : list) { %>
              <tr>
                <td><%= b.getBoardNo() %></td>
                <td><%= b.getBoardType() %></td>
                <td><%= b.getBoardTitle() %></td>
                <td><%= b.getBoardWriter() %></td>
                <td><%= b.getBoardCount() %></td>
                <td><%= b.getBoardDate() %></td>
              </tr>
              <% } %> <% } %>
            </tbody>
          </table>


          <br />

          <!--  로그인 회원만 창 보이게 지정 -->

          <% if(loginUser != null) { %>
          <div class="insert-area" align="right" style="width: 1350px">
            <a
              href="<%= contextPath %>/listForm.bo"
              class="btn btn-sm btn-secondary"
              >등록</a
            >
          </div>
          <% } %>

          <br /><br />

          <!-- 페이징바-->
          <br /><br />

          <div class="paging-area" align="center">
            <% if(currentPage != 1) { %>
            <button
              onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= currentPage -1 %>'"
            >
              &lt;
            </button>
            <% } %> <% for(int p=startPage; p<=endPage; p++){ %> <% if(p ==
            currentPage){ %>
            <button disabled><%= p %></button>
            <% } else { %>
            <button
              onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= p %>'"
            >
              <%= p %>
            </button>
            <% } %> <% } %> <% if(currentPage != maxPage){ %>
            <button
              onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= currentPage + 1 %>'"
            >
              &gt;
            </button>
            <% } %>
          </div>

          <script>
            $("button").hover(
              function () {
                $(this).css("color", "#e4910d");
              },
              function () {
                $(this).css("color", "");
              }
            );
          </script>

          <!-- 탑버튼 -->
          <div id="topBtn">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink"
              width="45"
              height="45"
              viewBox="0 0 32 32"
              fill="rgb(230, 126, 34)"
              data-svg-content="true"
            >
              <g>
                <path
                  d="M 17,2C 8.716,2, 2,8.716, 2,17S 8.716,32, 17,32S 32,25.284, 32,17S 25.284,2, 17,2z M 23.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0L 18,11.414L 18,27 C 18,27.552, 17.552,28, 17,28S 16,27.552, 16,27L 16,11.414 L 11.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0c-0.39-0.39-0.39-1.024,0-1.414l 6-6C 16.296,8.29, 16.298,8.29, 16.3,8.288 c 0.090-0.088, 0.198-0.162, 0.316-0.21c 0.244-0.102, 0.52-0.102, 0.764,0C 17.504,8.128, 17.614,8.2, 17.708,8.292l 6,6 C 24.098,14.684, 24.098,15.316, 23.708,15.708z"
                ></path>
              </g>
            </svg>
          </div>
        </div>

      </body>
      
      <!-- 엔터시에도 검색가능하도록 제어 -->
      <script>
        $("#searchKeyWord").on("keyup", function(){
            if(window.event.keyCode == 13){
            	searchBoardList(1);
          }
        })
      
    
      </script>

	  
	  <!-- 닉네임 검색을 통한 게시글 조회 기능 -->
      <script>
     
      	function searchBoardList(cpage) {
      		$.ajax({
      			url:"search.bo",
      			data:{keyWord:$("#searchKeyWord").val()
      				, cpage:cpage},
      			success: function(map){
      				//console.log("ajax 통신성공");
      				//console.log(map);
      				
      				let pi = map.pi;
      				let sList = map.sList;
      				
      				
      				//console.log(pi);
      				let currentPage = pi.currentPage;
      				let startPage = pi.startPage;
      				let endPage = pi.endPage;
      				let maxPage = pi.maxPage;
      				let $paging = $(".paging-area");
      				
      				$paging.empty();
      				 let paging = "";
      				
      			     if (currentPage != 1) {
      	                paging += `<button onclick="searchBoardList(\${currentPage - 1})">&lt;</a>`;
      	            }

      	            for (let p = startPage; p <= endPage; p++) {
      	                if (p == currentPage) {
      	                    paging += `<button disabled>\${p}</button>`;
      	                } else {
      	                    paging += `<button onclick="searchBoardList(\${p})">\${p}</a>`;
      	                }
      	            }

      	            if (currentPage != maxPage) {
      	                paging += `<button onclick="searchBoardList(\${currentPage + 1})">&gt;</a>`;
      	            }
      	            $paging.append(paging);


		              if(sList.length === 0 || $("#searchKeyWord").val() === null){ 
		                $(".list-area tbody").html(`<tr><td colspan="6">🔉 존재하는 공지사항이 없습니다</td></tr>`);
		                $paging.empty();
		              } else {
		
		      				let value=""
		
		      				for (let i=0; i<sList.length; i++){
		      				
			      			let s = sList[i];      		
			      				
			    				let sno = s.boardNo;
			    				let stype = s.boardType;
			    				let stitle = s.boardTitle;
			    				let swriter = s.boardWriter;
			    				let scount = s.boardCount;
			    				let sdate = s.boardDate;
			    				
			      				value +=  `<tr>
						      	                <td>\${sno}</td>
						      	                <td>\${stype}</td>
						      	                <td>\${stitle}</td>
						      	                <td>\${swriter}</td>
						      	                <td>\${scount}</td>
						      	                <td>\${sdate}</td>
							      	         </tr>`
			      					
		      				}
		      				$(".list-area tbody").html(value);
		      				
		              }
      				
      			},
      			error: function(){
      				console.log("ajax 통신실패");
      			}
      		});
      	}
      	
 		// 글번호 클릭시 게시글로 이동
      	$(document).on("click", ".list-area tbody tr", function(){
                var boardNo = $(this).find("td:first").text();
                window.location.href = "<%= contextPath %>/detail.bo?bno=" + boardNo;
              });

      </script>
      
      
        <%@ include file="../common/footer.jsp" %>
    </html>
