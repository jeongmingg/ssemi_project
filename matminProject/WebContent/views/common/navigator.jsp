<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
       
    /* 전체 구조 비율 */
    #navigator{height: 45px;}

    /* navigator 비율 */
    #navigator>div{height: 100%; float: left;}
    #navigator_1{width: 20%;}
    #navigator_2{
        width: 70%; 
        padding-left: 80px;
        padding-right: 80px;
    }
    #navigator_3{width: 10%;}
    
    /* navigator 스타일 */
    #navi{
        list-style-type: none;
        padding: 0;
        margin: 0;
        height: 100%;
    }

    #navi>li{
        float: left;
        width: 33%;
        height: 100%;
        text-align: center;
    }

    #navi a{
        text-decoration: none;
        color: rgb(150, 150, 150);
        font-size: 18px;
        font-weight: 600;

        width: 100%;
        height: 100%;
        display: block;
        line-height: 40px;
    }

    /* 맛슐랭 스타일 */
    #navi2{
        border: none;
        background: none;
        color: rgb(150, 150, 150);
        font-size: 18px;
        font-weight: 600;

        width: 100%;
        height: 100%;
        display: block;
        line-height: 40px;
        cursor: pointer;
    }

    /* 모달 스타일 */
    .modal-header>h4{
        padding-left: 150px;
    }

    .modal-body{
      padding-top: 60px;
    }
    
    /* modal 타이틀 */
    .modal-title{
        text-align: center;
        color: rgb(228, 145, 13);
        text-align: center;
    }

    /* modal 확인버튼 있는 div */
    .modal-footer{
        display: flex;
        justify-content: center;
    }
    
    /* 확인버튼 */
    #modal-btn{
        width: 150px;
        height: 40px;
        background-color: rgb(228, 145, 13);
        color: white;
        border: none;
        border-radius: 9px;
    }

    /* 로고 스타일 */
    #matchelin-logo{
        width: 120px;
        height: 120px;
        margin-bottom: 15px;

    }


    /* 지역검색 selectBox 스타일 */

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
      /* max-height: 900px; */
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

    
</style>
</head>
<body>
	<div class="wrap">
		<div id="navigator">
			<div id="navigator_1"></div>
			<div id="navigator_2">
				<ul id="navi">
					<li><a href="<%=request.getContextPath()%>/list.bo?cpage=1"
						id="navi1">맛집등록/삭제</a></li>
					<li><button id="navi2" type="button" data-toggle="modal"
							data-target="#myModal">맛슐랭</button></li>
					<li><a href="<%=request.getContextPath()%>/recommend.rs" id="navi3">맛집뺑뺑이</a></li>
				</ul>
			</div>
			<div id="navigator_3"></div>

			<!-- The Modal -->
			<div class="modal" id="myModal">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content" align="center">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">우리 지역 맛슐랭</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->

						<div class="modal-body" style="height: 300px;">
							<img src="resources/matchelin/matchelin1.png" id="matchelin-logo"> <br>
							<br>
							<div class="box">
								<div class="selectBox ">
									<button class="label" type="button">지역 선택</button>
									<ul class="optionList">
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

						<!-- Modal footer -->
						<div class="modal-footer">
							<button id="modal-btn" type="submit" class="btn" data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>

			<script>
				// $("#navi").children().children().mouseenter("color","#E4910D");
				$("#navi a").mouseenter(function() {
					$(this).css("color", "#E4910D");
				});

				$("#navi a").mouseout(function() {
					$(this).css("color", "rgb(150, 150, 150)");
				});

				$("#navi button").mouseenter(function() {
					$(this).css("color", "#E4910D");
				});

				$("#navi button").mouseout(function() {
					$(this).css("color", "rgb(150, 150, 150)");
				});


		        
				$(document).ready(function() {
		          const label = $('.label');
		          const options = $('.optionItem');
		          const selectBox = $('.selectBox');
		          const optionList = $('.optionList');
		          const modalBody = $('.modal-body'); // modal-body 클래스 선택
		
		          const handleSelect = function(item) {
		            label.text(item.text());
		            label.parent().removeClass('active');
		          }
		
		          options.on('click', function() {
		            handleSelect($(this));
		          });
		
		          label.on('click', function() {
		            label.parent().toggleClass('active');
		          });
		
		          // 지역 선택 박스를 클릭했을 때 이벤트 처리
		          selectBox.on('click', function() {
		            optionList.css('max-height', optionList.css('max-height') === '900px' ? '' : '900px');
		
		            // modal-body 클래스의 높이 변경
		            modalBody.css('height', modalBody.css('height') === '300px' ? '1170px' : '300px');
		          });
		
		          // 선택한 지역이름 가지고 페이지 이동하기
		          // 선택된 지역을 저장할 변수 초기화
		          var selectedLocation = '';
		
		          // 목록 아이템 클릭 이벤트 핸들러
		          $('.optionItem').on('click', function () {
		              // 클릭된 li의 텍스트를 가져와서 변수에 저장
		              selectedLocation = $(this).text();
		          });
		
		          // 확인 버튼 클릭 시 선택된 지역이름 가지고 페이지 이동
		          $('#modal-btn').on('click', function () {
		            // 선택된 지역이 있는지 확인
		            if (selectedLocation) {
		              // 선택된 지역을 가지고 페이지 이동
		              window.location.href = '<%= request.getContextPath() %>/select.rs?lname=' + encodeURIComponent(selectedLocation); // 페이지 이동
		            } else {
		                // 선택된 지역이 없을 경우 사용자에게 알림 등을 표시하거나 다른 동작 수행
		                alert('지역을 선택해주세요.');
		            }
		          });
		        });
			</script>
    </div>
	</div>
</body>
</html>