function findId() {
    const msg1 = $("#nameMsg1");
    const msg2 = $("#emailMsg1");

    if($("#nameInput1").val() == "") {
        msg1.css("display", "block");
        msg1.text("* 이름을 입력해주세요.");
        $("#nameInput1").focus();

        return false;

    } else {
        msg1.css("display", "none");
        msg1.text("");
    }
    
    if($("#emailInput1").val() == "") {
        msg2.css("display", "block");
        msg2.text("* 이메일을 입력해주세요.");
        $("#emailInput1").focus();

        return false;
        
    } else {
        msg2.css("display", "none");
        msg2.text("");
    }
}

function findPwd() {
    const msg1 = $("#nameMsg2");
    const msg2 = $("#idMsg");
    const msg3 = $("#emailMsg2");

    if($("#nameInput2").val() == "") {
        msg1.css("display", "block");
        msg1.text("* 이름을 입력해주세요.");
        $("#nameInput2").focus();

        return false;

    } else {
        msg1.css("display", "none");
        msg1.text("");
    }

    if($("#idInput").val() == "") {
        msg2.css("display", "block");
        msg2.text("* 아이디를 입력해주세요.");
        $("#idInput").focus();

        return false;
        
    } else {
        msg2.css("display", "none");
        msg2.text("");
    }

    if($("#emailInput2").val() == "") {
        msg3.css("display", "block");
        msg3.text("* 이메일을 입력해주세요.");
        $("#emailInput2").focus();

        return false;
        
    } else {
        msg3.css("display", "none");
        msg3.text("");
    }
}