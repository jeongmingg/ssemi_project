function findId() {
    const msg1 = $("#nameMsg1");
    const msg2 = $("#emailMsg1");

    if($("#nameInput1").val() == "") {
        msg1.css("display", "block");
        msg1.text("* 이름을 입력해주세요.");

        return false;

    } else {
        msg1.css("display", "none");
        msg1.text("");
    }
    
    if($("#emailInput1").val() == "") {
        msg2.css("display", "block");
        msg2.text("* 이메일을 입력해주세요.");

        return false;
        
    } else {
        msg2.css("display", "none");
        msg2.text("");
    }
}