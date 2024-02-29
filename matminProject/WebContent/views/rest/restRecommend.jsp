<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	div{
        box-sizing: border-box;
        border: 1px solid red;
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
	#menu-recom{height: 1000px;}
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
	#category-div{height: 300px;}
	#menuBtn-div{height: 100px;}

	/* 위치이미지 스타일 div h100 */
	#positioinImg{
		width: 90px;
		height: 90px;
	}

	/* 오늘뭐먹지 p 멘트 스타일 div h150*/
	#positionMent-div>p{
		text-align: center;
		font-weight: bold;
		font-size: 22px;
	}

	#menu-P-div{
		display: flex;
		justify-content: center;
	}

	/* 옵션선택 멘트 스타일 div h350 */
	#menu-P{
		background-color: rgb(244, 244, 244);
		width: 750px;
		height: 300px;

		display: flex;
		justify-content: center;
		
	}

	/* 옵션선택 p 멘트 스타일 div h350*/
	#menu-P>p{
		
		text-align: center;
		font-weight: bold;
		font-size: 25px;
		padding-top: 50px;
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
				<p>
					오늘 뭐먹지?! <br><br>
					맛집 뺑뺑이가 추천해 드릴게요!
				</p>
			</div>
			<div id="menu-P-div">
				<div id="menu-P">
					<p>
						옵션을 선택하고 <br><br>
						"메뉴 추천" 버튼을 눌러주세요!
					</p>
				</div>
			</div>
			<div id="category-div">
				
			</div>
			<div id="menuBtn-div">

			</div>







		</div>
		<div id="rest-recom">

		</div>
	</div>




	<%@ include file="../common/footer.jsp" %>
</body>
</html>