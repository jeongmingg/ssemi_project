function checkAgree() {
    if(!$("#agree").is(":checked")) {
        $("#click-agree").css("display", "block");
        $("#click-agree").text("* 약관 확인 후 동의해주세요.");
        return false;
    }
}