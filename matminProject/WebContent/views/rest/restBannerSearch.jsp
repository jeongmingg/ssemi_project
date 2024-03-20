<%@page import="com.kh.rest.model.vo.Rest"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String selectedGrade = (String)request.getAttribute("selectedGrade");
	ArrayList<Rest> list = (ArrayList<Rest>)request.getAttribute("list");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너 검색결과페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
	div{
		box-sizing: border-box;
		/* border: 1px solid red; */
		margin: 0;
		padding: 0;
		display: block;
        }

	.wrap{
		width: 1800px;
		margin: auto;
		box-sizing: border-box;
	}

	#content{
		width: 1300px;
		height: 1600px;
		margin: 0 auto;
		margin-bottom: 50px;
	}

	#content>div{width: 100%;}

	/* 직급선택 div */
	#content_1{
		height: 300px;
		margin-top: 50px;
		margin-bottom: 50px;
		padding: 20px;
	}
	#content_2{
		height: auto;
		
	}

	#content_1>div{width: 100%;}
	#content_1_1{height: 200px;}
	#content_1_2{height: 100px;}

	#content_1_1>div, #content_1_2>div{height: 100%; width: 20%; float: left;}
	
	/* 직급이미지 있는 div */
	#content_1_1>div{
		text-align: center;
		display: flex;
		align-items: center;
    }

	/* 직급 버튼 있는 div */
	#content_1_2>div{
		text-align: center;
		display: flex;
		align-items: center;
    }

	/* 직급 이미지 */
	#content_1_1 img{
		width: 100px;
		height: 100px;
		display: inline-block;
		margin: 0 auto;
		cursor: pointer;
	}

	/* 직급 버튼 */
	#content_1_2 button{
		width: 180px;
		height: 60px;
		background-color: #E4910D;
		color: #fff;
		
		border-radius: 30px;
		font-size: 25px;
		font-weight: 300;
		display: inline-block;
		margin: auto;
		padding-top: 7px;
		padding-bottom: 2px;
    }
	
	/* 밑에큰 div h1100*/
	#content_2{padding: 20px;}
	#content_2>div{height: 100%; float: left;}
	#content_2_1{width: 20%;}
	#content_2_2{
		width: 80%; padding: 20px;
		
			
	}

	#content_2_2>div{width: 100%;}
	#content_2_2_title{
		height: 100px;
		padding-top: 35px;
		padding-left: 30px;
		font-size: 25px;
	}
	#content_2_2_content{
		height: auto;
		padding-top: 100px;
		padding-bottom: 50px;
		padding-left: 30px;
		padding-right: 30px;
		border: 1px solid #E4910D;
		border-radius: 20px;
	}
	
	#content_2_2_content>div{width: 100%;}
	#restList, #restList2{
		height: auto;
		padding-left: 35px;
		padding-top: 50px;
		margin-bottom: 50px;
	}

	#moreBtn{height: 100px;}

	

	/* 왼쪽 지역검색 */
	#content_2_1>div{width: 100%;}
	#content_2_1_title{
		height: 10%;
	}

	#content_2_1_content{
		height: 1000px;
		padding-top: 30px;
	}
	#select-location{
		padding-left: 20px;
		font-size: 20px;
	}
	/* selectBox 스타일*/

	.selectBox * { box-sizing: border-box;}
    .selectBox {
        position: relative;
        width: 250px;
        height: 50px;
        border-radius: 4px;
        border: 2px solid #E4910D;
        /* background: url('https://freepikpsd.com/media/2019/10/down-arrow-icon-png-7-Transparent-Images.png') calc(100% - 7px) center no-repeat; */
        /* background-size: 20px; */
        cursor: pointer;
    }

    .selectBox .label {
        display: flex;
        align-items: center;
        width: inherit;
        height: inherit;
        border: 0 none;
        outline: 0 none;
        padding-left: 15px;
        background: transparent;
        cursor: pointer;
    }

    .selectBox .optionList {
        position: absolute; 
        top: 50px;
        left: 0;
        width: 100%;
        border: none;
        background: #fff;
        color: black;
        list-style-type: none;
        padding: 0;
        border-radius: 6px;
        overflow: hidden;
        max-height: 0;
        transition: .3s ease-in;
    }

    .selectBox .optionList::-webkit-scrollbar {width: 6px;}
    .selectBox .optionList::-webkit-scrollbar-track {background: transparent; }
    .selectBox .optionList::-webkit-scrollbar-thumb {background: #303030; border-radius: 45px;}
    .selectBox .optionList::-webkit-scrollbar-thumb:hover {background: #303030;}

	.selectBox.active .optionList {
    	max-height: 900px;
	}

    .selectBox.active .optionList {
      border: 1px solid #E4910D; /* 지역 선택 시 border 보임 */
    }

    .selectBox .optionItem {
      border-bottom: 1px dashed #E4910D;
      padding: 5px 15px 5px;
      transition: .1s;
    }

    .selectBox .optionItem:hover {
      background: rgb(242, 210, 173);
    }

    .selectBox .optionItem:last-child {
      border-bottom: 0 none;
    }

	.rest-div{margin-right: 20px;}

	/* 식당 이미지 */
	.rest-div img {
		/*max-width:100%; 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
		width: 210px;
		height: 210px;
		
		border-radius: 10px;
	}
	
	/* 식당 이름 스타일 */
	.rest-div figcaption{
		text-align: left; 
		font-weight: 600; font-size: 14px;
		padding-top: 2px;
	}

	#restList>div, #restList2>div{
		height: 250px; width: 250px; 
		float: left;
	}

	#rest-table {
	/* border: 1px solid blue; */
	width: 750px;
	height: 110px;
	
	margin-left: 50px;
	}

	/* 맛집 대표 이미지 */
	.rest-img {
		width: 100px;
		height: 100px;
		border-radius: 10px;
	}

	/* 검색결과 더보기 버튼 스타일 */
	#moreBtn{
		display: flex; justify-content: center;
		padding-top: 15px;	
	}

    #moreBtn>#more-btn{
        width: 800px; height: 60px;
        background-color: rgb(224, 224, 224);
    }

</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>
	
	<div id="content">
		<!-- top 버튼 -->
		<div id="topBtn">
			<a href="#">
			   <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="45" height="45" viewBox="0 0 32 32" fill="rgb(230, 126, 34)" data-svg-content="true">
					<g>
						<path d="M 17,2C 8.716,2, 2,8.716, 2,17S 8.716,32, 17,32S 32,25.284, 32,17S 25.284,2, 17,2z M 23.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0L 18,11.414L 18,27 C 18,27.552, 17.552,28, 17,28S 16,27.552, 16,27L 16,11.414 L 11.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0c-0.39-0.39-0.39-1.024,0-1.414l 6-6C 16.296,8.29, 16.298,8.29, 16.3,8.288 c 0.090-0.088, 0.198-0.162, 0.316-0.21c 0.244-0.102, 0.52-0.102, 0.764,0C 17.504,8.128, 17.614,8.2, 17.708,8.292l 6,6 C 24.098,14.684, 24.098,15.316, 23.708,15.708z"></path>
					</g>
				</svg>
			</a>
		</div>
		
		<div id="content_1">
			<div id="content_1_1">
				<div id="content_1_1_1">
					<img class="banner_1" id="ban_img1" src="resources/banner/rank/KakaoTalk_20240212_182633118_02.png">
				</div>
				<div id="content_1_1_2">
					<img class="banner_2" id="ban_img2" src="resources/banner/rank/KakaoTalk_20240212_182633118_04.png">
				</div>
				<div id="content_1_1_3">
					<img class="banner_3"id="ban_img3" src="resources/banner/rank/KakaoTalk_20240212_182633118.png">
				</div>
				<div id="content_1_1_4">
					<img class="banner_4" id="ban_img4" src="resources/banner/rank/KakaoTalk_20240212_182633118_01.png">
				</div>
				<div id="content_1_1_5">
					<img class="banner_5" id="ban_img5" src="resources/banner/rank/KakaoTalk_20240212_182633118_03.png">
				</div>
			</div>
			<div id="content_1_2">
				<div id="content_1_2_1">
					<button class="bannerBtn" id="ban_btn1">사원</button>
				</div>
				<div id="content_1_2_2">
					<button class="bannerBtn" id="ban_btn2">대리</button>
				</div>
				<div id="content_1_2_3">
					<button class="bannerBtn" id="ban_btn3">과장</button>
				</div>
				<div id="content_1_2_4">
					<button class="bannerBtn" id="ban_btn4">차장</button>
				</div>
				<div id="content_1_2_5">
					<button class="bannerBtn" id="ban_btn5">부장</button>
				</div>
			</div>
		</div>
		<div id="content_2">
			<div id="content_2_1">
				<div id="content_2_1_title">
					
				</div>
				<div id="content_2_1_content">
					<div id="select-location">
						<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 48 48" data-svg-content="true" fill="rgb(241, 196, 15)"><path d="M36 8H12c-2.21 0-4 1.79-4 4v24c0 2.21 1.79 4 4 4h24c2.21 0 4-1.79 4-4V12c0-2.21-1.79-4-4-4zm0 28H12V12h24v24z"></path></svg>
						&nbsp;&nbsp;지역 선택
					</div>
					<div class="box">
						<div class="selectBox">
							<button id="selectOption" class="label" type="button">지역 선택</button>
							<ul class="optionList">
								<li class="optionItem">전체</li>
								<li class="optionItem">강남구</li>
								<li class="optionItem">강동구</li>
								<li class="optionItem">강북구</li>
								<li class="optionItem">강서구</li>
								<li class="optionItem">관악구</li>
								<li class="optionItem">광진구</li>
								<li class="optionItem">구로구</li>
								<li class="optionItem">금천구</li>
								<li class="optionItem">노원구</li>
								<li class="optionItem">도봉구</li>
								<li class="optionItem">동대문구</li>
								<li class="optionItem">동작구</li>
								<li class="optionItem">마포구</li>
								<li class="optionItem">서대문구</li>
								<li class="optionItem">서초구</li>
								<li class="optionItem">성동구</li>
								<li class="optionItem">성북구</li>
								<li class="optionItem">송파구</li>
								<li class="optionItem">양천구</li>
								<li class="optionItem">영등포구</li>
								<li class="optionItem">용산구</li>
								<li class="optionItem">은평구</li>
								<li class="optionItem">종로구</li>
								<li class="optionItem">중구</li>
								<li class="optionItem">중랑구</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div id="content_2_2">
				<div id="content_2_2_title">
				<!-- content.jsp에서 지금 페이지로 넘어왔을때 보이게하는 부분(사원맛집(2곳))-->
					<% String grade = ""; 
					for(Rest r : list) {	
						switch(selectedGrade){ 
							 case "ban_btn1": grade = "사원"; break; 
							 case "ban_btn2": grade = "대리"; break;
							 case "ban_btn3": grade = "과장"; break;
							 case "ban_btn4": grade = "차장"; break; 
							 case "ban_btn5": grade = "부장"; break; 
							 default: grade = "기본값"; break; 
						}
					} %>
						<%= grade %> 맛집 ( <%= list.size() %>곳 )
						
				</div>
				<div id="content_2_2_content">
					<div id="restList">
							<table id="rest-table" align="center">
							<% int count = 0; %>
							<% for(Rest r : list){ %>
							<tr>
								<td rowspan="2" width="120"
									style="padding-left: 15px; padding-right: 15px;"><img
									class="rest-img" src="resources/star, heart/star.png" /></td>
								<td colspan="2"
									style="width: 100px; height: 65px; padding-left: 10px; font-size: 22px;">
									<%= r.getRestName() %>
								</td>
							</tr>
							<tr>
								<td width="85px" style="padding-left: 15px; font-size: 17px">

									<%= r.getLocalName() %>

								</td>
								<td> <%= r.getMenuName() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%= r.getMenuPrice() %>원
								</td>
							</tr>
							<tr>
								<td colspan="3"><hr></td>
							</tr>
							<% count++; %>
							<% } %>
							
						</table>
					</div>
					
				</div>
		</div>
		
		<script>
			
			$(document).ready(function() {
			
				 var selectedGrade = "<%= selectedGrade %>";
			     var locationName = "";
			     
				// 버튼 호버시 금액뜨는 효과
				// 사원 hover style
				$("#ban_btn1").hover(
					// mouseenter
					function () {
						$(this).css({
							"color": "#fff",
							"font-size": "20px"
						}).text("7000원 이하");
					},
					// mouseout
					function () {
						$(this).css({
							"color": "",
							"font-size": "25px",
							"font-weight": 1000
						}).text("사원");
					}
				);
				
				// 대리 hover style
				$("#ban_btn2").hover(
					// mouseenter
					function () {
						$(this).css({
							"color": "#fff",
							"font-size": "19px",
						}).text("7000원 초과 12000원 이하");
					},
					// mouseout
					function () {
						$(this).css({
							"color": "",
							"font-size": "25px",
							"font-weight": 1000
						}).text("대리");
					}
				);

				// 과장 hover style
				$("#ban_btn3").hover(
					// mouseenter
					function () {
						$(this).css({
							"color": "#fff",
							"font-size": "19px"
						}).text("12000원 초과 20000원 이하");
					},
					// mouseout
					function () {
						$(this).css({
							"color": "",
							"font-size": "25px",
							"font-weight": 1000
						}).text("과장");
					}
				);

				// 차장 hover style
				$("#ban_btn4").hover(
					// mouseenter
					function () {
						$(this).css({
							"color": "#fff",
							"font-size": "19px"
						}).text("20000원 초과 35000원 이하");
					},
					// mouseout
					function () {
						$(this).css({
							"color": "",
							"font-size": "25px",
							"font-weight": 1000
						}).text("차장");
					}
				);

				// 부장 hover style
				$("#ban_btn5").hover(
					// mouseenter
					function () {
						$(this).css({
							"color": "#fff",
							"font-size": "20px"
						}).text("35000원 초과");
					},
					// mouseout
					function () {
						$(this).css({
							"color": "",
							"font-size": "25px",
							"font-weight": 1000
						}).text("부장");
					}
				);

				$('.bannerBtn').on('click', function() {
                    // 선택한 버튼의 텍스트 가져오기
                    selectedGrade = $(this).attr('id');

					bannerSelect(selectedGrade);
                });
				
                // 지역 선택
				let label = $(".label");
				let options = $(".optionItem");
				let selectBox = $(".selectBox");
				let optionList = $(".optionList");

				let handleSelect = function(item) {
                    label.text(item.text());
                    label.parent().removeClass("active");
                }

                options.on("click", function() {
                    handleSelect($(this));
                });

                label.on("click", function() {
                    label.parent().toggleClass("active");
                });

                // selectBox 클릭 시 max-height 토글
                selectBox.on("click", function() {
                    optionList.css(
                   		"max-height",
                   		"optionList.css('max-height') === '1000px' ? '' : '1000px'"
             		);
                });

				// 검색결과 더보기 누르면서 무한스크롤

				const restItems = $('.rest-item');
				const moreBtn = $('#more-btn');
				const itemsPerPage = 8;

				// Hide restaurants beyond the first 8
				restItems.slice(itemsPerPage).hide();

				// Handle infinite scroll functionality
				let currentCount = itemsPerPage;

				moreBtn.on('click', function() {
					const hiddenItems = restItems.slice(currentCount, currentCount + itemsPerPage);
					hiddenItems.fadeIn();
					currentCount += itemsPerPage;

					// If all items are shown, hide the '더보기' button
					if (currentCount >= restItems.length) {
						moreBtn.text('조회결과 마지막 식당입니다.').css("color", "black"); // Change the text
                		moreBtn.prop('disabled', true); // Optionally, disable the button
					}
				});

				// 선택된 지역을 저장할 변수 초기화
                var selectedLocation = "";
				
                // 지역 클릭 이벤트 핸들러
                $(".optionItem").on("click", function (e) {
      				let selectedLocation = e.target.innerText;

                  bannerSelect(selectedGrade, selectedLocation);
                });
				
				function bannerSelect(selectedGrade, a){

					
					let selectedLocation = "";
					
					if(!a){ // undef
						selectedLocation = $("#selectOption").text();
					}else{
						selectedLocation = a;
					}
			
               	 	selectedLocation === "지역 선택" ? selectedLocation = "전체" : null;
         	 	
               	 	$.ajax({
	               		 
	               		 url:"bansel.rs",
	               		 type:"get",
	               		 data:{
	               			locationName: selectedLocation,
	               			selectedGrade: selectedGrade
	               		 },
	               		 success: function(result){
	               			updateTable(result, selectedGrade);
						
	               		 },
	               		 error: function(){
	               			console.log("ajax 통신에 실패했습니다.");
	               		 }
	               		  
	               	 });               	 	
				}
					
			});
			
			function updateTable(result, selectedGrade){
					
				var restTable = $("#rest-table");
				restTable.empty();

					var grade = ""
		
                    switch(selectedGrade){ 
					 case "ban_btn1": grade = "사원"; break; 
					 case "ban_btn2": grade = "대리"; break;
					 case "ban_btn3": grade = "과장"; break;
					 case "ban_btn4": grade = "차장"; break; 
					 case "ban_btn5": grade = "부장"; break; 
					 default: grade = "기본값"; break; 
					}

				var title = grade + " 맛집 ( " + result.length + "곳 )";
				$("#content_2_2_title").html(title);

				if(result.length == 0){
					var value = "<tr>"
						+ '<td colspan="3">조회된 결과가 없습니다. </td>'
						+ "</tr>" + "<tr>" + '<td colspan="3"><hr></td>'
						+ "</tr>";
					
					restTable.append(value);
				} else {
					$.each(
						result,
						function(index, restaurant){
							var value = 
								
							 '<tr>'
							+ '<td rowspan="2" width="120" style="padding-left: 15px; padding-right: 15px;">'
							+ '<img class="rest-img" src="resources/star, heart/star.png" /></td>'
							+ '<td colspan="2" style="width: 100px; height: 65px; padding-left: 10px; font-size: 22px;">'
							+ restaurant.restName
							+ '</td>'
							+ '</tr>'
							+ '<tr>'
							+ '<td width="85px" style="padding-left: 15px; font-size: 17px">'
							+ restaurant.localName
							+ '</td>'
							+ '<td>' + restaurant.menuName +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "+ restaurant.menuPrice + '원'
							+ '</td>'
							+ '</tr>'
							+ '<tr>'
							+ '<td colspan="3"><hr></td>'
							+ '</tr>'
							;
					
						restTable.append(value);
					
					});
				}

			}
			
        </script>
		
	</div>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>