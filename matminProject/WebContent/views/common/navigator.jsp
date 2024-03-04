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

    .modal-header>h4{
        padding-left: 150px;
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
        width: 100px;
        height: 30px;
        background-color: rgb(228, 145, 13);
        color: white;
        border: none;
        border-radius: 9px;
    }

    /* 로고 스타일 */
    #logo{
        width: 100px;
        height: 100px;

    }

    /* 지역검색 selectBox 스타일 */
    /* 위에꺼 */
    /* .selectBox {
  position: relative;
  width: 150px;
  height: 35px;
  border-radius: 4px;
  border: 2px solid lightcoral;
}
.selectBox .select {
  width: inherit;
  height: inherit;
  background: transparent;
  border: 0 none;
  outline: 0 none;
  padding: 0 5px;
  position: relative;
  z-index: 3; 
}
.selectBox .select option {
  background: lightcoral;
  color: #fff;
  padding: 3px 0;
  font-size: 16px;
}
.selectBox .icoArrow {
  position: absolute; 
  top: 0; 
  right: 0; 
  z-index: 1; 
  width: 35px; 
  height: inherit;
  border-left: 2px solid lightcoral;
  display: flex;
  justify-content: center;
  align-items: center;
}

.selectBox .icoArrow img {
  width: 50%;
  transition: .3s;
}

.selectBox .select:focus + .icoArrow img {
  transform: rotate(180deg);
}

.selectBox option:hover {
    background: #E4910D;
} */

    /* 밑에거 */
    .selectBox * { box-sizing: border-box; }
    .selectBox {
        position: relative;
        width: 150px;
        height: 35px;
        border-radius: 4px;
        border: 2px solid #E4910D;
        background: url('https://freepikpsd.com/media/2019/10/down-arrow-icon-png-7-Transparent-Images.png') calc(100% - 7px) center no-repeat;
        background-size: 20px;
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
        top: 28px;
        left: 0;
        width: 100%;
        border: 1px solid #E4910D;
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
    max-height: 500px;
    }

    .selectBox .optionItem {
    border-bottom: 1px dashed #E4910D;
    padding: 5px 15px 5px;
    transition: .1s;
    }

    .selectBox .optionItem:hover {
    background: #E4910D;
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
                <li><a href="<%= request.getContextPath() %>/list.bo?cpage=1" id="navi1">맛집등록/삭제</a></li>
                <li><button id="navi2" type="button" data-toggle="modal" data-target="#myModal">맛슐랭</button></li>
                <li><a href="<%= request.getContextPath() %>/recommend.rs" id="navi3">맛집뺑뺑이</a></li>
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

        

        <div class="modal-body" >

            <!-- 위에꺼 -->
            <!-- <div class="box">
                <div class="selectBox">
                  <select name="fruits" class="select">
                    <option disabled selected>fruits 🍊</option>
                    <option value="apple">apple</option>
                    <option value="orange">orange</option>
                    <option value="grape">grape</option>
                    <option value="melon">melon</option>
                  </select>
                  <span class="icoArrow"><img src="https://freepikpsd.com/media/2019/10/down-arrow-icon-png-7-Transparent-Images.png" alt=""></span>
                </div>
              </div> -->

              <!-- 밑에꺼 -->
          <img src="resources/matchelin/matchelin1.png" id="logo">
          <div class="box">
            <div class="selectBox ">
              <button class="label">지역 검색</button>
              <ul class="optionList">
                <li class="optionItem">강남구</li>
                <li class="optionItem">강동구</li>
                <li class="optionItem">강북구</li>
                <li class="optionItem">강서구</li>
              </ul>
            </div>
            </div>
        </div>

       
          
        
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button id="modal-btn" type="button" class="btn" data-dismiss="modal">확인</button>
        </div>
        
      </div>
    </div>
  </div>
    </div>

    <script>
        // $("#navi").children().children().mouseenter("color","#E4910D");
        $("#navi a").mouseenter(function(){
            $(this).css("color","#E4910D");
        });

        $("#navi a").mouseout(function(){
            $(this).css("color", "rgb(150, 150, 150)");
        });

        $("#navi button").mouseenter(function(){
            $(this).css("color","#E4910D");
        });

        $("#navi button").mouseout(function(){
            $(this).css("color", "rgb(150, 150, 150)");
        });


        const label = document.querySelector('.label');
        const options = document.querySelectorAll('.optionItem');
        const handleSelect = function(item) {
        label.innerHTML = item.textContent;
        label.parentNode.classList.remove('active');
        }
        options.forEach(function(option){
        option.addEventListener('click', function(){handleSelect(option)})
        })

        label.addEventListener('click', function(){
        if(label.parentNode.classList.contains('active')) {
            label.parentNode.classList.remove('active');
        } else {
            label.parentNode.classList.add('active');
        }
        });

    </script>
    </div>
</body>
</html>