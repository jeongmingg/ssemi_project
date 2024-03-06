$(function() {
    const tabList = $('.tab');
    const infoList = $('.info');

    tabList.click(function() {
        tabList.removeClass('active');
        infoList.removeClass('active');

        $(this).addClass('active');

        // console.log($(this).parent().attr('id'));
        // if($(this).parent().attr("id") == "board") {
        //     $.ajax({
        //         url: "boList.me",
        //         data: {}
        //     });
        // }

        infoList.eq(tabList.index(this)).addClass('active');
    });

    // 이름 실시간 체크
    $("#myInfo input[name=userName]").on("propertychange change paste input", function() {
        // 이름: 한글 2자 이상 10자 이내
        const regExp = /^[가-힣]{2,10}$/;

        const msg = $("#nameMsg");

        if(!regExp.test($(this).val())) {
            msg.css("display", "block");
            msg.text("* 이름: 2~10자의 한글만 사용 가능합니다.");
        } else {
            msg.css("display", "none");
            msg.text("");
        }
    });
})

// 개인정보 수정하기 버튼 클릭 시, 유효성 검사
function validate() {
    const nameInput = $("#myInfo input[name=userName]");
    const nicknameInput = $("#myInfo input[name=nickname]");

    // 이름: 한글 2자 이상 10자 이내
    regExp = /^[가-힣]{2,10}$/;

    msg = $("#nameMsg");

    if(!regExp.test(nameInput.val())) {
        msg.css("display", "block");
        msg.text("* 이름: 2~10자의 한글만 사용 가능합니다.");

        nameInput.select();

        return false;
    }

    // 닉네임: 영문, 한글, 숫자, _ 포함 2자 이상 10자 이내
    regExp = /^[가-힣\w]{2,10}$/;

    msg = $("#nicknameMsg");

    if(!regExp.test(nicknameInput.val())) {
        msg.css("display", "block");
        msg.text("* 2~10자의 영문, 한글, 숫자, 특수문자(_)만 사용 가능합니다.");

        nicknameInput.select();

        return false;

    } else if(msg.text() != "") {
        nicknameInput.select();

        return false;
    }
}

function boardList() {
    
}