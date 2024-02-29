<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	}

	/* 옵션선택 p 멘트 스타일 div h350*/
	#menu-p>p{
		text-align: center;
		font-size: 23px;
		padding-top: 60px;
		line-height: 40px;
		display: block;
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

	/* 카테고리, 라디오 div */
	.radioBtn{
		width: 90px;
		height: 45px;
		background-color: rgb(224, 224, 224);
		border-radius: 20px;
		padding-top: 12px;
		margin: 12px;
		cursor: pointer;
		font-size: 18px;
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
	}

	#rsBtn{font-size: 22px;}

</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>
	
	<div id="content">
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
				<div id="rs-btn">
					<button id="rsBtn">맛집&nbsp;&nbsp;&nbsp;추천</button>
				</div>
			</div>

			<script>

			// 카테고리 클릭이벤트
			$(document).ready(function() {
				$(".radioBtn").click(function(){
				
				$(".radioBtn").removeClass("checked");

				if ($(this).find("input").prop("checked")) {
					$(this).addClass("checked");
				}
				});
			});
			
			/*
			var menuLists = {
				"한식": ["비빔밥", "불고기", "김치찌개", "된장찌개"],
				"중식": ["짜장면", "짬뽕", "탕수육", "양장피"],
				"일식": ["초밥", "라멘", "우동", "돈부리"],
				"양식": ["스테이크", "파스타", "피자", "버거"],
				"간식": ["아이스크림", "과자", "케이크", "팝콘"]
			};

			$(document).ready(function() {
			// "메뉴 추천" 버튼 클릭 이벤트
			$("#menuBtn").click(function() {
				recommendMenu();
			});

			// "전체" 버튼 클릭 이벤트
			$("#total1 button").click(function() {
				recommendMenu("전체");
			});

			$("#total2 button").click(function() {
				recommendMenu("전체");
			});

			// 각 카테고리 버튼 클릭 이벤트
			$(".category-button button:not(:contains('전체'))").click(function() {
				recommendMenu($(this).text());
			});

			function recommendMenu(selectedCategory) {
				var menuList;

				// "전체" 버튼을 눌렀을 때
				if (selectedCategory === "전체") {
					menuList = [];
					for (var category in menuLists) {
						menuList = menuList.concat(menuLists[category]);
					}
				} else {
					menuList = menuLists[selectedCategory];
				}

				if (menuList) {
					// 추천 메뉴 로직 (예시: 랜덤으로 메뉴 선택)
					var randomMenu = menuList[Math.floor(Math.random() * menuList.length)];

					// 결과 출력
					var resultDiv = $("#menu-p p#menuP");
					resultDiv.html("옵션을 선택하고 <br><br>\"" + selectedCategory + "\" 메뉴 추천: " + randomMenu);
				} else {
					alert("메뉴 리스트가 없습니다.");
				}
			}
		});
		*/
		
				/*
			$(document).ready(function() {
				// ... (기존 코드)

				// "메뉴 추천" 버튼 클릭 이벤트
				$("#menu-btn").click(function() {
					recommendMenu();
				});

				// 각 카테고리 버튼 클릭 이벤트
				$(".category-button button").click(function() {
					$(this).toggleClass("active");
				});

				function recommendMenu() {
					var selectedCategory = "";

					// 선택된 카테고리 가져오기
					var selectedButtons = $('.category-button button.active');
					selectedButtons.each(function() {
						selectedCategory += $(this).text() + " ";
					});

					// 선택된 카테고리에 해당하는 메뉴 리스트 가져오기
					var menuList = menuLists[selectedCategory.trim()];

					if (menuList) {
						// 추천 메뉴 로직 (예시: 랜덤으로 메뉴 선택)
						var randomMenu = menuList[Math.floor(Math.random() * menuList.length)];

						// 결과 출력
						var resultDiv = $("#menu-p p#menuP");
						resultDiv.html("옵션을 선택하고 <br><br>\"" + selectedCategory.trim() + "\" 메뉴 추천: " + randomMenu);
					} else {
						alert("메뉴 리스트가 없습니다.");
					}
				}
			});

				// "전체" 버튼 클릭 이벤트
				$("#total1 button").click(function() {
					recommendMenu("전체");
				});

				$("#total2 button").click(function() {
					recommendMenu("전체");
				});
				*/
				
				

				/*
				var menuLists = {
					"한식": ["비빔밥", "불고기", "김치찌개", "된장찌개"],
					"중식": ["짜장면", "짬뽕", "탕수육", "양장피"],
					"일식": ["초밥", "라멘", "우동", "돈부리"],
					"양식": ["스테이크", "파스타", "피자", "버거"],
					"간식": ["아이스크림", "과자", "케이크", "팝콘"]
				};

				// 각 카테고리 테이블에 추가
				$(document).ready(function() {
					for (var category in menuLists) {
						var categoryButtons = "";
						menuLists[category].forEach(function(menu) {
							categoryButtons += '<button><a href="#">' + menu + '</a></button>';
						});

						var categoryRow = '<tr><td><button><a href="#">' + category + '</a></button></td>' + categoryButtons + '</tr>';
						$('#ctgTable').append(categoryRow);
					}

					// "전체" 버튼 클릭 이벤트
					$("#ctgTable button:contains('전체')").click(function() {
						recommendMenu("전체");
					});

					// 각 카테고리 버튼 클릭 이벤트
					$("#ctgTable button:not(:contains('전체'))").click(function() {
						recommendMenu($(this).text());
					});

					function recommendMenu(selectedCategory) {
						var menuList;

						// "전체" 버튼을 눌렀을 때
						if (selectedCategory === "전체") {
							menuList = [];
							for (var category in menuLists) {
								menuList = menuList.concat(menuLists[category]);
							}
						} else {
							menuList = menuLists[selectedCategory];
						}

						if (menuList) {
							// 추천 메뉴 로직 (예시: 랜덤으로 메뉴 선택)
							var randomMenu = menuList[Math.floor(Math.random() * menuList.length)];

							// 결과 출력
							var resultDiv = $("#menu-p");
							resultDiv.html("<p>" + selectedCategory + " 추천 메뉴: " + randomMenu + "</p>");
						} else {
							alert("메뉴 리스트가 없습니다.");
						}
					}
				}); 
				*/
				
			</script>
		</div>
	</div>

	<%@ include file="../common/footer.jsp" %>
</body>
</html>