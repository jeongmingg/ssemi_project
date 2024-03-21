$(function() {
    $("input[name=userId").focus();
})

function validate() {
    const userIdInput = $("input[name=userId]");
    const userPwdInput = $("input[name=userPwd]");
    const messageArea = $("#message");

    if(userIdInput.val() == "") {
        messageArea.css("display", "block");
        messageArea.text("* 아이디를 입력해주세요.");
        userIdInput.focus();

        return false;

    } else if(userPwdInput.val() == "") {
        messageArea.css("display", "block");
        messageArea.text("* 비밀번호를 입력해주세요.");
        userPwdInput.focus();

        return false;
    }
}