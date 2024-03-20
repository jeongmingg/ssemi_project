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

  // 비밀번호 실시간 체크
  $("input[name=newPwd]").on("propertychange change paste input", function() {
    // 비밀번호: 영문(대소문자 구분), 숫자, 특수문자(!@#$%^&*) 포함 8자 이상 15자 이내
    const regExp = /^[a-zA-Z\d!@#$%^&*]{8,15}$/;

    const msg = $("#newPwdMsg");

    if(!regExp.test($(this).val())) {
        msg.css("display", "block");
        msg.text("* 8~15자의 영문, 숫자, 특수기호(!@#$%^&*)만 사용 가능합니다.");
    } else {
        msg.css("display", "none");
        msg.text("");
    }
  });

// 비밀번호 확인 실시간 체크
  $("#newPwdCheck").on("propertychange change paste input", function() {
    // 비밀번호 확인: 위에 입력한 비밀번호와 동일한지 확인
    const msg = $("#newPwdCheckMsg");

    if($(this).val() != $("input[name=newPwd]").val()) {
        msg.css("display", "block");
        msg.text("* 입력한 비밀번호와 일치하지 않습니다.");
    } else {
        msg.css("display", "none");
        msg.text("");
    }
  });
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

// 변경 버튼 클릭 시, 유효성 검사
function modalValidate() {
  const currentPwdInput = $("input[name=currentPwd");
  const newPwdInput = $("input[name=newPwd]");
  const newPwdCheckInput = $("#newPwdCheck");

  // 현재 비밀번호 : 비어 있으면 안 된다.
  let msg = $("#currentPwdMsg");

  if(currentPwdInput.val() === "") {
    msg.css("display", "block");
    msg.text("* 현재 비밀번호를 입력해주세요.");
    
    currentPwdInput.select();

    return false;
  }

  // 비밀번호: 영문(대소문자 구분), 숫자, 특수문자(!@#$%^&*) 포함 8자 이상 15자 이내
  regExp = /^[a-zA-Z\d!@#$%^&*]{8,15}$/;

  msg = $("#newPwdMsg");

  if(!regExp.test(newPwdInput.val())) {
      msg.css("display", "block");
      msg.text("* 8~15자의 영문, 숫자, 특수기호(!@#$%^&*)만 사용 가능합니다.");

      newPwdInput.select();

      return false;
  }

  // 비밀번호 확인: 위에 입력한 비밀번호와 동일한지 확인
  msg = $("#newPwdCheckMsg");

  if(newPwdCheckInput.val() != newPwdInput.val()) {
      msg.css("display", "block");
      msg.text("* 입력한 비밀번호와 일치하지 않습니다.");

      newPwdCheckInput.select();

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
          "<tr>" + "<td colspan='6'>" + "작성한 게시글이 없습니다." + "</td>" + "</tr>";
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

        if(boardNo !== "작성한 게시글이 없습니다.") {
          location.href = "/mm/detail.bo?bno=" + boardNo;
        }
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
            '<i id="rvstar-avg"></i>' +
            "</div>" +
            '<span id="write-date">' +
            '<span id="rvstar-avg-title">' +
            result[i].reviewRate +
            "</span>" +
            result[i].reviewDate.substr(0, 10) +
            "</span>" +
            "</div>" +
            "</div>" +
            '<div class="warn">' +
            '<input type ="hidden" class="reviewNo" value=' +
            result[i].reviewNo +
            ">" +
            '<a href="#" class="delete-review" id="rv-delete" onclick="deleteReview(this, \'' +
            memNo +
            "');\">삭제</a>" +
            '<div class="review-update">' +
            "</div>" +
            "</div>" +
            "</div>" +
            '<div class="review-content">' +
            "<br><br>" +
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
      let str = "";
      if (result.length == 0) {
        str += `<tr>
                  <td colspan="3">찜꽁한 맛집이 없습니다.</td>
                  </tr>
                  <tr>
                  <td colspan="3"><hr /></td>
                  </tr>`;
      } else {
        for (let i in result) {
          str += `<tr>
          <td rowspan="3" width="120" style="padding-left: 15px; padding-right: 15px">
            <img class="rest-img" src="${result[i].restImgUrl}" />
          </td>
          <td colspan="2" style="width: 100px; height: 65px; padding-left: 10px; font-size: 22px;">
            ${result[i].restName}
          </td>
        </tr>
        <tr>
          <td width="85px" style="padding-left: 15px; font-size: 17px">
            ${result[i].localName}
          </td>
          <td>대표메뉴&nbsp;&nbsp; ${result[i].menuName}</td>
        </tr>
        <tr>
          <td colspan="2" style="padding-left: 15px; font-size: 20px">
            <img id="star" src="resources/star, heart/star.png" />&nbsp;&nbsp;${result[i].restAvg} (${result[i].reviewCount})&nbsp;&nbsp;|&nbsp;&nbsp;
            <img id="heart" src="https://img.icons8.com/ios-filled/50/e4910d/like--v1.png" width="100" height="100" onclick="cancelHeart('${memNo}', '${result[i].restNo}');" />&nbsp;
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

    },
    error: function () {
      console.log("마이페이지(내가 쓴 게시글) ajax 실패");
    },
  });
}

/* 리뷰 삭제 ajax*/
function deleteReview(ele, memNo) {
  /*클릭된 this 객체 $(ele)의 형재태그인 input의 value에 값을 넣어놨음*/
  let rvNo = $(ele).siblings("input").val();

  if (confirm("정말 삭제하시겠습니까?")) {
    $.ajax({
      url: "delete.rv",
      type: "post",
      data: { no: rvNo },
      success: function (review) {
        if (review != null) {
          alert("성공적으로 삭제됐습니다!");
          reviewList(memNo);
        }
      },
      error: function () {
        console.log("삭제오류 ajax통신오류");
      },
    });
  }
}

function cancelHeart(memNo, restNo) {
  $.ajax({
    url: "deleteHeart.me",
    data: {
      memNo: memNo,
      restNo: restNo
    },
    success: function() {
      alert("찜꽁 해제가 완료되었습니다.");
      markList(memNo);
    },
    error: function() {
      console.log("찜꽁 해제 ajax 호출 실패");
    }
  });
}