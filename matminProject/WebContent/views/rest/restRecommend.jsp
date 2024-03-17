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
	}

	#rsBtn{font-size: 22px;}

	/* 식당 이미지 스타일 */
	#rest-img{
		width: 180px;
		height: 180px;
		margin-bottom: 10px;
		border-radius: 15px;
	}

	#rest-img+figcaption{
		text-align: center;
		font-size: 20px;
	}
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
					<button id="rsBtn" onclick="rsRecommend();">맛집&nbsp;&nbsp;&nbsp;추천</button>
				</div>
			</div>
			
			<script>

			// 카테고리 클릭이벤트
			$(document).ready(function() {
				$(".radioBtn").click(function(){
					$(".radioBtn>label").removeClass("checked");
				
					if ($(this).find("input").prop("checked")) {
						$(this).children("label").addClass("checked");
					}
					
				});
			});
			

			function rsRecommend(){
				
				var selectedCategory = $(".ctg.checked").text();
				
				$.ajax({
					url:"random.rs",
					type:"post",
					data: {ctgName: selectedCategory},
					success:function(result){
						
							let value = "";
							
							let randomIndex = Math.floor(Math.random() * result.length);
				            let randomRestaurant = result[randomIndex];
							
					            value += '<div class="rest-div">'
											+ '<figure>'
											+ '<img id="rest-img" src="'+ randomRestaurant.restImgUrl  +'">'
											+ '<figcaption>' + randomRestaurant.restName + '</figcaption>'
									   + '</div>';
				            	      
				            $("#menu-p").html(value);
						},
						
					  error:function(){
						  console.log("ajax 통신에 실패했습니다.");
					  }					
				});
			}
			
			</script>
		</div>
	</div>

	<%@ include file="../common/footer.jsp" %>
</body>
</html>