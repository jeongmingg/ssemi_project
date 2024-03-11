$(function () {
  const tabList = $(".tab");
  const infoList = $(".info");

  tabList.click(function () {
    tabList.removeClass("active");
    infoList.removeClass("active");

    $(this).addClass("active");
    infoList.eq(tabList.index(this)).addClass("active");
  });

  // 이름 실시간 체크
  $("#myInfo input[name=userName]").on(
    "propertychange change paste input",
    function () {
      // 이름: 한글 2자 이상 10자 이내
      const regExp = /^[가-힣]{2,10}$/;

      const msg = $("#nameMsg");

      if (!regExp.test($(this).val())) {
        msg.css("display", "block");
        msg.text("* 이름: 2~10자의 한글만 사용 가능합니다.");
      } else {
        msg.css("display", "none");
        msg.text("");
      }
    }
  );
});

// 개인정보 수정하기 버튼 클릭 시, 유효성 검사
function validate() {
  const nameInput = $("#myInfo input[name=userName]");
  const nicknameInput = $("#myInfo input[name=nickname]");

  // 이름: 한글 2자 이상 10자 이내
  regExp = /^[가-힣]{2,10}$/;

  msg = $("#nameMsg");

  if (!regExp.test(nameInput.val())) {
    msg.css("display", "block");
    msg.text("* 이름: 2~10자의 한글만 사용 가능합니다.");

    nameInput.select();

    return false;
  }

  // 닉네임: 영문, 한글, 숫자, _ 포함 2자 이상 10자 이내
  regExp = /^[가-힣\w]{2,10}$/;

  msg = $("#nicknameMsg");

  if (!regExp.test(nicknameInput.val())) {
    msg.css("display", "block");
    msg.text("* 2~10자의 영문, 한글, 숫자, 특수문자(_)만 사용 가능합니다.");

    nicknameInput.select();

    return false;
  } else if (msg.text() != "") {
    nicknameInput.select();

    return false;
  }
}

function boardList(memNo) {
  $.ajax({
    url: "boList.me",
    data: { memNo: memNo },
    success: function (result) {
      let str = "";
      if (result.length == 0) {
        str +=
          "<tr>" + "<td>" + "작성한 게시글이 없습니다." + "</td>" + "</tr>";
      } else {
        for (let i in result) {
          str +=
            "<tr>" +
            "<td>" +
            result[i].boardNo.substr(1) +
            "</td>" +
            "<td>" +
            result[i].boardType +
            "</td>" +
            "<td>" +
            result[i].boardTitle +
            "</td>" +
            "<td>" +
            result[i].boardWriter +
            "</td>" +
            "<td>" +
            result[i].boardCount +
            "</td>" +
            "<td>" +
            result[i].boardDate.substr(0, 10) +
            "</td>" +
            "</tr>";
        }
      }

      $("#myBoard>span").text("총 " + result.length + "개");
      $("#myBoard>table>tbody").html(str);

      $(".list-area tbody tr").click(function () {
        var boardNo = $(this).find("td:first").text();
        location.href = "/mm/detail.bo?bno=" + boardNo;
      });
    },
    error: function () {
      console.log("마이페이지(내가 쓴 게시글) ajax 실패");
    },
  });
}

function reviewList(memNo) {
  $.ajax({
    url: "rvList.me",
    data: { memNo: memNo },
    success: function (result) {
      let str = "";
      if (result.length == 0) {
        str += "작성한 리뷰가 없습니다.";
      } else {
        for (let i in result) {
          str +=
            '<div class="review-detail">' +
            '<div class="review-div">' +
            '<div class="rv1">' +
            '<div class="profile">' +
            '<div id="profile-img">' +
            '<img src="https://img.icons8.com/ios-filled/100/737373/user-male-circle.png">' +
            "</div>" +
            '<div class="profile-name">' +
            '<div id="writer">' +
            result[i].reviewWriter +
            "</div>" +
            '<div style="display: flex;">' +
            '<div id="w-star">' +
            '<i style="width: 70%;"></i>' +
            "</div>" +
            '<span id="write-date">' +
            result[i].reviewDate.substr(0, 10) +
            "</span>" +
            "</div>" +
            "</div>" +
            '<div class="warn">' +
            '<a href="#" id="rv-warn">신고</a>' +
            '<div class="review-update">' +
            '<a href="#" id="rv-update">수정</a>' +
            '<a href="#" id="rv-delete">삭제</a>' +
            "</div>" +
            "</div>" +
            "</div>" +
            '<div class="w-star-detail">' +
            "<ul>" +
            "<li>맛" +
            '<li class="rv-star-s"></li>' +
            '<li id="rv-flv-star">' +
            result[i].rateTaste +
            "</li>" +
            "</li>" +
            "<li>가격" +
            '<li class="rv-star-s"></li>' +
            '<li id="rv-pri-star">' +
            result[i].ratePrice +
            "</li>" +
            "</li>" +
            "<li>서비스" +
            '<li class="rv-star-s"></li>' +
            '<li id="rv-ser-star">' +
            result[i].rateService +
            "</li>" +
            "</li>" +
            "</ul>" +
            "</div>" +
            '<div class="review-content">' +
            '<p name="rv-content" id="rv-content">' +
            result[i].reviewCont +
            "</p>" +
            "</div>" +
            '<div class="review-img">' +
            "<div>" +
            '<img id="rvImg" src="https://d12zq4w4guyljn.cloudfront.net/20191021050027_photo1_yWq7n26CqVPd.jpg" data-nickname="맛쟁이" data-date="2019년 11월 3일" style="width:160px; height:160px; overflow:hidden; float:left; border-radius: 5px; margin-right:8px;">' +
            '<img id="rvImg" src="https://d12zq4w4guyljn.cloudfront.net/20191021050027_photo1_yWq7n26CqVPd.jpg" data-nickname="맛쟁이" data-date="2019년 11월 3일" style="width:160px; height:160px; overflow:hidden; float:left; border-radius: 5px; margin-right:8px;">' +
            '<img id="rvImg" src="https://d12zq4w4guyljn.cloudfront.net/20191021050027_photo1_yWq7n26CqVPd.jpg" data-nickname="맛쟁이" data-date="2019년 11월 3일" style="width:160px; height:160px; overflow:hidden; float:left; border-radius: 5px; margin-right:8px;">' +
            "</div>" +
            "</div>" +
            '<div class="review-like">' +
            '<div class="like-area">' +
            '<span id="like">' +
            "추천 (" +
            result[i].reviewLike +
            ")</span>" +
            "</div>" +
            '<div class="unlike-area">' +
            '<span id="unlike">비추천 (' +
            result[i].reviewDislike +
            ")</span>" +
            "</div>" +
            "</div>" +
            "</div>" +
            "</div>" +
            "</div>";
        }
      }

      $("#myReview>span").text("총 " + result.length + "개");
      $("#myReview>div").html(str);

      // $(".list-area tbody tr").click(function(){
      //     var boardNo = $(this).find('td:first').text();
      //     location.href = '/mm/detail.bo?bno=' + boardNo;
      // });
    },
    error: function () {
      console.log("마이페이지(내가 쓴 게시글) ajax 실패");
    },
  });
}

function markList(memNo) {
  $.ajax({
    url: "mkList.me",
    data: { memNo: memNo },
    success: function (result) {
      console.log(result);
      let str = "";
      if (result.length == 0) {
        str += `<tr>
                  <td colspan="3">조회된 결과가 없습니다. 다시 검색해주세요!</td>
                  </tr>
                  <tr>
                  <td colspan="3"><hr /></td>
                  </tr>`;
      } else {
        for (let i in result) {
          str += `<tr>
          <td rowspan="2" width="120" style="padding-left: 15px; padding-right: 15px">
            <img class="rest-img" src="${result[i].restImgUrl}" />
          </td>
          <td colspan="2" style="width: 100px; height: 65px; padding-left: 10px; font-size: 22px;">
            ${result[i].restName}
          </td>
        </tr>
        <tr>
          <td width="85px" style="padding-left: 15px; font-size: 17px">
            !!지역이름!!
          </td>
          <td>대표메뉴&nbsp;&nbsp; !!대표메뉴명!!</td>
        </tr>
        <tr>
          <td></td>
          <td colspan="2" style="padding-left: 15px; font-size: 20px">
            <img id="star" src="resources/star, heart/star.png" />&nbsp;&nbsp;${result[i].restAvg} (리뷰개수)&nbsp;&nbsp;|&nbsp;&nbsp;
            <img id="heart" src="resources/star, heart/heart.png" />&nbsp;
            ${result[i].countLike}
          </td>
        </tr>
        <tr>
          <td colspan="3"><hr /></td>
        </tr>`;
        }
      }

      $("#myMark>span").text("총 " + result.length + "개");
      $("#myMark>table").html(str);

      // $(".list-area tbody tr").click(function(){
      //     var boardNo = $(this).find('td:first').text();
      //     location.href = '/mm/detail.bo?bno=' + boardNo;
      // });
    },
    error: function () {
      console.log("마이페이지(내가 쓴 게시글) ajax 실패");
    },
  });
}
