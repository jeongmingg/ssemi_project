<%@page import="com.kh.rest.model.vo.Rest"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctgName = (String)request.getAttribute("ctgName");
	ArrayList<Rest> list = (ArrayList<Rest>)request.getAttribute("list");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집뺑뺑이</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>

	div{
        box-sizing: border-box;
        /* border: 1px solid red; */
        margin: 0;
        padding: 0;
        display: block;
        }

    .main-content{
        width: 1800px;
        margin: auto;
        box-sizing: border-box;
    }

	#content{
		width: 1300px;
		margin: 0 auto;
	}

	/* 전체 div 비율 */
	#content>div{width: 100%;}
	#menu-recom{height: 950px;}
	#rest-recom{height: 300px;}
	
	
	/* 메뉴추천 div 비율 및 스타일 */
	#menu-recom>div{width: 100%;}
	#positionImg-div{
		height: 100px;
		display: flex;
		justify-content: center;
		margin-top: 100px;
	}
	#positionMent-div{height: 150px;}
	#menu-recom-div{height: 350px;}
	#category{height: 200px;}
	#menu-recom-btn{height: 100px;}


	/* 위치이미지 스타일 div h100 */
	#positioinImg{
		width: 90px;
		height: 90px;
	}

	/* 오늘뭐먹지 p 멘트 스타일 div h150*/
	#positionMent-div>p{
		text-align: center;
		font-size: 18px;
		padding-top: 10px;
	}

	/* 옵션선택 멘트 스타일 div h350 */
	/* menu-P를 감싼 div */
	#menu-p-div{
		display: flex;
		justify-content: center;
	}

	/* p감싼 div */
	#menu-p{
		background-color: rgb(244, 244, 244);
		width: 750px;
		height: 300px;
		display: flex;
		justify-content: center;
		border-radius: 20px;
		padding-top: 50px;
	}

	/* 옵션선택 p 멘트 스타일 div h350*/
	#menu-p>p{
		text-align: center;
		font-size: 23px;
		line-height: 40px;
		display: block;
		margin-top: 30px;
	}

	/* category div 스타일 h200 */
	#category{
		display: flex;
		justify-content: center;
		text-align: center;
		margin-top: 10px;
		padding-top: 50px;
	}

	.ctg{
		cursor: pointer;
	}

	label.ctg{
		width: 100%;
		height: 100%;
		border-radius: 20px;
		margin: 0;
	}

	/* 카테고리, 라디오 div */
	.radioBtn{
		width: 90px;
		height: 45px;
		background-color: rgb(224, 224, 224);
		border-radius: 20px;
		margin: 12px;
		cursor: pointer;
		font-size: 18px;
		line-height: 45px;
	}


	/* 라디오버튼 */
	.radioBtn>input{
		opacity: 0;
		position: absolute;
	}

	/* 버튼 눌렀을때 색바뀜 */
    .checked {
      background-color: #E4910D;
    }

	/* 맛집추천버튼 div */
	#rs-recom-btn{
		display: flex;
		justify-content: center;
	}

	/* 맛집추천 버튼 */
	#rs-btn{
		width: 250px;
		height: 50px;
		background-color: rgb(243, 156, 18);
		color: white;
		text-align: center;
		padding-top: 12px;
		border-radius: 15px;
		cursor:pointer;
	}

	#rsBtn{font-size: 22px;}

	/* 식당 이미지 스타일 */
	.rest-img{
		width: 180px;
		height: 180px;
		margin-bottom: 10px;
		border-radius: 15px;
		cursor: pointer;
	}

	.rest-img+figcaption{
		text-align: center;
		font-size: 20px;
	}

	#img1{
	width: 180px; height: 180px;
	border-radius : 10px;
	}
	
	
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>
	
	<div id="content">
		<div id="topBtn">
	         <a href="#">
	            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="45" height="45" viewBox="0 0 32 32" fill="rgb(230, 126, 34)" data-svg-content="true">
	                 <g>
	                     <path d="M 17,2C 8.716,2, 2,8.716, 2,17S 8.716,32, 17,32S 32,25.284, 32,17S 25.284,2, 17,2z M 23.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0L 18,11.414L 18,27 C 18,27.552, 17.552,28, 17,28S 16,27.552, 16,27L 16,11.414 L 11.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0c-0.39-0.39-0.39-1.024,0-1.414l 6-6C 16.296,8.29, 16.298,8.29, 16.3,8.288 c 0.090-0.088, 0.198-0.162, 0.316-0.21c 0.244-0.102, 0.52-0.102, 0.764,0C 17.504,8.128, 17.614,8.2, 17.708,8.292l 6,6 C 24.098,14.684, 24.098,15.316, 23.708,15.708z"></path>
	                 </g>
	             </svg>
	         </a>
	      </div>
		<div id="menu-recom">
			
			<div id="positionImg-div">
				<img id="positioinImg" src="resources/bbaeng/location.png">
			</div>
			<div id="positionMent-div">
				<p>오늘 뭐먹지?!</p>
				<p>맛집 뺑뺑이가 추천해 드릴게요!</p>
			</div>
			<div id="menu-p-div">
				<div id="menu-p">
					<p>옵션을 선택하고 <br><br>
					"맛집 추천" 버튼을 눌러주세요!</p>
					
				</div>
			</div>
			<div id="category">
				<div class="radioBtn">
					<label class="ctg" for="allNation">전체</label>
					<input class="ctg" id="allNation" type="radio" checked="" name="nation">
				</div>
				<div class="radioBtn">
					<label class="ctg" for="ko">한식</label>
					<input class="ctg" id="ko" type="radio" name="nation">
				</div>
				<div class="radioBtn">
					<label class="ctg" for="ch">중식</label>
					<input class="ctg" id="ch" type="radio" name="nation">
				</div>
				<div class="radioBtn">
					<label class="ctg" for="ja">일식</label>
					<input class="ctg" id="ja" type="radio" name="nation">
				</div>
				<div class="radioBtn">
					<label class="ctg" for="we">양식</label>
					<input class="ctg" id="we" type="radio" name="nation">
				</div>
			</div>
			<div id="rs-recom-btn">
				<div id="rs-btn" onclick="rsRecommend();">
					<button id="rsBtn">맛집&nbsp;&nbsp;&nbsp;추천</button>
				</div>
			</div>
			
			<script>
			var obTimeOut; // clearTimeout() 함수를 이용하여 Timeout 을 취소하기위해 사용됨
			
			var ObjectArray = [
			"resources/restIcon2/1.png",
			"resources/restIcon2/30.png",
			"resources/restIcon2/23.png",
			"resources/restIcon2/5.png",
			"resources/restIcon2/25.png",
			"resources/restIcon2/29.png",
			"resources/restIcon2/4.png",
			"resources/restIcon2/3.png",
			"resources/restIcon2/21.png",
			"resources/restIcon2/27.png",
			"resources/restIcon2/22.png",
			"resources/restIcon2/6.png",
			"resources/restIcon2/31.png",
			"resources/restIcon2/2.png",
			"resources/restIcon2/26.png",
			"resources/restIcon2/24.png",
			"resources/restIcon2/28.png",
			"resources/restIcon2/1.png",
			"resources/restIcon2/30.png",
			"resources/restIcon2/23.png",
			"resources/restIcon2/5.png",
			"resources/restIcon2/25.png",
			"resources/restIcon2/29.png",
			"resources/restIcon2/4.png",
			"resources/restIcon2/3.png",
			"resources/restIcon2/21.png",
			"resources/restIcon2/27.png",
			"resources/restIcon2/22.png",
			"resources/restIcon2/6.png",
			"resources/restIcon2/31.png",
			"resources/restIcon2/2.png",
			"resources/restIcon2/26.png",
			"resources/restIcon2/24.png",
			"resources/restIcon2/28.png",
			"resources/restIcon2/1.png",
			"resources/restIcon2/3.png",
			"resources/restIcon2/5.png",
			"resources/restIcon2/6.png",
			"resources/restIcon2/1.png"
			];2

			
			
			
			var nObjectCnt = 0; 
		
				function ShowDefaultRotate() // 스스로 자신을 호출하는 재귀함수 (Recursive Function)
				{
					nObjectCnt++;

					if (nObjectCnt < ObjectArray.length) // 배열의 갯수 이내일때만 실행
					{
						$("#menu-p img").attr("src", ObjectArray[nObjectCnt]); // 이미지 URL 변경
						obTimeOut = setTimeout(ShowDefaultRotate, 100); // 0.1초후에 자기자신을 호출 
					} else {
						nObjectCnt = 0; // 배열의 끝에 도달하면 nObjectCnt를 다시 0으로 설정
						clearTimeout(obTimeOut); // 배열의 갯수만큼 반복하여 변환시킨 후에는 Timeout 을 중지시킨다 
						
						// obTimeOut = setTimeout(ShowDefaultRotate, 100); // 0.1초 후 자기 자신 호출
					}
				}

				function startAnimation() {
					nObjectCnt = 0; // nObjectCnt 초기화
					// obTimeOut = window.setTimeout(ShowDefaultRotate, 100); // 윈도우 로드 후 0.1초 후에 반복함수를 호출합니다.
					ShowDefaultRotate(); // 첫 애니메이션 시작
					
					obTimeOut = setTimeout(ShowDefaultRotate, 100);
				
				}
				
				
				// 카테고리 클릭이벤트
				$(document).ready(function() {
					// 페이지 로드시 전체가 체크 되어있도록 설정
					$("label[for='allNation']").addClass("checked");
					
					$(".radioBtn").click(function() {
						$(".radioBtn>label").removeClass("checked");

						if ($(this).find("input").prop("checked")) {
							$(this).children("label").addClass("checked");
						}

					});

				});

				function rsRecommend() {
					let value = "";

					var selectedCategory = $(".ctg.checked").text();
					$("#menu-p").html("");
					
					value += '<img id="img1" src="resources/rest/1.jfif">';
					
					$("#menu-p").html(value);
					startAnimation(); // 이미지 애니메이션 시작
					
					
					setTimeout(function(){ // 3초 후 실행
						$.ajax({
							url : "random.rs",
							type : "get",
							data : {
								ctgName : selectedCategory
							},
							success : function(result) {
								
								clearTimeout(obTimeOut); // 애니메이션 중지
								

								let randomIndex = Math.floor(Math.random()
										* result.length);
								let randomRestaurant = result[randomIndex];
								
								value = '<div class="rest-div">'
										+ '<figure>'
										+ '<img class="rest-img" src="'+ randomRestaurant.restImgUrl  +'">'
										+ '<figcaption>'
										+ randomRestaurant.restName
										+ '</figcaption>'
										+ '<div class="restNo" style="display:none;">' + randomRestaurant.restNo + '</div>'
										+ '</div>';
		
								$("#menu-p").html(value);
								
								$(".rest-img").click(function(){
									var restNo = $(this).siblings('.restNo').text();
									// find는 하위요소를 선택할대, siblings 는 형제요소
									 console.log(restNo);
						       		 window.location.href = '<%= request.getContextPath() %>/detail.rs?rpage=' + restNo
								});
							},

							error : function() {
								console.log("ajax 통신에 실패했습니다.");
							}
						});
					}, 2000);
					
					
					
				}
			</script>
		</div>
	</div>

	<%@ include file="../common/footer.jsp" %>
</body>
</html>