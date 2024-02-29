$(function() {
    // 비밀번호 실시간 체크
    $("input[name=userPwd]").on("propertychange change paste input", function() {
        // 비밀번호: 영문(대소문자 구분), 숫자, 특수문자(!@#$%^&*) 포함 8자 이상 15자 이내
        const regExp = /^[a-zA-Z\d!@#$%^&*]{8,15}$/;

        const msg = $("#pwdMsg");

        if(!regExp.test($(this).val())) {
            msg.css("display", "block");
            msg.text("* 비밀번호: 8~15자의 영문 대소문자, 숫자, 특수기호(!@#$%^&*)만 사용 가능합니다.");
        } else {
            msg.css("display", "none");
            msg.text("");
        }
    });

    // 비밀번호 확인 실시간 체크
    $("input[name=userPwd]").siblings("input[type=password]").on("propertychange change paste input", function() {
        // 비밀번호 확인: 위에 입력한 비밀번호와 동일한지 확인
        const msg = $("#pwdCheckMsg");

        if($(this).val() != $("input[name=userPwd]").val()) {
            msg.css("display", "block");
            msg.text("* 입력한 비밀번호와 일치하지 않습니다.");
        } else {
            msg.css("display", "none");
            msg.text("");
        }
    });

    // 이름 실시간 체크
    $("input[name=userName]").on("propertychange change paste input", function() {
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

    // 이메일 인증 버튼 클릭 시, 체크
    $("#check-email-btn").click(function() {
        // 이메일: 반드시 값을 채우도록 확인
        const msg = $("#emailMsg");

        if($("input[name=email]").val() == "" || $("input[name=domain]").val() == "") {
            msg.css("display", "block");
            msg.text("* 이메일을 입력해주세요");
        } else {
            msg.css("display", "none");
            msg.text("");
        }
    });
})

// 가입하기 버튼 클릭 시, 유효성 검사
function validate() {
    const idInput = $("input[name=userId]");
    const pwdInput = $("input[name=userPwd]");
    const pwdCheckInput = $("input[name=userPwd]").siblings("input[type=password]");
    const nameInput = $("input[name=userName]");
    const nicknameInput = $("input[name=nickname]");
    const emailInput = $("input[name=email]");
    const domainInput = $("input[name=domain]");

    // 아이디: 영문(대소문자 구분), 숫자, _ 포함 6자 이상 15자 이내 (첫글자는 영문으로)
    let regExp = /^[a-zA-Z][\w]{5,14}$/;

    let msg = $("#idMsg");

    if(!regExp.test(idInput.val())) {
        msg.css("display", "block");
        msg.text("* 아이디: 6~15자의 영문 대소문자, 숫자, 특수기호(_)만 사용 가능합니다. (첫 글자는 영문만 사용 가능합니다.)");
        
        idInput.select();

        return false;

    } else if(msg.text() != "") {
        idInput.select();

        return false;
    }

    // 비밀번호: 영문(대소문자 구분), 숫자, 특수문자(!@#$%^&*) 포함 8자 이상 15자 이내
    regExp = /^[a-zA-Z\d!@#$%^&*]{8,15}$/;

    msg = $("#pwdMsg");

    if(!regExp.test(pwdInput.val())) {
        msg.css("display", "block");
        msg.text("* 비밀번호: 8~15자의 영문 대소문자, 숫자, 특수기호(!@#$%^&*)만 사용 가능합니다.");

        pwdInput.select();

        return false;
    }

    // 비밀번호 확인: 위에 입력한 비밀번호와 동일한지 확인
    msg = $("#pwdCheckMsg");

    if(pwdCheckInput.val() != pwdInput.val()) {
        msg.css("display", "block");
        msg.text("* 입력한 비밀번호와 일치하지 않습니다.");

        pwdCheckInput.select();

        return false;
    }

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
        msg.text("* 닉네임: 2~10자의 영문 대소문자, 한글, 숫자, 특수문자(_)만 사용 가능합니다.");

        nicknameInput.select();

        return false;

    } else if(msg.text() != "") {
        nicknameInput.select();

        return false;
    }

    // 이메일: 반드시 값을 채우도록 확인
    msg = $("#emailMsg");

    if(emailInput.val() == "" || domainInput.val() == "") {
        msg.css("display", "block");
        msg.text("* 이메일을 입력해주세요");

        emailInput.select();

        return false;
        
    } else if(msg.text() != "") {
        emailInput.select();

        return false;
    }

}

// 아이디 실시간 체크
function idCheck() {
    const $idInput = $("input[name=userId]");
    
    $.ajax({
        url: "idCheck.me",
        data: {checkId: $idInput.val()},
        success: function(result) {
            if(result == "NNNNN") {
                $("#idMsg").css("display", "block");
                $("#idMsg").text("* 이미 사용 중인 아이디입니다.");

            } else {
                // 아이디: 영문(대소문자 구분), 숫자, _ 포함 6자 이상 15자 이내 (첫글자는 영문으로)
                const regExp = /^[a-zA-Z][\w]{5,14}$/;

                const msg = $("#idMsg");

                if(!regExp.test($idInput.val())) {
                    msg.css("display", "block");
                    msg.text("* 아이디: 6~15자의 영문 대소문자, 숫자, 특수기호(_)만 사용 가능합니다. (첫 글자는 영문만 사용 가능합니다.)");

                } else {
                    msg.css("display", "none");
                    msg.text("");
                }
            }
        },
        error: function() {
            console.log("아이디 중복체크용 ajax 통신 실패");
        }
    });
    
}

// 닉네임 실시간 체크
function nickCheck() {
    const $nickInput = $("input[name=nickname]");

    $.ajax({
        url: "nickCheck.me",
        data: {checkNick: $nickInput.val()},
        success: function(result) {
            if(result == "NNNNN") {
                $("#nicknameMsg").css("display", "block");
                $("#nicknameMsg").text("* 이미 사용 중인 닉네임입니다.");

            } else {
                // 닉네임: 영문, 한글, 숫자, _ 포함 2자 이상 10자 이내
                const regExp = /^[가-힣\w]{2,10}$/;

                const msg = $("#nicknameMsg");

                if(!regExp.test($nickInput.val())) {
                    msg.css("display", "block");
                    msg.text("* 닉네임: 2~10자의 영문 대소문자, 한글, 숫자, 특수문자(_)만 사용 가능합니다.");

                } else {
                    msg.css("display", "none");
                    msg.text("");
                }
            }
        },
        error: function() {
            console.log("닉네임 중복체크용 ajax 통신 실패");
        }
    });
}

// 이메일 실시간 체크
function emailCheck() {
    const email = $("input[name=email]");
    const domain = $("input[name=domain]");
    const fullEmail = email.val() + "@" + domain.val();
    const msg = $("#emailMsg");

    if(email.val() == "" || domain.val() == "") {
        msg.css("display", "block");
        msg.text("* 이메일을 입력해주세요");

    } else {
        $.ajax({
            url: "emailCheck.me",
            data: {checkEmail: fullEmail},
            success: function(result) {
                if(result == "NNNNN") {
                    msg.css("display", "block");
                    msg.text("* 이미 사용 중인 이메일입니다.");
    
                } else {
                    msg.css("display", "none");
                    msg.text("");
                }
            },
            error: function() {
                console.log("이메일 중복체크용 ajax 통신 실패");
            }
        });
    }
}

function input_domain() {
    // 직접입력인 경우에는 input에 입력한 값으로 넘겨주고
    // 직접입력 외의 경우에는 선택한 값을 input에 넣어주자
    // 직접입력 외의 경우에는 input 수정 불가하게 하자 (readonly)

    const domainInput = $("input[name=domain]");

    if($("#selectDomain").val() == "input-self") {
        domainInput.val("");
        domainInput.removeAttr("readonly");
        domainInput.select();

    } else {
        domainInput.val($("#selectDomain").val());
        domainInput.attr("readonly", true);
    }

    // 이메일 실시간 체크 함수 호출
    emailCheck();

}