let cNum = "";

$(function() {
    if(memNo !== "") {
        $.ajax({
            url: "findPwdSendEmail",
            data: {email: email},
            success: function(cNumber) {
                alert("이메일로 인증번호가 발송되었습니다.\n인증번호를 입력 후, 인증을 완료해주세요.");
                cNum = cNumber;
            },
            error: function() {
                console.log("mail 발송 ajax 실패");
            }
        });
    }
})

// 인증하기 버튼 클릭 시, 인증번호 일치여부 문구 띄워주기
// 인증이 완료되었을 경우, 새 비밀번호 input과 비밀번호 확인 input과 변경하기 버튼 활성화
function checkAuth() {
    const authInput = $("input[name=auth]");
    const authMsg = $("#authMsg");
    const neWPwdInput = $("input[name=newPwd");
    const checkPwdInput = $("#checkPwd");
    const changePwdBtn = $("#changePwdBtn");
    
    if(authInput.val() === cNum) {
        authMsg.css('display', 'block');
        authMsg.text("인증이 완료되었습니다.");
        authMsg.css('color', 'green');

        authInput.attr('disabled', true);
        $("#authBtn").attr('disabled', true);

        neWPwdInput.attr('disabled', false);
        checkPwdInput.attr('disabled', false);
        changePwdBtn.attr('disabled', false);

    } else {
        authMsg.css('display', 'block');
        authMsg.text("인증번호가 올바르지 않습니다.");
        authMsg.css('color', 'red');
    }
}

$(function() {
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
    $("#checkPwd").on("propertychange change paste input", function() {
        // 비밀번호 확인: 위에 입력한 비밀번호와 동일한지 확인
        const msg = $("#checkPwdMsg");

        if($(this).val() != $("input[name=newPwd]").val()) {
            msg.css("display", "block");
            msg.text("* 입력한 비밀번호와 일치하지 않습니다.");
        } else {
            msg.css("display", "none");
            msg.text("");
        }
    });
})

// 변경하기 버튼 클릭 시, 유효성 검사
function validate() {
    const neWPwdInput = $("input[name=newPwd");
    const checkPwdInput = $("#checkPwd");

    // 비밀번호: 영문(대소문자 구분), 숫자, 특수문자(!@#$%^&*) 포함 8자 이상 15자 이내
    regExp = /^[a-zA-Z\d!@#$%^&*]{8,15}$/;

    let msg = $("#newPwdMsg");

    if(!regExp.test(neWPwdInput.val())) {
        msg.css("display", "block");
        msg.text("* 8~15자의 영문, 숫자, 특수기호(!@#$%^&*)만 사용 가능합니다.");

        neWPwdInput.select();

        return false;
    }

    // 비밀번호 확인: 위에 입력한 비밀번호와 동일한지 확인
    msg = $("#checkPwdMsg");

    if(checkPwdInput.val() != neWPwdInput.val()) {
        msg.css("display", "block");
        msg.text("* 입력한 비밀번호와 일치하지 않습니다.");

        checkPwdInput.select();

        return false;
    }
}