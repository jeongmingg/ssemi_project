<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>AdminDashboard</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
      .outer {
        max-width: 1100px;
        margin: 0 auto;
        padding: 20px;
      }

      #best2,
      #best3 {
        margin-top: 20px;
      }

      .table1 {
        margin: 20px auto;
      }

      table {
        width: 100%;
        border-collapse: collapse;
      }

      th,
      td {
        border: 1px solid #dddddd;
        text-align: center;
        padding: 8px;
      }

      th {
        color: orange;
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
    <%@ include file="../common/header.jsp" %> <%@ include
    file="../common/navigator.jsp" %>

    <div class="container outer" width="82%">
      <!-- <p>Justified tabs:</p> -->
      <br /><br />
      <ul id="navi" class="nav nav-tabs nav-justified">
        <li class="nav-item">
          <a
            href="<%= contextPath %>/stat.ad"
            class="nav-link active"
            style="color: orange; font-size: 30px"
            >Statistics</a
          >
        </li>
        <li class="nav-item">
          <a
            href="<%= contextPath %>/rest.list?cpage=1"
            class="nav-link"
            style="color: orange; font-size: 30px"
            >Restaurants</a
          >
          <ul>
            <li><a href="<%= contextPath %>/restEnroll.ad">식당등록</a></li>
            <!-- <li><a href="<%= contextPath %>/rest.list?cpage=1">식당전체조회</a></li> -->
          </ul>
        </li>
        <li class="nav-item">
          <a
            class="nav-link"
            href="<%= contextPath %>/memList.ad"
            style="color: orange; font-size: 30px"
            >Member</a
          >
          <ul>
            <li align="center">
              <a href="<%= contextPath %>/memList.ad">회원전체조회</a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a
            class="nav-link"
            href="<%= contextPath %>/list.bo?cpage=1"
            style="color: orange; font-size: 30px"
            >Board</a
          >
          <ul>
            <li align="center">
              <a href="<%= contextPath%>/list.bo?cpage=1"
                >식당 등록/삭제 게시판</a
              >
            </li>
            <li><a href="<%= contextPath %>/report.bo"> 신고 게시판</a></li>
          </ul>
        </li>
      </ul>
    </div>

    <div class="outer">
      <div class="table1">
        <table class="table table-bordered" align="center">
          <tr>
            <th width="200">총 등록 식당 수</th>
            <th width="200">총 회원 수</th>
          </tr>
          <tr>
            <th>150개</th>
            <th>300명</th>
          </tr>
        </table>
      </div>

      <div id="best2" style="float: left">
        <table class="table table-bordered">
          <tr>
            <th>순위</th>
            <th>식당명</th>
            <th>리뷰수</th>
            <th>찜꽁수</th>
            <th>공유수</th>
          </tr>
          <tr>
            <th>1</th>
            <th>스즈란테이</th>
            <th>100</th>
            <th>700</th>
            <th>50</th>
          </tr>
          <tr>
            <th>2</th>
            <th>한우사랑</th>
            <th>90</th>
            <th>603</th>
            <th>45</th>
          </tr>
          <tr>
            <th>3</th>
            <th>돈까스</th>
            <th>87</th>
            <th>600</th>
            <th>43</th>
          </tr>
          <tr>
            <th>4</th>
            <th>신라마라탕</th>
            <th>79</th>
            <th>589</th>
            <th>37</th>
          </tr>

          <tr>
            <th>5</th>
            <th>온기정</th>
            <th>72</th>
            <th>550</th>
            <th>35</th>
          </tr>
        </table>
      </div>

      <div id="best3" style="float: right">
        <canvas width="400" height="350" id="canvas"></canvas>
      </div>

      <script>
        const canvas = document.getElementById("canvas");
        const ctx = canvas.getContext("2d");

        var width = canvas.clientWidth;
        var height = canvas.clientHeight;

        var value = [
          { number: 1050, text: "스즈란테이" },
          { number: 700, text: "한우 사랑" },
          { number: 735, text: "돈까스" },
          { number: 705, text: "신라마라탕" },
          { number: 600, text: "온기정" },
        ];
        var degree = 360;
        var radius = (width * 0.7) / 2; //반지름 동적 부여

        if (radius > (height * 0.7) / 2) {
          //캔버스의 넓이와 높이를 고려하여 최소크기 적용
          radius = (height * 0.7) / 2;
        }

        const colorArray = [
          "#f5444e",
          "#4bbfbc",
          "#fcb362",
          "#949fb0",
          "#c4c24a",
          "#6faab0",
        ]; //색깔배열(지금은 6개..)

        var sum = 0;
        value.forEach((arg) => (sum += arg.number));

        var conv_array = value.slice().map((data) => {
          //각도가 들어있는 배열
          var rate = data.number / sum;
          var myDegree = degree * rate;
          return myDegree;
        });

        degree = 0;
        var event_array = value.slice().map((arg) => []); //이벤트(각도 범위가 있는)용 배열

        var current = -1; //현재 동작중 인덱스
        var zero = 0; //각(degree)에 대해서 증가하는 값

        //최초 로딩 이벤트(값 1개씩 점차 증가하며 그리는함수)   -> 계속해서 덮어씌우기를 하므로 가운데가 깔끔하지 않다.(나중에 수정하여보자.)
        var clr = setInterval(() => {
          for (var i = 0; i < conv_array.length; i++) {
            var item = conv_array[i];
            if (current == -1 || current == i) {
              current = i;
              if (zero < item) {
                //비교
                if (i == 0) {
                  arcMaker(radius, 0, zero, colorArray[i]);
                } else {
                  arcMaker(radius, degree, degree + zero, colorArray[i]);
                }
                zero += 3;
              } else {
                current = i + 1;
                zero = 0;
                if (i != 0) {
                  arcMaker(radius, degree, degree + item, colorArray[i]);
                  event_array[i] = [degree, degree + item];
                  degree = degree + item;
                } else {
                  arcMaker(radius, 0, item, colorArray[i]);
                  degree = item;
                  event_array[i] = [0, degree];
                }
              }
            } else if (current == conv_array.length) {
              clearInterval(clr);
              makeText(-1);
            }
          }
        }, 1);

        //그리는 기능 분리(같은 내용이 계속 나오므로 분리)
        function arcMaker(radius, begin, end, color) {
          ctx.save();
          ctx.lineJoin = "round"; //선이만나 꺾이는 부분때문에 부여(삐져나오는 현상 방지)
          ctx.lineWidth = 4;
          ctx.beginPath();
          ctx.moveTo(width / 2, height / 2);
          ctx.arc(
            width / 2,
            height / 2,
            radius,
            (Math.PI / 180) * begin,
            (Math.PI / 180) * end,
            false
          );
          ctx.closePath();
          ctx.fillStyle = color;
          ctx.strokeStyle = "white";
          ctx.fill();
          ctx.stroke();
          ctx.restore();
          middelMaker(); //가운데 원형그리기 함수 추가
        }

        //마우스 움직임 이벤트 리스너
        var drawed = false;
        canvas.addEventListener("mousemove", function (event) {
          var x1 = event.clientX - canvas.offsetLeft;
          var y1 = event.clientY - canvas.offsetTop;
          var inn = isInsideArc(x1, y1);
          if (inn.index > -1) {
            //대상이 맞으면
            drawed = true;
            hoverCanvas(inn.index);
            makeText(inn.index);
          } else {
            //대상이 아니면
            if (drawed) {
              //대상이였다가 대상이 이제 아니면
              hoverCanvas(-1);
              makeText(-1);
            }
            drawed = false;
          }
        });

        //내부 + 범위에 들어온지 확인하는 함수
        function isInsideArc(x1, y1) {
          var result1 = false;
          var result2 = false;
          var index = -1;
          var circle_len = radius;
          var x = width / 2 - x1;
          var y = height / 2 - y1;
          var my_len = Math.sqrt(Math.abs(x * x) + Math.abs(y * y)); //삼각함수
          if (circle_len >= my_len) {
            result1 = true;
          }
          var rad = Math.atan2(y, x);
          rad = (rad * 180) / Math.PI; //음수가 나온다
          rad += 180; //캔버스의 각도로 변경
          if (result1) {
            event_array.forEach((arr, idx) => {
              //각도 범위에 해당하는지 확인
              if (rad >= arr[0] && rad <= arr[1]) {
                result2 = true;
                index = idx;
              }
            });
          }
          return {
            result1: result1,
            result2: result2,
            index: index,
            degree: rad,
          };
        }

        //마우스 오버효과
        function hoverCanvas(index) {
          ctx.clearRect(0, 0, width, height);
          for (var i = 0; i < conv_array.length; i++) {
            var item = conv_array[i];
            var innRadius = radius;
            if (index == i) {
              innRadius = radius * 1.1; //대상이 맞으면 1.1배 크게 키운다.
            }
            if (i == 0) {
              arcMaker(innRadius, 0, item, colorArray[i]);
              degree = item;
            } else {
              arcMaker(innRadius, degree, degree + item, colorArray[i]);
              degree = degree + item;
            }
          }
        }

        //도(degree)를 라디안(radian)으로 바꾸는 함수
        function degreesToRadians(degrees) {
          const pi = Math.PI;
          return degrees * (pi / 180);
        }

        //텍스트함수
        function makeText(index) {
          event_array.forEach((itm, idx) => {
            var half = (itm[1] - itm[0]) / 2;
            var degg = itm[0] + half;
            var xx =
              Math.cos(degreesToRadians(degg)) * radius * 0.7 + width / 2;
            var yy =
              Math.sin(degreesToRadians(degg)) * radius * 0.7 + height / 2;

            var txt = value[idx].text + "";
            var minus = ctx.measureText(txt).width / 2; //텍스트 절반길이
            ctx.save();
            if (index == idx) {
              ctx.font = "normal bold 18px sans-serif";
              ctx.fillStyle = "blue";
            } else {
              ctx.font = "normal 14px sans-serif";
              ctx.fillStyle = "white";
            }
            ctx.fillText(txt, xx - minus, yy);
            var txt2 = value[idx].number;
            ctx.fillText(txt2, xx - ctx.measureText(txt2).width / 3, yy + 16);
            ctx.restore();
          });
        }

        //중앙 구멍(원)을 만드는 함수
        function middelMaker() {
          ctx.save();
          ctx.fillStyle = "white";
          ctx.strokeStyle = "white";
          ctx.lineJoin = "round"; //선이만나 꺾이는 부분때문에 부여(삐져나오는 현상 방지)
          ctx.lineWidth = 1;
          ctx.beginPath();
          ctx.moveTo(width / 2, height / 2);
          ctx.arc(
            width / 2,
            height / 2,
            radius / 3,
            (Math.PI / 180) * 0,
            (Math.PI / 180) * 360,
            false
          );
          ctx.fill();
          ctx.stroke();
          ctx.closePath();
          ctx.restore();

          var total = 5;
          // value.forEach( (arg)=> total+=arg.number);
          var minus = ctx.measureText(total).width;
          ctx.save();
          ctx.font = "normal 20px sans-serif";
          ctx.fillStyle = "#656565";
          ctx.fillText(
            "TOP",
            width / 2 - ctx.measureText("Total").width / 2,
            height / 2
          );
          ctx.fillText(total, width / 2 - minus, (height / 2) * 1.1);
          ctx.restore();
        }
      </script>
      <%@ include file="../common/footer.jsp"%>
    </div>
  </body>
</html>
